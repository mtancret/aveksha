/**
 * serial.c
 * Purpose: Serial communcation to client.
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
#include <string.h>
#include <signal.h>
#include <stdio.h>
#include "serial.h"
#include "interrupt.h"

#define SERIAL_BUFFER_SIZE 125

typedef enum {
	SERIAL_UNINIT,
	SERIAL_IDLE,
	SERIAL_SENDING
} serial_state_t;

typedef struct {
	char str[MAX_SERIAL_STR_LEN];
	uint16_t len;
} serial_buffer_t;

serial_state_t serialState = SERIAL_UNINIT; // state of the serial module
serial_buffer_t serialBuffer[SERIAL_BUFFER_SIZE];
uint16_t readIdx;
uint16_t writeIdx;
bool_t bufferEmpty;
serial_buffer_t serialBlockedBuffer;

/* Initialize the serial interface UART1 for 115200bps. */
void initSerial() {
	serialState = SERIAL_UNINIT;

	UCTL1 &= ~SWRST; // init UART state machine
	UCTL1 |= SWRST; // init UART state machine
	P3SEL |= BIT6 | BIT7; // P3.6,7 = USART1 TXD/RXD
	UCTL1 |= CHAR; // sending 8-bit character
	UTCTL1 |= SSEL1; // selects UCLK = SMCLK for TXD
	ME2 |= UTXE1 | URXE1; // enable UART1 TXD and RXD
	UCTL1 &= ~SWRST; // init UART state machine
	U1IE |= URXIE1; // enable rx interrupt
	// UBR and UMCTL computed with http://mspgcc.sourceforge.net/baudrate.html 3000000Hz 115200bps
	#ifdef MCLK_3MHZ
	UBR01=0x1A;
	UBR11=0x00;
	UMCTL1=0x00;
	#endif // ifdef MCLK_3MHZ
	// UBR and UMCTL computed with http://mspgcc.sourceforge.net/baudrate.html 6000000Hz 115200bps
	#ifdef MCLK_6MHZ
	UBR01=0x34;
	UBR11=0x00;
	UMCTL1=0x20;
	#endif // ifdef MCLK_6MHZ
	// UBR and UMCTL computed with http://mspgcc.sourceforge.net/baudrate.html 8000000Hz 115200bps
	#ifdef MCLK_8MHZ
	//UBR01=0x45;
	//UBR11=0x00;
	//UMCTL1=0xAA;
	// 1000000bps
	UBR01=0x08;
	UBR11=0x00;
	UMCTL1=0x00;
	#endif // ifdef MCLK_8MHZ

	DMACTL0 = DMA0TSEL_10; // DMA0 triggered on UTXIFG1
	DMA0DA = (uint16_t)&U1TXBUF; // dest single address
	DMA0CTL = DMASRCINCR_3 | DMASBDB | DMALEVEL | DMAIE; // inc src, level sensitive, enable interrupt

	readIdx = 0;
	writeIdx = 0;
	bufferEmpty = TRUE;
	
	serialState = SERIAL_IDLE;
}

/* Sends a formated message over serial. Returns as soon as message is scheduled.
*/
bool_t serialSend(const char* format, ...) {
	bool_t success = FALSE;

	startCritical(); // to protect serialBuffer and serialState
	if ((writeIdx != readIdx) || bufferEmpty) {
		va_list args;

		va_start(args, format);
		serialBuffer[writeIdx].len = vsprintf(serialBuffer[writeIdx].str, format, args);
		va_end(args);

		bufferEmpty = FALSE;
		writeIdx = (writeIdx + 1) % SERIAL_BUFFER_SIZE;

		if (serialState == SERIAL_IDLE) {
			serialState = SERIAL_SENDING;
			DMA0SA = (uint16_t)serialBuffer[readIdx].str; // source block address
			DMA0SZ = serialBuffer[readIdx].len; // Block size
			DMA0CTL |= DMAEN; // start transfer
		}

		success = TRUE;
	}
	endCritical();

	return success;
}

/* Sends a byte array over serial. Returns as soon as message is scheduled.
*/
bool_t serialSendByteArray(char* bytes, uint16_t len) {
	bool_t success = FALSE;

	startCritical(); // to protect serialBuffer and serialState
	if ((writeIdx != readIdx) || bufferEmpty) {
		memcpy(serialBuffer[writeIdx].str, bytes, len);
		serialBuffer[writeIdx].len = len;

		bufferEmpty = FALSE;
		writeIdx = (writeIdx + 1) % SERIAL_BUFFER_SIZE;

		if (serialState == SERIAL_IDLE) {
			serialState = SERIAL_SENDING;
			DMA0SA = (uint16_t)serialBuffer[readIdx].str; // source block address
			DMA0SZ = serialBuffer[readIdx].len; // Block size
			DMA0CTL |= DMAEN; // start transfer
		}

		success = TRUE;
	}
	endCritical();

	return success;
}

/* A blocking version of serialSend. Does not return until message starts sending.
   Useful for debugging. */
void serialSendBlocking(const char* format, ...) {
	va_list args;

	startCritical(); // to protect serialBuffer and serialState

	// block as long as buffer is not empty
	while (!bufferEmpty) {
		endCritical();
		// interrupts can execute here
		startCritical();
	}

	va_start(args, format);
	serialBuffer[writeIdx].len = vsprintf(serialBuffer[writeIdx].str, format, args);
	va_end(args);

	readIdx = writeIdx;
	bufferEmpty = FALSE;
	writeIdx = (writeIdx + 1) % SERIAL_BUFFER_SIZE;

	serialState = SERIAL_SENDING;
	DMA0SA = (uint16_t)serialBuffer[readIdx].str; // source block address
	DMA0SZ = serialBuffer[readIdx].len; // Block size
	DMA0CTL |= DMAEN; // start transfer

	// block until transfer is complete
	//while (!(DMA0CTL & DMAIFG));

	endCritical();
}

/* DMA0 interrupt service routine. */
interrupt (DACDMA_VECTOR) dacdma_isr(void) {
	DMA0CTL &= ~DMAIFG; // Clear DMA0 interrupt flag

	readIdx = (readIdx + 1) % SERIAL_BUFFER_SIZE;

	if (readIdx == writeIdx) {
		serialState = SERIAL_IDLE;
		bufferEmpty = TRUE;
	} else {
		serialState = SERIAL_SENDING;
				
		DMA0SA = (uint16_t)serialBuffer[readIdx].str; // source block address
		DMA0SZ = serialBuffer[readIdx].len; // Block size
		DMA0CTL |= DMAEN; // start transfer
	}
}

void (*rxLineListener)(char*, uint16_t);
char incoming[MAX_SERIAL_STR_LEN];
uint16_t incomingByte=0;

void serialRxLineListen(void (*func)(char*, uint16_t)) {
	rxLineListener = func;	
}

/* UART1 rx interrupt service routine. */
interrupt (UART1RX_VECTOR) uart1rx_isr(void) {
	char rx = RXBUF1;

	if (rx == '\n' || incomingByte == MAX_SERIAL_STR_LEN - 1) {
		incoming[incomingByte] = 0; // terminate the string
		rxLineListener(incoming, incomingByte + 1);
		incomingByte = 0;
	}

	if (rx != '\n') {
		incoming[incomingByte] = rx;	
		incomingByte++;
	}
}
