/**
 * jtagshift.h
 * Purpose: Header for shifting JTAG data.
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

#ifndef __JTAGSHIFT_H
#define __JTAGSHIFT_H

// fpga stuff
#define FPGA_MODE0 BIT4
#define FPGA_MODE1 BIT5
#define FPGA_MODE_SELECT BIT6
#define FPGA_JTAG0 BIT7
#define FPGA_JTAG1 BIT0
#define FPGA_PROGRAM_RESET BIT7
//#define FPGA_PROGRAM_CLK BIT0
#define FPGA_PROGRAM_CLK BIT5
#define FPGA_POLL_RTS BIT7
//#define FPGA_POLL_CTS BIT0
#define FPGA_POLL_CTS BIT5

#define SET_FPGA_MODE_DIRECT P2OUT=(P2OUT&(~FPGA_MODE1))&(~FPGA_MODE0)
#define SET_FPGA_MODE_PROGRAM P2OUT=(P2OUT&(~FPGA_MODE1))|FPGA_MODE0
#define SET_FPGA_MODE_POLL P2OUT=(P2OUT|FPGA_MODE1)&(~FPGA_MODE0)
#define SET_FPGA_MODE_POLL_NO_LOOKUP P2OUT=P2OUT|FPGA_MODE1|FPGA_MODE0
#define SET_FPGA_MODE_SELECT P2OUT|=FPGA_MODE_SELECT
#define CLR_FPGA_MODE_SELECT P2OUT&=~FPGA_MODE_SELECT

#define SET_FPGA_JTAG0 P2OUT|=FPGA_JTAG0
#define SET_FPGA_JTAG1 P2OUT|=FPGA_JTAG1
#define SET_FPGA_PROGRAM_RESET P2OUT|=FPGA_PROGRAM_RESET
//#define SET_FPGA_PROGRAM_CLK P3OUT|=FPGA_PROGRAM_CLK
#define SET_FPGA_PROGRAM_CLK P2OUT|=FPGA_PROGRAM_CLK
//#define SET_FPGA_POLL_CTS P3OUT|=FPGA_POLL_CTS
#define SET_FPGA_POLL_CTS P2OUT|=FPGA_POLL_CTS

#define CLR_FPGA_JTAG0 P2OUT&=~FPGA_JTAG0
#define CLR_FPGA_JTAG1 P2OUT&=~FPGA_JTAG1
#define CLR_FPGA_PROGRAM_RESET P2OUT&=~FPGA_PROGRAM_RESET
//#define CLR_FPGA_PROGRAM_CLK P3OUT&=~FPGA_PROGRAM_CLK
#define CLR_FPGA_PROGRAM_CLK P2OUT&=~FPGA_PROGRAM_CLK
//#define CLR_FPGA_POLL_CTS P3OUT&=~FPGA_POLL_CTS
#define CLR_FPGA_POLL_CTS P2OUT&=~FPGA_POLL_CTS

// jtag on P5
#define TMS BIT0
#define TDI BIT1
#define TDO BIT2
#define TCK BIT3
#define TCLK TDI
// reset on P1
#define RST BIT6

#define SETTDI P5OUT|=TDI
#define SETTMS P5OUT|=TMS
#define SETTCK P5OUT|=TCK
#define SETTCLK P5OUT|=TCLK
#define SETRST P1OUT|=RST
#define CLRTDI P5OUT&=~TDI
#define CLRTMS P5OUT&=~TMS
#define CLRTCK P5OUT&=~TCK
#define CLRTCLK P5OUT&=~TCLK
#define TCKTOCK CLRTCK,SETTCK
#define CLRRST P1OUT&=~RST

// NOTE: To improve shifting speed we assume that outputs on all of P5 (0 to 7)
//       belong to jtag in the below definitions. For example, PRESET is not
//       P5OUT&=~TCK;P5OUT|=TDI, but simply P5OUT=TDI.
#define TMSUP P5OUT^=TMS|TCK
#define TMSDOWN P5OUT^=TMS|TCK
#define PRESET P5OUT=TDI
#define PRESETLAST P5OUT=TDI|TMS
#define PRECLR P5OUT=0
#define PRECLRLAST P5OUT=TMS
#define READTDO(b) (P5IN&TDO?b:0)
#define SAVETCLK savedtclk=P5OUT&TCLK
#define RESTORETCLK P5OUT=(P5OUT&~TCLK)|savedtclk

extern uint16_t savedtclk;

typedef enum {
	DR8=8,
	DR16=16,
	DR20=20
} jtag_dr_t;

void initJtagShift();
void delay(uint16_t count);
uint8_t jtagShiftIR(uint8_t in);
uint32_t jtagShiftDR(uint32_t in, jtag_dr_t type);
uint16_t jtagShiftID(uint16_t ir, uint16_t data);
uint16_t jtagShiftIAD(uint16_t ir, uint16_t addr, uint16_t data);

#endif // #ifndef __JTAGSHIFT_H
