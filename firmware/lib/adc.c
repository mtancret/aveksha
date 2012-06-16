/**
 * adc.c
 * Purpose: Contol of ADCs, used to count energy consumption of target.
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
#include "adc.h"
#include "interrupt.h"
#include "common.h"
#include "serial.h"

// 10 / 105 * 2^12 = 390.1
#define ADCX10_THRES 390

bool_t calibrated;
uint16_t adcx105_offset = 0;
uint16_t adcx10_offset = 0;
uint32_t sampleCount;
uint64_t adcx105_count;
uint64_t adcx10_count;
uint64_t adcCountExtX21;

void initADC() {
	calibrated = FALSE;	
	sampleCount = 0;
	adcx105_count = 0;
	adcx10_count = 0;
	adcCountExtX21 = 0;

	SETMOTE_CAL;
	P1DIR |= MOTE_CAL;
	P6DIR = 0x00; // set 6.0 to 6.7 to input
   	P6SEL = 0xFF; // set 6.0 to 6.7 to ADC12 function

	ADC12CTL0 = 
		#ifdef MCLK_8MHZ
		SHT0_DIV16 | SHT1_DIV16 // sample-and-hold timer period is 166ns(see ADC12 clock below) * 16 = 2.66us
		#endif // ifdef MCLK_8MHZ
		#ifdef MCLK_6MHZ
		SHT0_DIV16 | SHT1_DIV16 // sample-and-hold timer period is 166ns(see ADC12 clock below) * 16 = 2.66us
		#endif // ifdef MCLK_6MHZ
		#ifdef MCLK_3MHZ
		SHT0_DIV8 | SHT1_DIV8 // sample-and-hold timer period is 333ns(see ADC12 clock below) * 8 = 2.66us
		#endif // ifdef MCLK_3MHZ
		| REF2_5V | REFON | ADC12ON; // use 2.5V as Vref+, reference voltage on, ADC12 on 
	ADC12CTL1 =
		CSTARTADD_0 // start sequnce at conversion register memory 0
		| SHS_2 // sample-and-hold source TimerB1
		| SHP // sample-and-hold pulse mode
		#ifdef MCLK_8MHZ
		| ADC12SSEL_2 | ADC12DIV_0 // ADC12 clock frequency MCLK(6MHz) / 1 = 8MHz => period 125ns
		#endif // ifdef MCLK_8MHZ
		#ifdef MCLK_6MHZ
		| ADC12SSEL_2 | ADC12DIV_0 // ADC12 clock frequency MCLK(6MHz) / 1 = 6MHz => period 166ns
		#endif // ifdef MCLK_6MHZ
		#ifdef MCLK_3MHZ
		| ADC12SSEL_2 | ADC12DIV_0 // ADC12 clock frequency MCLK(3MHz) / 1 = 3MHz => period 333ns
		#endif // ifdef MCLK_3MHZ
		| CONSEQ_3; // repeat sequnce of channels

	ADC12MCTL[0] = SREF_1 | INCH_3; // Vref+ reference, adc channel 3
	ADC12MCTL[1] = SREF_1 | INCH_4;
	ADC12MCTL[2] = SREF_1 | INCH_3;
	ADC12MCTL[3] = SREF_1 | INCH_4;
	ADC12MCTL[4] = SREF_1 | INCH_3;
	ADC12MCTL[5] = SREF_1 | INCH_4;
	ADC12MCTL[6] = SREF_1 | INCH_3;
	ADC12MCTL[7] = SREF_1 | INCH_4;
	ADC12MCTL[8] = SREF_1 | INCH_3;
	ADC12MCTL[9] = SREF_1 | INCH_4;
	ADC12MCTL[10] = SREF_1 | INCH_3;
	ADC12MCTL[11] = SREF_1 | INCH_4;
	ADC12MCTL[12] = SREF_1 | INCH_3;
	ADC12MCTL[13] = SREF_1 | INCH_4;
	ADC12MCTL[14] = SREF_1 | INCH_3;
	ADC12MCTL[15] = SREF_1 | INCH_4 | EOS; // AVcc reference, channel 4, end of sequence

	ADC12IE = 0x8000; // Interrupt when conversion placed in ADC12MEM15
	ADC12CTL0 |= ENC; // enable conversion
}

void updateCounters() {
	uint16_t i;
	uint16_t new_adcx10_count = 0;
	uint16_t new_adcx105_count = 0;

	for (i=0; i<15; i+=2) {
		// only count completed conversions
		if (ADC12IFG & (1<<(i+1))) {
			uint16_t adcx105 = ADC12MEM[i];
			uint16_t adcx10 = ADC12MEM[i+1];

			if (adcx10 > ADCX10_THRES) {
				new_adcx10_count += adcx10 - adcx10_offset;
			} else if (adcx105 > adcx105_offset) {
				new_adcx105_count += adcx105 - adcx105_offset;
			}
			sampleCount++;
		}
	}

	// reduces the number of 64-bit operations
	adcx10_count += new_adcx10_count;
	adcx105_count += new_adcx105_count;
}

/* Gets adcCount normalized to x210 and adcSamples */
void getAdcCount(uint64_t* adcCount, uint32_t* adcSamples) {
	startCritical(); // maintain consistancy of counters

	if (calibrated) {
		updateCounters();
	}

	// normailize to x210
	*adcCount = adcx10_count*21 + adcx105_count*2;
	*adcSamples = sampleCount;

	endCritical();
}

/* ADC12 interrupt service routine. */
interrupt (ADC12_VECTOR) adc12_isr(void) {
	uint16_t i;

	if (ADC12IV == 0x24) { // interrupt is for ADC12MEM15
		if (calibrated == FALSE) {
			uint16_t adcx105, adcx10;
			uint16_t adcx105Min = 0, adcx105Max = 0;
			adcx105_offset = 0;
			adcx10_offset = 0;

			// get the average offset for both x105 and max105, and min and max of x105
			for (i=0; i<15; i+=2) {
				adcx105=ADC12MEM[i];
				adcx10=ADC12MEM[i+1];

				adcx105_offset+=adcx105;
				adcx10_offset+=adcx10;

				if (i == 0) {
					adcx105Min = adcx105;
					adcx105Max = adcx105;
				} else if (adcx105 < adcx105Min) {
					adcx105Min = adcx105;
				} else if (adcx105 > adcx105Max) {
					adcx105Max = adcx105;
				}
			}
			adcx105_offset = (adcx105_offset/8);
			adcx10_offset = (adcx10_offset/8);

			// only enter calibrated state if it appears Vref, switch, and amplifier have settled
			if (adcx105Max - adcx105Min < 5) {
				CLRMOTE_CAL;
				calibrated = TRUE;
			}
		} else {
			updateCounters();
		}

		// testing rate of timer
		//P5DIR|=BIT3;
		//P5OUT|=BIT3;
		//P5OUT&=~BIT3;
	}
	ADC12IFG = 0;
}
