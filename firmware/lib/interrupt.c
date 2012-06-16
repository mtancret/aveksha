/**
 * interrupt.c
 * Purpose: Deal with interrupts.
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

#include <msp430x16x.h>
#include "interrupt.h"

uint16_t criticalMutex;

/* Initialize global interrupts. */
void initInterrupt() {
	criticalMutex = 0;

	//_BIS_SR(LPM0_bits + GIE); // low power mode 0, enable global interrupt
	_BIS_SR(GIE); // enable global interrupt
}

void startCritical() {
	_BIC_SR(GIE);
	criticalMutex++;
}

void endCritical() {
	if (criticalMutex > 0) {
		criticalMutex--;
	}

	if (criticalMutex == 0) {
		_BIS_SR(GIE);
	}
}
