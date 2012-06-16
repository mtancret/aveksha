/**
 * tdbshell.c
 * Purpose: A simple shell.
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
#include "adc.h"
#include "timer.h"
#include "jtagshift.h"
#include "jtagtrace.h"
#include "tdbshell.h"

typedef enum {
	SHELL_IDLE,
	SHELL_TRACE,
} shell_state_t;

shell_state_t shellState;

typedef struct {
	uint16_t type;
	uint64_t usTime;	
	uint64_t adcCount;
	uint32_t adcSamples;
} energy_msg_t;

//uint16_t energyCountDown = 0;
void sendEnergy() {
	energy_msg_t msg;

	//if (energyCountDown > 0) {
	//	energyCountDown--;
	//	return;
	//}
	//energyCountDown = 20;

	msg.type = 0x0100;
	msg.usTime = getUsTime();
	getAdcCount(&msg.adcCount, &msg.adcSamples);

	serialSendByteArray((char*)&msg, sizeof(energy_msg_t));
}

void tdbShellRx(char* command, uint16_t len) {
	//if (memcmp(command,"start trace",11) == 0) {
	if (shellState == SHELL_IDLE) {
		shellState = SHELL_TRACE;
	//} else if (memcmp(command,"\d",1) == 0) {
	} else {
		shellState = SHELL_IDLE;
		msTimerHalt(&sendEnergy);
		jtagTraceStop();	
	}
}

void initTdbShell() {
	shellState = SHELL_IDLE;
	serialRxLineListen(&tdbShellRx);
}

void tdbShellStart() {
	serialSend("TDBShell started\n");
	while(1) {
		switch (shellState) {
			case SHELL_IDLE:
				break;
			case SHELL_TRACE:
				initJtagTrace();
				msTimerContinuous(&sendEnergy, 2);
				jtagTraceStart();
				break;
		}
	}
}
