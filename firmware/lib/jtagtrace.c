/**
 * jtagtrace.c
 * Purpose: msp430 JTAG debug.
 * Author(s): Matthew Tan Creti
 *
 * Copyright 2011 Purdue University
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <string.h>
#include "timer.h"
#include "jtagshift.h"
#include "jtagdebug.h"
#include "jtagtrace.h"
#include "fpga.h"
#include "serial.h"
#include "profiler.h"
#include "tdbshell.h"

#ifdef TRACE_OPTIMIZED
#define IR_FRAME_START SAVETCLK;TMSUP;SETTCK;CLRTCK;SETTCK;TMSDOWN;\
		SETTCK;CLRTCK;SETTCK
#define DR_FRAME_START SAVETCLK;TMSUP;SETTCK;TMSDOWN;SETTCK;CLRTCK;SETTCK
// IR_DEBUG = 0x09
#define SHIFT_IR_DEBUG PRESET;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRESET;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLRLAST;SETTCK
#define SHIFT_IR_0x0C PRECLR;SETTCK;PRECLR;SETTCK;PRESET;SETTCK;PRESET;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLRLAST;SETTCK
// IR_CNTRL_SIG_CAPTURE = 0x14
#define SHIFT_IR_CNTRL_SIG_CAPTURE PRECLR;SETTCK;PRECLR;SETTCK;PRESET;SETTCK;PRECLR;SETTCK;\
		PRESET;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLRLAST;SETTCK
#define SHIFT_IR_CNTRL_ADDR_CAPTURE PRESET;SETTCK;PRECLR;SETTCK;PRESET;SETTCK;PRECLR;SETTCK;\
		PRESET;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLRLAST;SETTCK
// IR_ADDR_CAPTURE = 0x84
#define SHIFT_IR_ADDR_CAPTURE PRECLR;SETTCK;PRECLR;SETTCK;PRESET;SETTCK;PRECLR;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRESETLAST;SETTCK
#define SHIFT_DR_0x0000 PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLRLAST;SETTCK
#define SHIFT_DR_0x000F PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRESET;SETTCK;PRESET;SETTCK;PRESET;SETTCK;PRESETLAST;SETTCK
// DR_STATE_STORAGE_SET_ADDR = 0x009A
#define SHIFT_DR_STATE_STORAGE_SET_ADDR PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRESET;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRESET;SETTCK;\
		PRESET;SETTCK;PRECLR;SETTCK;PRESET;SETTCK;PRECLRLAST;SETTCK
// DR_STATE_STORAGE_START_READ = 0x009B
#define SHIFT_DR_STATE_STORAGE_START_READ PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRESET;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRESET;SETTCK;\
		PRESET;SETTCK;PRECLR;SETTCK;PRESET;SETTCK;PRESETLAST;SETTCK
// DR_STATE_STORAGE_SHIFT_NEXT = 0x009D
#define SHIFT_DR_STATE_STORAGE_SHIFT_NEXT PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;\
		PRESET;SETTCK;PRECLR;SETTCK;PRECLR;SETTCK;PRESET;SETTCK;\
		PRESET;SETTCK;PRESET;SETTCK;PRECLR;SETTCK;PRESETLAST;SETTCK
#define FRAME_END RESTORETCLK;CLRTCK;SETTCK;TMSDOWN;SETTCK
#endif // ifdef TRACE_OPTIMIZED

// machine codes
#define CALL                    0x12B0
// mov @SP+,PC0
#define RET                     0x4130
#define RETI                    0x1300
#define BR                      0x4030
#define NOP_EVENT_OP            0x4404
#define RESET_VECTOR_ADDR       0xFFFE

// address locations on msp430f1611
#define I2CDRW                  0x0076
#define U0RXBUF                 0x0076
#define U0TXBUF                 0x0077
#define U1RXBUF                 0x007E
#define U1TXBUF                 0x007F
#define FLASH                   0x4000
#define INTERRUPT_VECTOR_TABLE  0xFFE0

const jtag_trigger_t EMPTY_TRIGGER = {
	0x0000, // value
	0x0000, // flags
	0x0000, // mask
	0x0000, // terms
	FALSE, // breakpoint
	FALSE // watchpoint
};

const jtag_trigger_t U0RXBUF_TRIGGER = {
	U0RXBUF,
	TRIG_CTL_TYPE_MAB | TRIG_CTL_ACC_R | TRIG_CTL_OP_E, // MAB-R==
	0x0000, // no mask
	0x0001, // single term trigger
	FALSE, // breakpoint
	FALSE // watchpoint
};

const jtag_trigger_t U0TXBUF_TRIGGER = {
	U0TXBUF,
	TRIG_CTL_TYPE_MAB | TRIG_CTL_ACC_W | TRIG_CTL_OP_E, // MAB-W==
	0x0000, // no mask
	0x0001, // single term trigger
	FALSE, // breakpoint
	FALSE // watchpoint
};

const jtag_trigger_t CALL_TRIGGER = {
	CALL,
	TRIG_CTL_TYPE_MDB | TRIG_CTL_ACC_F | TRIG_CTL_OP_E, // MDB-F==
	0x0000, // no mask
	0x0001, // single term trigger
	FALSE, // breakpoint
	FALSE // watchpoint
};

const jtag_trigger_t RETURN_TRIGGER = {
	RET,
	TRIG_CTL_TYPE_MDB | TRIG_CTL_ACC_F | TRIG_CTL_OP_E, // MDB-F==
	0x0000, // no mask
	0x0001, // single term trigger
	FALSE, // breakpoint
	FALSE // watchpoint
};

const jtag_trigger_t INTERRUPT_TRIGGER = {
	INTERRUPT_VECTOR_TABLE,
	TRIG_CTL_TYPE_MAB | TRIG_CTL_ACC_R | TRIG_CTL_OP_GE, // MAB-R>=
	0x0000, // no mask
	0x0001, // single term trigger
	FALSE, // breakpoint
	FALSE // watchpoint
};

const jtag_trigger_t INTERRUPT_RETURN_TRIGGER = {
	RETI,
	TRIG_CTL_TYPE_MDB | TRIG_CTL_ACC_F | TRIG_CTL_OP_E, // MDB-F==
	0x0000, // no mask
	0x0001, // single term trigger
	FALSE, // breakpoint
	FALSE // watchpoint
};

const jtag_trigger_t USART_TX_FIRST_TRIGGER = {
	I2CDRW,
	TRIG_CTL_TYPE_MAB | TRIG_CTL_ACC_W | TRIG_CTL_OP_GE, // MAB-W>=
	0x0000, // no mask
	0x0003, // two term trigger
	FALSE, // breakpoint
	FALSE // watchpoint
};

const jtag_trigger_t USART_TX_LAST_TRIGGER = {
	U1TXBUF,
	TRIG_CTL_TYPE_MAB | TRIG_CTL_ACC_W | TRIG_CTL_OP_LE, // MAB-W<=
	0x0000, // no mask
	0x0000, // no trigger
	FALSE, // breakpoint
	FALSE // watchpoint
};

const jtag_trigger_t NOP_EVENT_TRIGGER = {
	NOP_EVENT_OP,
	TRIG_CTL_TYPE_MDB | TRIG_CTL_ACC_F | TRIG_CTL_OP_E, // MDB-F==
	//TRIG_CTL_TYPE_MAB | TRIG_CTL_ACC_W | TRIG_CTL_OP_E, // MAB-W==
	0x0000, // no mask
	0x0001, // single term trigger
	FALSE, // breakpoint
	FALSE // watchpoint
};

const jtag_trigger_t PC_TRIGGER = {
	0,
	TRIG_CTL_TYPE_MAB | TRIG_CTL_ACC_F | TRIG_CTL_OP_GE, // MAB-F>=
	0x0000, // no mask
	0x0001, // single term trigger
	FALSE, // breakpoint
	FALSE // watchpoint
};

trace_state_t traceState=TRACE_IDLE;

void setTraceTriggers() {
	jtag_trigger_t trigger;	

	memcpy(&trigger, &INTERRUPT_TRIGGER, sizeof(jtag_trigger_t));
	//trigger.terms = 1;
	trigger.watchpoint = TRUE;
	#if TRACE_METHOD_BREAKPOINT
	trigger.breakpoint = TRUE;
	#endif

	//trigger.value = 0x4ef6;
	jtagDebugSetTrigger(0, &trigger);

	memcpy(&trigger, &NOP_EVENT_TRIGGER, sizeof(jtag_trigger_t));
	trigger.watchpoint = TRUE;
	#if TRACE_METHOD_BREAKPOINT
	trigger.breakpoint = TRUE;
	#endif

	jtagDebugSetTrigger(0, &trigger);
}

/* Test triggers for the Blink app. */
void setBlinkTriggers() {
	jtag_trigger_t trigger;	

	memcpy(&trigger, &EMPTY_TRIGGER, sizeof(jtag_trigger_t));
	trigger.terms = 1;
	trigger.watchpoint = TRUE;
	#if TRACE_METHOD_BREAKPOINT
	trigger.breakpoint = TRUE;
	#endif

	trigger.value = 0x4714; // xor red light
	jtagDebugSetTrigger(0, &trigger);
	trigger.value = 0x4720; // xor green light
	jtagDebugSetTrigger(1, &trigger);
	trigger.value = 0x472C; // xor blue light
	jtagDebugSetTrigger(2, &trigger);
}

