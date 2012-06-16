/**
 * profiler.c
 * Purpose: Profiling.
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
#include "serial.h"
#include "common.h"
#include "timer.h"
#include "adc.h"
#include "profiler.h"

#define MAX_FUNC_CALLS 1
#define MAX_INTERRUPT_VECTORS 16
#define MAX_RETURNS 1
#define MAX_NOP_EVENTS 1
#define MAX_STACK_SIZE 1

profiler_func_block_t funcBlocks[MAX_FUNC_BLOCKS];
profiler_func_call_t funcCalls[MAX_FUNC_CALLS];
profiler_interrupt_vector_t interruptVectors[MAX_INTERRUPT_VECTORS];
profiler_return_t returns[MAX_RETURNS];
profiler_nop_event_t nopEvents[MAX_NOP_EVENTS];
profiler_func_block_t* stack[MAX_STACK_SIZE];
uint16_t numFuncBlocks;
uint16_t numFuncCalls;
uint16_t numInterruptVectors;
uint16_t numReturns;
uint16_t numNopEvents;
uint16_t stackPointer;

void initProfiler() {
	numFuncBlocks = 0;
	numFuncCalls = 0;
	numInterruptVectors = 0;
	numReturns = 0;
	numNopEvents = 0;
	stackPointer = 0;
}

/* Adds block the list while maintaining list in increasing
   order of startAddr. Duplicates ignored. Increasing order
   maintained by simple insertion, good enough for now. */
void profilerAddFuncBlock(uint16_t startAddr, profiler_func_t type) {
	uint16_t i;

	// find where the block should be added
	for (i=0; i<numFuncBlocks; i++) {
		if (startAddr == funcBlocks[i].startAddr) {
			// duplicats ignored
			return;
		}
		if (startAddr < funcBlocks[i].startAddr) {
			break;
		}
	}

	if (numFuncBlocks == MAX_FUNC_BLOCKS) {
		DEBUG_OUT("ERROR: MAX_FUNC_BLOCKS exceeded.\n");
		return;
	}

	// make room for the block
	if (i != numFuncBlocks) { 
		memmove(&funcBlocks[i+1], &funcBlocks[i], sizeof(profiler_func_block_t)*(numFuncBlocks-i));
	}

	//DEBUG_OUT("funcBlock addr=%04x type=%04x\n", startAddr, type);
	funcBlocks[i].startAddr = startAddr;
	funcBlocks[i].type = type;
	numFuncBlocks++;	
}

void profilerAddFuncCall(uint16_t addr, uint16_t target) {
	if (numFuncCalls < MAX_FUNC_CALLS) {
		//DEBUG_OUT("funcCall addr=%04x target=%04x\n", addr, target);
/*
		funcCalls[numFuncCalls].addr = addr;
		funcCalls[numFuncCalls].target = target;
		numFuncCalls++;
*/

		profilerAddFuncBlock(target, FUNCTION);
	} else {
		DEBUG_OUT("ERROR: MAX_FUNC_CALLS exceeded.\n");
	}
}

void profilerAddInterruptVector(uint16_t addr, uint16_t target) {
	if (numInterruptVectors < MAX_INTERRUPT_VECTORS) {
		//DEBUG_OUT("intVector addr=%04x target=%04x\n", addr, target);
		interruptVectors[numInterruptVectors].addr = addr;
		interruptVectors[numInterruptVectors].target = target;
		numInterruptVectors++;

		profilerAddFuncBlock(target, INTERRUPT);
	} else {
		DEBUG_OUT("ERROR: MAX_INTERRUPT_VECTORS exceeded.\n");
	}
}

void profilerAddReturn(uint16_t addr) {
	if (numReturns < MAX_RETURNS) {
		//DEBUG_OUT("return addr=%04x\n", addr);
/*
		returns[numReturns].addr = addr;
		numReturns++;
*/
	} else {
		DEBUG_OUT("ERROR: MAX_RETURNS exceeded.\n");
	}
}

void profilerAddNopEvent(uint16_t addr) {
	if (numNopEvents < MAX_NOP_EVENTS) {
/*
		nopEvents[numNopEvents].addr = addr;
		numNopEvents++;
*/
	} else {
		DEBUG_OUT("ERROR: MAX_NOP_EVENTS exceeded.\n");
	}
}

