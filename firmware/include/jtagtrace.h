/**
 * jtagtrace.h
 * Purpose: Header for collecting trace over JTAG.
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

#ifndef __JTAGTRACE_H
#define __JTAGTRACE_H

typedef enum {
	TRACE_IDLE,
	TRACE_ACTIVE
} trace_state_t;	

void initJtagTrace();
void jtagTraceStart();
void jtagTraceStop();

#endif // #ifndef __JTAGTRACE_H