void setTestTriggers() {
	jtag_trigger_t trigger;	

	memcpy(&trigger, &EMPTY_TRIGGER, sizeof(jtag_trigger_t));
	trigger.terms = 1;
	trigger.watchpoint = TRUE;
	#if TRACE_METHOD_BREAKPOINT
	trigger.breakpoint = TRUE;
	#endif

	trigger.value = 0x81f6; 
	jtagDebugSetTrigger(0, &trigger);
	trigger.value = 0x822e;
	jtagDebugSetTrigger(1, &trigger);
	trigger.value = 0x823e;
	jtagDebugSetTrigger(2, &trigger);
	trigger.value = 0x8262;
	jtagDebugSetTrigger(3, &trigger);
	trigger.value = 0x8366;
	jtagDebugSetTrigger(4, &trigger);
}

void initJtagTrace() {
	traceState = TRACE_IDLE;

	//DEBUG_OUT("init jtag trace\n");
	serialSend("init jtag trace\n");
	delay(100);
	jtagDebugPor();
	jtagDebugTakeControlCpu();

	//DEBUG_OUT("reading program memory\n");
	serialSend("reading program memory\n");
	loadProgram();

	//DEBUG_OUT("setting triggers\n");
	serialSend("setting triggers\n");
	setTraceTriggers();
	//setTestTriggers();
	jtagDebugEnableStateStorage();
}

