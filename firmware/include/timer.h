/**
 * timer.h
 * Purpose: Header for timer.
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

#include "common.h"

#ifndef __TIMER_H
#define __TIMER_H

#define MAX_TIMER_LISTENERS 10

extern uint32_t msTime;

void initTimer();
void msTimerContinuous(void (*func)(), uint16_t ms);
void msTimerOneShot(void (*func)(), uint16_t ms);
void msTimerHalt(void (*func)());
uint32_t getMsTime();
uint64_t getUsTime();

#endif // #ifndef __TIMER_H
