/**
 * profiler.h
 * Purpose: Header for making profile.
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

#ifndef __PROFILER_H
#define __PROFILER_H

typedef enum {
	FUNCTION,
	INTERRUPT	
} profiler_func_t;

/* A function or interrupt handler block of code. */
typedef struct {
	uint16_t startAddr;
	profiler_func_t type;
} profiler_func_block_t;

/* A function call. */
typedef struct {
	// location of the call
	uint16_t addr;
	// address of the function that is called
	uint16_t target;
} profiler_func_call_t;

/* An interrupt vector */
typedef struct {
	// location of the interrupt vector
	uint16_t addr;
	// address the vector points to
	uint16_t target;
} profiler_interrupt_vector_t;

typedef struct {
	uint16_t addr;
} profiler_return_t;

typedef struct {
	uint16_t addr;
} profiler_nop_event_t;

typedef enum {
	CALL_EVENT = 0,
	INTERRUPT_EVENT = 1,
	RETURN_EVENT = 2,
	NOP_EVENT = 3,
} profiler_event_type_t;

typedef struct {
	uint64_t usTime;	
	uint64_t adcCount;
	uint32_t adcSamples;
	uint16_t addr;
	uint16_t target;
	profiler_event_type_t eventType;
} profiler_event_t;

typedef struct {
	uint16_t msgType;
	profiler_event_t event;
} profiler_msg_t;

void initProfiler();

#define MAX_FUNC_BLOCKS 350
extern profiler_func_block_t funcBlocks[MAX_FUNC_BLOCKS];
extern uint16_t numFuncBlocks;

void profilerAddFuncBlock(uint16_t startAddr, profiler_func_t type);
void profilerAddFuncCall(uint16_t addr, uint16_t target);
void profilerAddInterruptVector(uint16_t addr, uint16_t target);
void profilerAddReturn(uint16_t addr);
void profilerAddNopEvent(uint16_t addr);
profiler_func_block_t* profilerGetFuncBlock(uint16_t addr);
profiler_func_call_t* profilerGetFuncCall(uint16_t addr);
profiler_interrupt_vector_t* profilerGetInterruptVector(uint16_t addr);
profiler_return_t* profilerGetReturn(uint16_t addr);
profiler_nop_event_t* profilerGetNopEvent(uint16_t addr);
void profilerPcEvent(uint16_t pc);
void profilerTriggerEvent(uint16_t addr);

#endif // #ifndef __PROFILER_H