#ifdef TRACE_METHOD_PC_POLL
#ifdef TRACE_FPGA
typedef struct {
	uint16_t type;
	uint16_t address;
	uint64_t usTime;
} poll_msg_t;

//uint16_t addrBuff[8];
//uint16_t nextAddrBuff = 0;
void jtagTraceTrackStateStorage() {
	uint16_t pc;
	poll_msg_t msg;

	msg.type = 0x0300;

	SET_FPGA_MODE_POLL;
	//SET_FPGA_MODE_POLL_NO_LOOKUP;

	SET_FPGA_MODE_SELECT;

	//CLR_FPGA_POLL_CTS;
	//P2DIR|=FPGA_POLL_CTS;
	P2DIR&=~FPGA_POLL_RTS;
	P4DIR=0; // p4 is input data bus low byte
	P5DIR=0; // p5 is input data bus high byte

	CLR_FPGA_MODE_SELECT;

	while (1) {
		//uint64_t startTime = getUsTime();
		//while (getUsTime() - startTime < 10000000);

		SET_FPGA_POLL_CTS;
		while ((P2IN & FPGA_POLL_RTS) == 0);
		pc = P5IN << 8 | P4IN;	
		CLR_FPGA_POLL_CTS;

		msg.address = pc;
		msg.usTime = getUsTime() - msg.usTime;
		serialSendByteArray((char*)&msg, sizeof(poll_msg_t));

		//serialSend("x%04x\n", pc);
	}
}
#elif TRACE_OPTIMIZED // ifdef TRACE_FPGA
void jtagTraceTrackStateStorage() {
	uint16_t pc;

	while(traceState==TRACE_ACTIVE) {
  		//jtagShiftIR(IR_ADDR_CAPTURE);
		IR_FRAME_START; SHIFT_IR_ADDR_CAPTURE; FRAME_END;
		//pc = (uint16_t) jtagShiftDR(0x0000, DR16);
		DR_FRAME_START;
		PRECLR; SETTCK; pc = READTDO(BIT15);
		PRECLR; SETTCK; pc |= READTDO(BIT14);
		PRECLR; SETTCK; pc |= READTDO(BIT13);
		PRECLR; SETTCK; pc |= READTDO(BIT12);
		PRECLR; SETTCK; pc |= READTDO(BIT11);
		PRECLR; SETTCK; pc |= READTDO(BIT10);
		PRECLR; SETTCK; pc |= READTDO(BIT9);
		PRECLR; SETTCK; pc |= READTDO(BIT8);
		PRECLR; SETTCK; pc |= READTDO(BIT7);
		PRECLR; SETTCK; pc |= READTDO(BIT6);
		PRECLR; SETTCK; pc |= READTDO(BIT5);
		PRECLR; SETTCK; pc |= READTDO(BIT4);
		PRECLR; SETTCK; pc |= READTDO(BIT3);
		PRECLR; SETTCK; pc |= READTDO(BIT2);
		PRECLR; SETTCK; pc |= READTDO(BIT1);
		PRECLRLAST; SETTCK; pc |= READTDO(BIT0);
		FRAME_END;

		/* Blink example
		if (pc == 0x4714 || pc == 0x4720 || pc == 0x472c) {
			serialSend("x%04x\n", pc);
		}
		*/
		//serialSend("x%04x\n", profilerGetBlock(pc)->startAddr);
	}
}
#else // ifdef TRACE_OPTIMIZED
void jtagTraceTrackStateStorage() {
	uint16_t pc;

	while (1) {
		pc = jtagShiftID(IR_ADDR_CAPTURE, 0x0000);

		/* Blink example
		if (pc == 0x4714 || pc == 0x4720 || pc == 0x472c) {
			serialSend("x%04x\n", pc);
		}
		*/
		if (pc != 0x4518) {
			serialSend("x%04x\n", pc);//profilerGetBlock(pc)->startAddr);
		}
	}
}
#endif // ifdef TRACE_OPTIMIZED
#elif TRACE_METHOD_BREAKPOINT // ifdef TRACE_METHOD_PC_POLL
#ifdef TRACE_OPTIMIZED
void jtagTraceTrackStateStorage() {
	uint16_t pc;
	uint16_t status;
	uint16_t entry = 0;

	//jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_START_READ, 0x0000);
	IR_FRAME_START; SHIFT_IR_DEBUG; FRAME_END;
	DR_FRAME_START; SHIFT_DR_STATE_STORAGE_START_READ; FRAME_END;
	DR_FRAME_START; SHIFT_DR_0x0000; FRAME_END;

	while(traceState==TRACE_ACTIVE) {
		//status = jtagShiftID(IR_CNTRL_SIG_CAPTURE, 0x0000);
		IR_FRAME_START; SHIFT_IR_CNTRL_SIG_CAPTURE; FRAME_END;
		// we only care about CNTRL_SIG_TCE and CNTRL_SIG_TCE1 bits
		DR_FRAME_START;
		PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
		PRECLR; SETTCK; PRECLR; SETTCK;
		status = READTDO(BIT10);
		PRECLR; SETTCK; 
		status |= READTDO(BIT9);
		PRECLR; SETTCK;
		PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
		PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLRLAST; SETTCK;
		FRAME_END;

		if ((status & (CNTRL_SIG_TCE | CNTRL_SIG_TCE1)) == (CNTRL_SIG_TCE | CNTRL_SIG_TCE1)) {
			do {
				// Note: it appears that we cannot start at an odd address
				//jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_SET_ADDR, entry*4);
				IR_FRAME_START; SHIFT_IR_DEBUG; FRAME_END;
				DR_FRAME_START; SHIFT_DR_STATE_STORAGE_SET_ADDR; FRAME_END;
				DR_FRAME_START;
				PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
				PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
				PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
				if (entry&BIT2) PRESET; else PRECLR;
				SETTCK;
				if (entry&BIT1) PRESET; else PRECLR;
				SETTCK;
				if (entry&BIT0) PRESET; else PRECLR;
				SETTCK;
				PRECLR; SETTCK; PRECLRLAST; SETTCK;
				FRAME_END;

				//pc = jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_SHIFT_NEXT, 0x0000);
				IR_FRAME_START; SHIFT_IR_DEBUG; FRAME_END;
				DR_FRAME_START; SHIFT_DR_STATE_STORAGE_SHIFT_NEXT; FRAME_END;
				DR_FRAME_START;
				PRECLR; SETTCK; pc = READTDO(BIT15);
				PRECLR; SETTCK; pc |= READTDO(BIT14);
				PRECLR; SETTCK; pc |= READTDO(BIT13);
				PRECLR; SETTCK; pc |= READTDO(BIT12);
				PRECLR; SETTCK; pc |= READTDO(BIT11);
				PRECLR; SETTCK; pc |= READTDO(BIT10);
				PRECLR; SETTCK; pc |= READTDO(BIT9);
				PRECLR; SETTCK; pc |= READTDO(BIT8);
				PRECLR; SETTCK; pc |= READTDO(BIT7);
				PRECLR; SETTCK; pc |= READTDO(BIT6);
				PRECLR; SETTCK; pc |= READTDO(BIT5);
				PRECLR; SETTCK; pc |= READTDO(BIT4);
				PRECLR; SETTCK; pc |= READTDO(BIT3);
				PRECLR; SETTCK; pc |= READTDO(BIT2);
				PRECLR; SETTCK; pc |= READTDO(BIT1);
				PRECLRLAST; SETTCK; pc |= READTDO(BIT0);
				FRAME_END;

				//DEBUG_OUT("entry0x%04x pc0x%04x\n", entry, pc);
				profilerTriggerEvent(pc);
				entry = (entry+1)%8;
			} while(profilerGetReturn(pc) != NULL);

			//jtagDebugResumeCpu();
			//jtagShiftID(0x0C, 0x000F);
			IR_FRAME_START; SHIFT_IR_0x0C; FRAME_END;
			DR_FRAME_START; SHIFT_DR_0x000F; FRAME_END;
			//jtagShiftIR(IR_ADDR_CAPTURE);
			IR_FRAME_START; SHIFT_IR_ADDR_CAPTURE; FRAME_END;
			//jtagShiftIR(IR_CNTRL_SIG_RELEASE);
			IR_FRAME_START; SHIFT_IR_CNTRL_ADDR_CAPTURE; FRAME_END;
		}
	}

	//jtagDebugTakeControlCpu();
	jtagDebugReleaseDevice();
}
#else // ifdef TRACE_OPTIMIZED
void jtagTraceTrackStateStorage() {
	uint16_t pc;
	uint16_t status;
	uint16_t entry = 0;

	jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_START_READ, 0x0000);

	while(traceState==TRACE_ACTIVE) {
		status = jtagShiftID(IR_CNTRL_SIG_CAPTURE, 0x0000);

		if ((status & (CNTRL_SIG_TCE | CNTRL_SIG_TCE1)) == (CNTRL_SIG_TCE | CNTRL_SIG_TCE1)) {
			do {
				// Note: it appears that we cannot start at an odd address
				jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_SET_ADDR, entry*4);
				pc = jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_SHIFT_NEXT, 0x0000);

				DEBUG_OUT("entry0x%04x pc0x%04x\n", entry, pc);
				profilerTriggerEvent(pc);
				entry = (entry+1)%8;
			} while(profilerGetReturn(pc) != NULL);

			jtagDebugResumeCpu();
		}
	}

	//jtagDebugTakeControlCpu();
	jtagDebugReleaseDevice();
}
#endif // ifdef TRACE_OPTIMIZED
#elif TRACE_METHOD_WATCHPOINT
#ifdef TRACE_FPGA
typedef struct {
	uint16_t type;
	uint16_t address;
	uint64_t usTime;
} poll_msg_t;

