/**
 * common.c
 * Purpose: Commonly used functions.
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

/*
      decd r1;
      mov r15, 0(r1)
loop: add #-1, 0(r1); r3 As==11
      cmp #-1, 0(r1); r3 As==11
      jnz $-8; abs loop
      incd r1;
      ret
*/
void delay(uint16_t count){
	volatile uint16_t i=count;
	while(i--);
}

