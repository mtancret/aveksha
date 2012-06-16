/**
 * jtagdebug.h
 * Purpose: Header for msp430 JTAG protocol for debugging.
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

#ifndef __JTAGDEBUG_H
#define __JTAGDEBUG_H

#include <signal.h>
#include <io.h>
#include "common.h"

typedef struct {
	uint16_t value;
	uint16_t ctl;
	uint16_t mask;
	uint16_t terms;
	bool_t breakpoint;
	bool_t watchpoint;
} jtag_trigger_t;

// jtag control signal register bits
#define CNTRL_SIG_RW BIT0
#define CNTRL_SIG_HALT_JTAG BIT3
#define CNTRL_SIG_BYTE BIT4
#define CNTRL_SIG_INSTR_LOAD BIT7
#define CNTRL_SIG_TCE BIT9
#define CNTRL_SIG_TCE1 BIT10
#define CNTRL_SIG_PUC BIT11
#define CNTRL_SIG_RELEASE_LOW_BYTE BIT12
#define CNTRL_SIG_TAGFUNCSAT BIT13
#define CNTRL_SIG_SWITCH BIT14

// IR addresses defined by TI documentation slaa149
#define IR_ADDR_16BIT                 0x83
#define IR_ADDR_CAPTURE               0x84
#define IR_DATA_TO_ADDR               0x85
#define IR_DATA_16BIT                 0x41
#define IR_DATA_QUICK                 0x43
#define IR_BYPASS                     0xFF
#define IR_CNTRL_SIG_16BIT            0x13
#define IR_CNTRL_SIG_CAPTURE          0x14
#define IR_CNTRL_SIG_RELEASE          0x15
#define IR_DATA_PSA                   0x44
#define IR_SHIFT_OUT_PSA              0x46
#define IR_PREPARE_BLOW               0x22
#define IR_EX_BLOW                    0x24

// IR and DR addresses obtained through reverse engineering
#define IR_DEBUG                      0x09
#define DR_TRIGGER_OFFSET             0x0008
#define DR_TRIGGER_VALUE_OFFSET       0x0000
#define DR_TRIGGER_FLAGS_OFFSET       0x0002
#define DR_TRIGGER_MASK_OFFSET        0x0004
#define DR_TRIGGER_TERMS_OFFSET       0x0006
#define DR_TRIGGER_BREAKPOINT_ENABLE  0x0080
#define DR_TRIGGER_WATCHPOINT_ENABLE  0x0098
#define DR_STATE_STORAGE_START_READ   0x009B
#define DR_STATE_STORAGE_SET_ADDR     0x009A
#define DR_STATE_STORAGE_SHIFT_NEXT   0x009D

// control for DR_TRIGGER_FLAGS_OFFSET
// type
#define TRIG_CTL_TYPE_MAB              0
#define TRIG_CTL_TYPE_MDB              1
// access
#define TRIG_CTL_ACC_F                 (0<<1)
#define TRIG_CTL_ACC_W                 (1<<1)
#define TRIG_CTL_ACC_RW                (2<<1)
#define TRIG_CTL_ACC_R                 (3<<1)
// operator
#define TRIG_CTL_OP_E                  (0<<3)
#define TRIG_CTL_OP_GE                 (1<<3)
#define TRIG_CTL_OP_LE                 (2<<3)
#define TRIG_CTL_OP_NE                 (3<<3)

void jtagDebugPor();
void jtagDebugTakeControlCpu();
void jtagDebugResumeCpu();
void jtagDebugReleaseCPU();
void jtagDebugReleaseDevice();
void jtagDebugSetPc(uint16_t addr);
void jtagDebugEnableStateStorage();
void jtagDebugSetTrigger(uint16_t triggerNum, jtag_trigger_t* trigger);
void jtagDebugStartReadMem();
uint16_t jtagDebugReadMem(uint16_t addr);
void jtagDebugEndReadMem();

#endif // #ifndef __JTAGDEBUG_H
