/**
 * timer.c
 * Purpose: Configure the timers.
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
#include <signal.h>
#include "common.h"
#include "serial.h"
#include "timer.h"
#include "interrupt.h"

#ifdef MCLK_8MHZ
#define CYCLES_PER_MS 8000
#define CYCLES_PER_US 8
#elif MCLK_6MHZ
#define CYCLES_PER_MS 6000
#define CYCLES_PER_US 6
#elif MCLK_3MHZ
#define CYCLES_PER_MS 3000
#define CYCLES_PER_US 3
#endif

typedef struct {
	bool_t valid;
	void (*func)(); // the callback function
	uint16_t period; // timer period, 0 if timer is one-shot
	uint32_t next; // next time that timer should fire
} timer_listener_t;

uint32_t msTime;
timer_listener_t timerListeners[MAX_TIMER_LISTENERS];

/* Initialize the A and B timers. Assume SMCLK=MCLK.
   TimerA0 and TimerA1 are used to construct a timer callback service with a granularity of 1ms.
   TimerB0 outputs a signal with a period of 1ms that is used by adc.c. */
void initTimer() {
	msTime = 0;

	TACTL = TASSEL_2 | MC_1 | ID_0; // SMCLK, up mode, no div
	TBCTL = TBSSEL_2 | MC_1 | ID_0; // SMCLK, up mode, no div

	// init TimerA0 and TimerA1 to interrupt every 1ms
	TACCTL0 = CCIE; // CCR0 interrupt enabled
	TACCTL1 = CCIE; // CCR1 interrupt enabled
	TACCR0 = CYCLES_PER_MS; // value to count to
	TACCR1 = CYCLES_PER_MS; // value to count to

	// init TimerB1 with output period of 25us
	// used by adc to sample at 40ksps (20ksps per ADCx10 and ADCx105)
	TBCCTL0 = OUTMOD_4; // toggle output every time TBCCR0 is reached
	#ifdef MCLK_8MHZ
	TBCCR0 = 100; // value to count to, half of output period
	#elif MCLK_6MHZ // ifdef MCLK_8MHZ
	TBCCR0 = 75; // value to count to, half of output period
	#elif MCLK_3MHZ // elif MCLK_6MHZ
	TBCCR0 = 37; // value to count to, half of output period
	#endif // elif MCLK_3MHZ
}

void msTimerContinuous(void (*func)(), uint16_t ms) {
	uint16_t i;

	startCritical(); // to protect timerListeners

	for (i=0; i<MAX_TIMER_LISTENERS && timerListeners[i].valid == TRUE; i++);

	if (i<MAX_TIMER_LISTENERS) {
		timerListeners[i].valid = TRUE;
		timerListeners[i].func = func;
		timerListeners[i].period = ms;
		timerListeners[i].next = msTime + ms;
	} else {
		DEBUG_OUT("ERROR: overflow timerListeners\n");
	}

	endCritical();
}

void msTimerOneShot(void (*func)(), uint16_t ms) {
	uint16_t i;

	startCritical(); // to protect timerListeners

	for (i=0; i<MAX_TIMER_LISTENERS && timerListeners[i].valid == TRUE; i++);

	if (i<MAX_TIMER_LISTENERS) {
		timerListeners[i].valid = TRUE;
		timerListeners[i].func = func;
		timerListeners[i].period = 0; // indicates one-shot
		timerListeners[i].next = msTime + ms;
	} else {
		DEBUG_OUT("ERROR: overflow timerListeners\n");
	}

	endCritical();
}

void msTimerHalt(void (*func)()) {
	uint16_t i;

	startCritical(); // to protect timerListeners

	for (i=0; i<MAX_TIMER_LISTENERS; i++) {
		if (timerListeners[i].func == func) {
			timerListeners[i].valid = FALSE;
		}
	}

	endCritical();
}

/* Returns the time in milliseconds since power up. */
uint32_t getMsTime() {
	return msTime;
}

/* Returns the time in microseconds since power up. */
uint64_t getUsTime() {
	uint16_t tar;
	uint32_t recordMsTime;
	uint64_t usTime;

	//do {
		recordMsTime = msTime;
		tar = TAR;
	// TODO: this was causing infinite loop!?!?
	//} while (recordMsTime != msTime); // test that no rollover occured

	usTime = (tar / CYCLES_PER_US) + (recordMsTime * 1000);
	return usTime;
}

/* TimerA0 interrupt service routine. Interrupts every 1ms.
   TimerA0 has a deticated higer interrupt priority than TimerA1.
   So even if the TimerA1 interrupt rotine does not complete in
   1ms, this routine will still interrupt every 1ms. */
interrupt (TIMERA0_VECTOR) timera0_isr(void) {
	msTime++;

	// testing rate of timer
	//P5DIR|=BIT3;
	//P5OUT|=BIT3;
	//P5OUT&=~BIT3;
}

/* Timer A1 interrupt service routine. Interrupts every 1ms. */
interrupt (TIMERA1_VECTOR) timera1_isr(void) {
	uint16_t i;

	if ((TAIV & TAIV_CCR1) != 0) { /* must check that Timer A1 caused interrupt */
		for (i=0; i<MAX_TIMER_LISTENERS; i++) {
			if (timerListeners[i].valid == TRUE && timerListeners[i].next <= msTime) {
				timerListeners[i].func();

				if (timerListeners[i].period == 0) { // one-shot timer
					timerListeners[i].valid = FALSE;
				} else {
					timerListeners[i].next += timerListeners[i].period;
				}
			}
		}
	}
}
