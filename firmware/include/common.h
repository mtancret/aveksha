/**
 * common.h
 * Purpose: Header containing commonly used definitions.
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

#ifndef __COMMON_H
#define __COMMON_H

#include <iomacros.h>

/* handy when printing floats, because msp430-gcc does not implement %f in sprintf
   Warning: Currently only works for positive numbers. */
#define floatInt(f) ((uint16_t)f)
#define floatFrac(f) ((uint32_t)((f-floatInt(f))*100000))

#define BIT31 (1lu<<31)
#define BIT30 (1lu<<30)
#define BIT29 (1lu<<29)
#define BIT28 (1lu<<28)
#define BIT27 (1lu<<27)
#define BIT26 (1lu<<26)
#define BIT25 (1lu<<25)
#define BIT24 (1lu<<24)
#define BIT23 (1lu<<23)
#define BIT22 (1lu<<22)
#define BIT21 (1lu<<21)
#define BIT20 (1lu<<20)
#define BIT19 (1lu<<19)
#define BIT18 (1lu<<18)
#define BIT17 (1lu<<17)
#define BIT16 (1lu<<16)
#define BIT15 BITF
#define BIT14 BITE
#define BIT13 BITD
#define BIT12 BITC
#define BIT11 BITB
#define BIT10 BITA
// BIT9 to BIT0 defined in iomacros.h

typedef enum {
	FALSE = 0,
	TRUE = 1,
} bool_t;

typedef enum {
	SUCCESS = 0,
	FAIL = 1,
} error_t;

void delay(uint16_t count);

#endif /* #ifndef __COMMON_H */
