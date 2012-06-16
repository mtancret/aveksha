/**
 * fpga.c
 * Purpose: Interface with the fpga.
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
#include "fpga.h"
#include "jtagshift.h"
#include "jtagdebug.h"
#include "jtagtrace.h"
#include "serial.h"
#include "profiler.h"

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

void uploadProgram() {
	uint16_t i;
	uint8_t saveP5DIR = P5DIR;
	uint8_t saveP4DIR = P4DIR;

	SET_FPGA_MODE_PROGRAM;
	SET_FPGA_MODE_SELECT;

	CLR_FPGA_PROGRAM_RESET;
	CLR_FPGA_PROGRAM_CLK;

	P4DIR=0xFF; // p4 is out data bus low byte
	P5DIR=0xFF; // p5 is out data bus high byte

	CLR_FPGA_MODE_SELECT;

	for (i=0; i<1024; i++) {
		if (i<numFuncBlocks) {
			serialSend("func x%04x\n", funcBlocks[i].startAddr);
			P5OUT = funcBlocks[i].startAddr >> 8;
			P4OUT = funcBlocks[i].startAddr;
		} else {
			P5OUT = 0xFF;
			P4OUT = 0xFF;
		}
		SET_FPGA_PROGRAM_CLK;
		CLR_FPGA_PROGRAM_CLK;
		SET_FPGA_PROGRAM_CLK;
		CLR_FPGA_PROGRAM_CLK;
	}

	SET_FPGA_MODE_DIRECT;
	SET_FPGA_MODE_SELECT;

	P5OUT = 0x00;
	P4OUT = 0x00;

	P5DIR = saveP5DIR;
	P4DIR = saveP4DIR;

	CLR_FPGA_MODE_SELECT;
}

/* Reads the program memory of the target device and populates
   the profiler with the structure of the program.
   
   Note: it is currently very specific to an MSP430F1611 and gcc. */
void loadProgram() {
	uint16_t addr;
	uint16_t data;

	initProfiler();
	jtagDebugStartReadMem();

	// Load the interrupt vector table
	for (addr=INTERRUPT_VECTOR_TABLE; addr!=0; addr+=2) {
		data = jtagDebugReadMem(addr);
		profilerAddInterruptVector(addr, data);
	}

	// Go the the target of the reset vector and scan
	// the code until a br instruction is found. The
        // target of the br is the start of main (at least
        // for gcc compiled program).
	addr = profilerGetInterruptVector(RESET_VECTOR_ADDR)->target;
	data = 0;
	while (data != BR) {
		data = jtagDebugReadMem(addr); 
		addr+=2;
	}
	// add main
	profilerAddFuncBlock(jtagDebugReadMem(addr), FUNCTION);

	for (; addr!=INTERRUPT_VECTOR_TABLE; addr+=2) {
		data = jtagDebugReadMem(addr);
		switch (data) {
			case CALL:
				data = jtagDebugReadMem(addr+2);
				//DEBUG_OUT("add call %04x\n", addr);
				profilerAddFuncCall(addr, data);
				addr+=2;
			break;
			case RET:
				//DEBUG_OUT("add ret %04x\n", addr);
				profilerAddReturn(addr);
			break;
			case RETI:
				//DEBUG_OUT("add reti %04x\n", addr);
				profilerAddReturn(addr);
			break;
			case NOP_EVENT_OP:
				profilerAddNopEvent(addr);
			break;
		}
	}

	jtagDebugEndReadMem();

	uploadProgram();
}

