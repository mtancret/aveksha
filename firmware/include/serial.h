/**
 * serial.h
 * Purpose: Header for communication to client.
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

#ifndef __SERIAL_H
#define __SERIAL_H

#include <stdarg.h>
#include "common.h"

#define MAX_SERIAL_STR_LEN 24

#ifdef DEBUG
#define DEBUG_OUT(...) serialSendBlocking(__VA_ARGS__)
#else
#define DEBUG_OUT(...)
#endif // DEBUG

void initSerial();
bool_t serialSend(const char* format, ...);
bool_t serialSendByteArray(char* bytes, uint16_t len);
void serialSendBlocking(const char* format, ...);
void serialRxLineListen(void (*func)(char*, uint16_t));

#endif // __SERIAL_H
