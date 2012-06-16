/**
 * jtagdebug.c
 * Purpose: Implement debug protocol for msp430 jtag.
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

#include "jtagdebug.h"
#include "jtagshift.h"
#include "serial.h"

uint16_t watchpointEnable = 0;
uint16_t breakpointEnable = 0;

void jtagDebugPor() {
	uint16_t i;

	SETTMS;

	for (i=0; i<6; i++) {
		TCKTOCK;
	}

	CLRTCK;
	CLRTMS;
	SETTCK;

	SETTMS;
	CLRTMS;

	delay(100);

	SETTMS;
	CLRTMS;

	delay(100);

	SETTMS;

	for (i=0; i<6; i++) {
		TCKTOCK;
	}

	CLRTCK;
	CLRTMS;
	SETTCK;
}

void jtagDebugTakeControlCpu() {
	uint32_t cntrl=0;	

	while (cntrl != 0x2681) {
		jtagShiftIR(0xFF);
		jtagShiftIR(IR_CNTRL_SIG_16BIT);
		jtagShiftDR(0x2401, DR16);
		jtagShiftIR(IR_CNTRL_SIG_CAPTURE);
		jtagShiftIR(IR_CNTRL_SIG_CAPTURE);
		cntrl = jtagShiftDR(0x0000, DR16);
	}
}

void jtagDebugResumeCpu() {
	//jtagShiftIAD(0x0009, 0x0081, 0x0000);
	//jtagShiftIAD(0x0009, 0x0088, 0x000E);

	jtagShiftID(0x0C, 0x000F);
	jtagShiftIR(IR_ADDR_CAPTURE);
	jtagShiftIR(IR_CNTRL_SIG_RELEASE);
}

void jtagDebugReleaseCPU() {
	CLRTCLK;
	jtagShiftID(IR_CNTRL_SIG_16BIT, 0x2401);
	jtagShiftIR(IR_ADDR_CAPTURE);
	SETTCLK;
}

void jtagDebugReleaseDevice() {
	jtagShiftIAD(IR_CNTRL_SIG_16BIT, 0x2C01, 0x2401);
	jtagShiftIR(IR_CNTRL_SIG_RELEASE);
}

void jtagDebugSetPc(uint16_t addr) {
	jtagShiftID(IR_CNTRL_SIG_16BIT, 0x3401);
	jtagShiftID(IR_DATA_16BIT, 0x4030);
	SETTCLK;
	CLRTCLK;
	jtagShiftDR(addr, DR16);
	SETTCLK;
	CLRTCLK;
	SETTCLK;
	CLRTCLK;
	jtagShiftID(IR_CNTRL_SIG_16BIT, 0x2401);
}

void jtagDebugEnableStateStorage() {
	// enable state storage
	jtagShiftIAD(0x09, 0x009E, 0x0040);
	jtagShiftIAD(0x09, 0x009E, 0x0009);

	// set buffer wrap around
	jtagShiftIAD(0x09, 0x009E, 0x0040);
	jtagShiftIAD(0x09, 0x009E, 0x0001);
}

void jtagDebugStartReadMem() {
	CLRTCLK;
	jtagShiftID(IR_CNTRL_SIG_16BIT, 0x2409);
}

uint16_t jtagDebugReadMem(uint16_t addr) {
	jtagShiftID(IR_ADDR_16BIT, addr);
	jtagShiftIR(IR_DATA_TO_ADDR);
	SETTCLK;
	CLRTCLK;
	return jtagShiftDR(0x0000, DR16);
}

void jtagDebugEndReadMem() {
	SETTCLK;
}

void jtagDebugSetTrigger(uint16_t triggerNum, jtag_trigger_t* trigger) {
	uint16_t triggerBaseDR = triggerNum * DR_TRIGGER_OFFSET;

	jtagShiftIAD(IR_DEBUG, triggerBaseDR + DR_TRIGGER_VALUE_OFFSET, trigger->value);
	jtagShiftIAD(IR_DEBUG, triggerBaseDR + DR_TRIGGER_FLAGS_OFFSET, trigger->ctl);
	jtagShiftIAD(IR_DEBUG, triggerBaseDR + DR_TRIGGER_MASK_OFFSET, trigger->mask);

	jtagShiftIAD(IR_DEBUG, 0x0007, 0x0000);
	jtagShiftIAD(IR_DEBUG, 0x000F, 0x0000);
	jtagShiftIAD(IR_DEBUG, 0x0017, 0x0000);
	jtagShiftIAD(IR_DEBUG, 0x001F, 0x0000);
	jtagShiftIAD(IR_DEBUG, 0x0027, 0x0000);
	jtagShiftIAD(IR_DEBUG, 0x002F, 0x0000);
	jtagShiftIAD(IR_DEBUG, 0x0037, 0x0000);
	jtagShiftIAD(IR_DEBUG, 0x003F, 0x0000);

	jtagShiftIAD(IR_DEBUG, 0x0081, 0x0000);
	jtagShiftIAD(IR_DEBUG, triggerBaseDR + DR_TRIGGER_TERMS_OFFSET, (trigger->terms)<<triggerNum);

	if (trigger->breakpoint == TRUE) {
		breakpointEnable |= (1<<triggerNum);
	} else {
		breakpointEnable &= ~(1<<triggerNum);
	}
	jtagShiftIAD(IR_DEBUG, DR_TRIGGER_BREAKPOINT_ENABLE, breakpointEnable);

	jtagShiftIAD(IR_DEBUG, 0x0099, 0x0000);

	if (trigger->watchpoint == TRUE) {
		watchpointEnable |= (1<<triggerNum);
	} else {
		watchpointEnable &= ~(1<<triggerNum);
	}
	jtagShiftIAD(IR_DEBUG, DR_TRIGGER_WATCHPOINT_ENABLE, watchpointEnable);

	jtagShiftIAD(IR_DEBUG, 0x00A7, 0x0000);
};

