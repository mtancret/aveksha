/**
 * jtagshift.c
 * Purpose: Implement data shift for jtag.
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

/* Implements jtag shifting (IR, DR8, DR16, and DR20) in software. */
#include <signal.h>
#include <io.h>
#include "jtagshift.h"
#include "common.h"
#include "serial.h"

// extern
uint16_t savedtclk=0;

void initJtagShift(){
	CLR_FPGA_MODE_SELECT;
	CLR_FPGA_JTAG0;
	CLR_FPGA_JTAG1;

	// fpga outputs
	P2DIR|=FPGA_MODE0|FPGA_MODE1|FPGA_MODE_SELECT/*|FPGA_JTAG0*/;
	P3DIR|=FPGA_JTAG1;

	// set the mode
	SET_FPGA_MODE_DIRECT;
	SET_FPGA_MODE_SELECT;
	CLR_FPGA_MODE_SELECT;

	SETTDI;
	SETTMS;
	SETTCK;
	P5DIR|=TDI+TCK+TMS;
	//P1DIR|=RST;
	P5DIR&=~TDO;

	//SETRST;
	//CLRRST;
}

/* Shifts instruction register (IR). */
uint8_t jtagShiftIR(uint8_t in){
	uint8_t out = 0;
	uint8_t bit;

	SAVETCLK;

	TMSUP;
	SETTCK;
	CLRTCK;
	SETTCK;
	TMSDOWN;	
	SETTCK;
	CLRTCK;
	SETTCK;

	for (bit=BIT0; bit<BIT7; bit<<=1) {
		if (in&bit) PRESET; else PRECLR;
		SETTCK;
		out |= READTDO(bit);
	}
	if (in&BIT7) PRESETLAST; else PRECLRLAST;
	SETTCK;
	out |= READTDO(BIT7);
  
	RESTORETCLK;
  
	CLRTCK;
	SETTCK;
	TMSDOWN;
	SETTCK;

	return out;
}

/* Shifts data register (DR). */
uint32_t jtagShiftDR(uint32_t in, jtag_dr_t type){
	uint32_t out = 0;
	uint16_t bit;

	SAVETCLK;

	TMSUP;
	SETTCK;
	TMSDOWN;	
	SETTCK;
	CLRTCK;
	SETTCK;

	if (type == DR20) {
		uint32_t bitlu;
		for (bitlu=BIT19; bitlu>BIT15; bitlu>>=1) {
			if (in&bitlu) PRESET; else PRECLR;
			SETTCK;
			out |= READTDO(bitlu);
		}
	}
	if (type >= DR16) {
		for (bit=BIT15; bit>BIT7; bit>>=1) {
			if (in&bit) PRESET; else PRECLR;
			SETTCK;
			out |= READTDO(bit);
		}
	}
	for (bit=BIT7; bit>BIT0; bit>>=1) {
		if (in&bit) PRESET; else PRECLR;
		SETTCK;
		out |= READTDO(bit);
	}
	if (in&BIT0) PRESETLAST; else PRECLRLAST;
	SETTCK;
	out |= READTDO(BIT0);
  
	RESTORETCLK;
  
	CLRTCK;
	SETTCK;
	TMSDOWN;
	SETTCK;

	return out;
}

/* Shortcut for commonly repeated sequnce:
   jtagShiftIR(ir);
   jtagShiftDR(data, DR16);

   Returns output of the last jtagShiftDR(data, DR16). */
uint16_t jtagShiftID(uint16_t ir, uint16_t data) {
	jtagShiftIR(ir);
	return (uint16_t) jtagShiftDR(data, DR16);
}

/* Shortcut for commonly repeated sequnce:
   jtagShiftIR(ir);
   jtagShiftDR(addr, DR16);
   jtagShiftDR(data, DR16);

   Returns out of the last jtagShiftDR(data, DR16). */
uint16_t jtagShiftIAD(uint16_t ir, uint16_t addr, uint16_t data) {
	jtagShiftIR(ir);
	jtagShiftDR(addr, DR16);
	return (uint16_t) jtagShiftDR(data, DR16);
}
