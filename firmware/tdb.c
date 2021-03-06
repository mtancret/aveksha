/**
 * tdb.c
 * Purpose: Main file for TDB firmware.
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
#include "timer.h"
#include "serial.h"
#include "adc.h"
#include "interrupt.h"
#include "jtagshift.h"
#include "jtagtrace.h"
#include "tdbshell.h"

int main (void) {
	initClock(); // clock.h
	initSerial(); // serial.h
	initTimer(); // timer.h
	initADC(); // adc.h
	initInterrupt(); // interrupt.h
	initJtagShift(); // jtagshift.h
	initTdbShell(); // tdbshell.h

	tdbShellStart();

	return 0;
}
