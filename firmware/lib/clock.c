/**
 * clock.c
 * Purpose: Set up the clocks.
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
#include "clock.h"

/* Sets the main clock to external XT2. */
void initClock() {
	uint8_t i;

	WDTCTL = WDTPW + WDTHOLD; // stop WDT

	BCSCTL2 |= SELM1 | SELS; // set main clock (MCLK) and sub-main clock (SMCLK) to XT2
	#ifdef MCLK_3MHZ
	BCSCTL2 |= DIVM_1 | DIVS_1; // set MCLK and SMCLK to half speed
	#endif // ifdef MCLK_3MHZ
	do {
		IFG1 &= ~OFIFG; // Clear OSCFault flag
		for (i=0; i<0xFF; i++); // Wait in case flag sets again
	} while ((IFG1 & OFIFG) != 0); // OSCFault flag is set again
}