profiler_func_call_t* profilerGetFuncCall(uint16_t addr) {
	uint16_t i;

	for (i=0; i<numFuncCalls; i++) { 
		if (addr == funcCalls[i].addr) {
			return &funcCalls[i];
		}
	}

	return NULL;
}

profiler_interrupt_vector_t* profilerGetInterruptVector(uint16_t addr) {
	uint16_t i;

	for (i=0; i<numInterruptVectors; i++) { 
		if (addr == interruptVectors[i].addr) {
			return &interruptVectors[i];
		}
	}

	return NULL;
}

profiler_return_t* profilerGetReturn(uint16_t addr) {
	uint16_t i;

	for (i=0; i<numReturns; i++) { 
		if (addr == returns[i].addr) {
			return &returns[i];
		}
	}

	return NULL;
}

profiler_nop_event_t* profilerGetNopEvent(uint16_t addr) {
	uint16_t i;

	for (i=0; i<numNopEvents; i++) {
		if (addr == nopEvents[i].addr) {
			return &nopEvents[i];
		}
	}

	return NULL;
}

void push(profiler_func_block_t* block) {
	if (stackPointer == MAX_STACK_SIZE) {
		DEBUG_OUT("ERROR: Stack is full.\n");
		return;
	}

	stack[stackPointer] = block;
	stackPointer++;
}

profiler_func_block_t* pop() {
	if (stackPointer == 0) {
		return NULL;
	}

	stackPointer--;
	return stack[stackPointer];
}

profiler_func_block_t* peek() {
	if (stackPointer == 0) {
		return NULL;
	}

	return stack[stackPointer-1];
}

profiler_func_block_t* profilerGetFuncBlock(uint16_t addr) {
	uint16_t i;

	for (i=0; i<numFuncBlocks-1; i++) {
		if (addr >= funcBlocks[i].startAddr && addr < funcBlocks[i+1].startAddr) {
			break;
		}
	}

	return &funcBlocks[i];
}

uint64_t startTime, endTime;
uint16_t totalTime;

void profilerEvent(profiler_event_type_t eventType, uint16_t addr, uint16_t target) {
	profiler_msg_t eventMsg;

	eventMsg.msgType = 0x0200;
	eventMsg.event.usTime = getUsTime();
	getAdcCount(&eventMsg.event.adcCount, &eventMsg.event.adcSamples);

	eventMsg.event.eventType = eventType;
	eventMsg.event.addr = addr;
	eventMsg.event.target = target;

	startTime = getUsTime();

	serialSendByteArray((char*)&eventMsg, sizeof(profiler_msg_t));

/*
	endTime = getUsTime();
	totalTime = endTime - startTime;
	serialSend("t%u\n", totalTime);
*/
}

void profilerPcEvent(uint16_t pc) {
}

void profilerTriggerEvent(uint16_t addr) {
	profiler_func_block_t* funcBlock;
	profiler_func_call_t* funcCall;
	profiler_interrupt_vector_t* interruptVector;
	profiler_return_t* ret;
	profiler_nop_event_t* nop;

	// is this the address of a call
	funcCall = profilerGetFuncCall(addr);
	if (funcCall != NULL) {
		funcBlock = profilerGetFuncBlock(funcCall->target);
		push(funcBlock);
		profilerEvent(CALL_EVENT, addr, funcCall->target);
		return;
	}

	// is this the address of an interrupt vector
	interruptVector = profilerGetInterruptVector(addr);
	if (interruptVector != NULL) {
		funcBlock = profilerGetFuncBlock(interruptVector->target);
		push(funcBlock);
		profilerEvent(INTERRUPT_EVENT, addr, interruptVector->target);
		return;
	}

	// is this the address of a return
	ret = profilerGetReturn(addr);
	if (ret != NULL) {
		funcBlock = pop();
		if (funcBlock == NULL) {
			DEBUG_OUT("ERROR: missing stack %04x\n", addr);
		} else {
			profilerEvent(RETURN_EVENT, addr, funcBlock->startAddr);
		}
		return;
	}

	// is this the addrss of a nop event
	nop = profilerGetNopEvent(addr);
	if (nop != NULL) {
		profilerEvent(NOP_EVENT, addr, 0);
		return;
	}

	DEBUG_OUT("ERROR: unknown addr %04x\n", addr);
}