void jtagTraceTrackStateStorage() {
	uint16_t pc;
	poll_msg_t msg;

	msg.type = 0x0300;

	jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_START_READ, 0x0000);

	SET_FPGA_MODE_POLL;
	//SET_FPGA_MODE_POLL_NO_LOOKUP;

	SET_FPGA_MODE_SELECT;

	//CLR_FPGA_POLL_CTS;
	//P2DIR|=FPGA_POLL_CTS;
	P2DIR&=~FPGA_POLL_RTS;
	P4DIR=0; // p4 is input data bus low byte
	P5DIR=0; // p5 is input data bus high byte

	CLR_FPGA_MODE_SELECT;

	// taking over serial transfer
	//DMA0CTL &= ~DMAIE; // disable interrupt

	while (1) {
		//uint64_t startTime = getUsTime();
		//while (getUsTime() - startTime < 100000);

		SET_FPGA_POLL_CTS;
		while ((P2IN & FPGA_POLL_RTS) == 0);
		pc = P5IN << 8 | P4IN;	
		CLR_FPGA_POLL_CTS;

		msg.address = pc;
		msg.usTime = getUsTime();
		serialSendByteArray((char*)&msg, sizeof(poll_msg_t));

		// unsafe speed hack!
		//DMA0SA = (char*)&msg; // source block address
		//DMA0SZ = sizeof(poll_msg_t); // Block size
		//DMA0CTL |= DMAEN; // start transfer

		//energyCountDown = 0;
	}
}
#elif TRACE_OPTIMIZED
void jtagTraceTrackStateStorage() {
	uint16_t entry = 0;
	uint16_t pc;

	//jtagShiftIR(IR_DEBUG);
	IR_FRAME_START; SHIFT_IR_DEBUG; FRAME_END;
	//jtagShiftDR(DR_STATE_STORAGE_START_READ, DR16);
	DR_FRAME_START; SHIFT_DR_STATE_STORAGE_START_READ; FRAME_END;
	//jtagShiftDR(0x0000, DR16);
	DR_FRAME_START; SHIFT_DR_0x0000; FRAME_END;

	while(traceState==TRACE_ACTIVE) {
		//uint16_t currentAddress = entry*4+2;
		uint16_t current = 1;

		while(current) {
			// Note: it appears that we cannot start at an odd address
			//jtagShiftIR(IR_DEBUG);
			IR_FRAME_START; SHIFT_IR_DEBUG; FRAME_END;
			//jtagShiftDR(DR_STATE_STORAGE_SET_ADDR, DR16);
			DR_FRAME_START; SHIFT_DR_STATE_STORAGE_SET_ADDR; FRAME_END;
			//jtagShiftDR(currentAddress=entry*4+2, DR16);
			DR_FRAME_START;
			PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
			PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
			PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
			if (entry&BIT2) PRESET; else PRECLR;
			SETTCK;
			if (entry&BIT1) PRESET; else PRECLR;
			SETTCK;
			if (entry&BIT0) PRESET; else PRECLR;
			SETTCK;
			PRESET; SETTCK; PRECLRLAST; SETTCK;
			FRAME_END;

			//jtagShiftIR(IR_DEBUG);
			IR_FRAME_START; SHIFT_IR_DEBUG; FRAME_END;
			//jtagShiftDR(DR_STATE_STORAGE_SHIFT_NEXT, DR16);
			DR_FRAME_START; SHIFT_DR_STATE_STORAGE_SHIFT_NEXT; FRAME_END;
			//jtagShiftDR(0x0000, DR16);
			DR_FRAME_START; SHIFT_DR_0x0000; FRAME_END;

			//jtagShiftIR(IR_DEBUG);
			IR_FRAME_START; SHIFT_IR_DEBUG; FRAME_END;
			//jtagShiftDR(DR_STATE_STORAGE_SHIFT_NEXT, DR16);
			DR_FRAME_START; SHIFT_DR_STATE_STORAGE_SHIFT_NEXT; FRAME_END;
			//current = jtagShiftDR(0x0000, DR16);
			DR_FRAME_START;
			PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
			PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
			PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
			PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; 
			PRECLRLAST; SETTCK; current = READTDO(BIT0);
			FRAME_END;
		}

		//jtagShiftIR(IR_DEBUG);
		IR_FRAME_START; SHIFT_IR_DEBUG; FRAME_END;
		//jtagShiftDR(DR_STATE_STORAGE_SET_ADDR, DR16);
		DR_FRAME_START; SHIFT_DR_STATE_STORAGE_SET_ADDR; FRAME_END;
		//jtagShiftDR(entry*4, DR16);
		DR_FRAME_START;
		PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
		PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
		PRECLR; SETTCK; PRECLR; SETTCK; PRECLR; SETTCK;
		if (entry&BIT2) PRESET; else PRECLR;
		SETTCK;
		if (entry&BIT1) PRESET; else PRECLR;
		SETTCK;
		if (entry&BIT0) PRESET; else PRECLR;
		SETTCK;
		PRECLR; SETTCK; PRECLRLAST; SETTCK;
		FRAME_END;

		//jtagShiftIR(IR_DEBUG);
		IR_FRAME_START; SHIFT_IR_DEBUG; FRAME_END;
		//jtagShiftDR(DR_STATE_STORAGE_SHIFT_NEXT, DR16);
		DR_FRAME_START; SHIFT_DR_STATE_STORAGE_SHIFT_NEXT; FRAME_END;
		//pc = jtagShiftDR(0x0000, DR16);
		DR_FRAME_START;
		PRECLR; SETTCK; pc = READTDO(BIT15);
		PRECLR; SETTCK; pc |= READTDO(BIT14);
		PRECLR; SETTCK; pc |= READTDO(BIT13);
		PRECLR; SETTCK; pc |= READTDO(BIT12);
		PRECLR; SETTCK; pc |= READTDO(BIT11);
		PRECLR; SETTCK; pc |= READTDO(BIT10);
		PRECLR; SETTCK; pc |= READTDO(BIT9);
		PRECLR; SETTCK; pc |= READTDO(BIT8);
		PRECLR; SETTCK; pc |= READTDO(BIT7);
		PRECLR; SETTCK; pc |= READTDO(BIT6);
		PRECLR; SETTCK; pc |= READTDO(BIT5);
		PRECLR; SETTCK; pc |= READTDO(BIT4);
		PRECLR; SETTCK; pc |= READTDO(BIT3);
		PRECLR; SETTCK; pc |= READTDO(BIT2);
		PRECLR; SETTCK; pc |= READTDO(BIT1);
		PRECLRLAST; SETTCK; pc |= READTDO(BIT0);
		FRAME_END;

		profilerTriggerEvent(pc);

		entry = (entry+1)%8;
	}
}
#else // ifdef TRACE_OPTIMIZED
void jtagTraceTrackStateStorage() { // watchpoints non-optimized
	uint16_t entry = 0;
	uint16_t pc;

	jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_START_READ, 0x0000);

	while(traceState==TRACE_ACTIVE) {
		uint16_t currentAddress = entry*4+2;
		uint16_t current = 1;

		while(current) {
			// Note: it appears that we cannot start at an odd address
			jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_SET_ADDR, currentAddress);
			jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_SHIFT_NEXT, 0x0000);
			current = jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_SHIFT_NEXT, 0x0000);
			if (current != 1) serialSend("%04x\n", current);
		}

		jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_SET_ADDR, entry*4);
		pc = jtagShiftIAD(IR_DEBUG, DR_STATE_STORAGE_SHIFT_NEXT, 0x0000);

		//profilerTriggerEvent(pc);
		serialSend("%04x %04x\n", pc, current);

		entry = (entry+1)%8;
	}
}
#endif // ifdef TRACE_OPTIMIZED
#endif // TRACE_METHOD_WATCHPOINT

void jtagTraceStart() {
	uint16_t resetAddr;

	DEBUG_OUT("release cpu\n");
	resetAddr = profilerGetInterruptVector(RESET_VECTOR_ADDR)->target;
	jtagDebugSetPc(resetAddr);
	traceState = TRACE_ACTIVE;
	//jtagDebugReleaseDevice();
	jtagDebugReleaseCPU();
	jtagDebugResumeCpu();

	jtagTraceTrackStateStorage();	
}

void jtagTraceStop() {
	traceState = TRACE_IDLE;
}
