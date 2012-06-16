# makefile
# set install target
TDB?=/dev/ttyUSB0

# select clock speed
#defines+=-DMCLK_3MHZ
#defines+=-DMCLK_6MHZ
defines+=-DMCLK_8MHZ

defines+=-DDEBUG

# optimizes trace polling loop for speed
#defines+=-DTRACE_OPTIMIZED
defines+=-DTRACE_FPGA
# default is to use watchpoints, this sets breakpoints
defines+=-DTRACE_METHOD_WATCHPOINT
#defines+=-DTRACE_METHOD_BREAKPOINT
#defines+=-DTRACE_METHOD_PC_POLL

includes=-I include
libs=lib/serial.o lib/adc.o lib/timer.o lib/clock.o lib/interrupt.o lib/common.o lib/tdbshell.o lib/jtagshift.o lib/jtagdebug.o lib/profiler.o lib/pld.o lib/jtagtrace.o
CC=msp430-gcc -Os -O -mdisable-hwmul -Wall -Wshadow -g -mmcu=msp430x1610 $(includes) $(defines)
app=tdb
#app=snoop
#app=blast
#app=sleep

$(app).ihex: $(app)
	mkdir -p build
	msp430-objcopy --output-target=ihex $(app) build/$(app).ihex

$(app): $(app).c $(libs)

#main: main.c
#	mkdir -p build
#	# note: be sure to set the correct mmcu, some TDB boards use msp430x1611 and some msp430x1610
#	msp430-gcc -mmcu=msp430x1610 -Os -O -mdisable-hwmul -Wall -Wshadow -o build/main.o main.c serial.c adc.c timer.c clock.c interrupt.c wdt.c jtag.c jtag430asm.S
#	msp430-objcopy --output-target=ihex build/main.o build/main.ihex

reinstall:
	tos-bsl -D --invert-test --invert-reset -e -r -I -c $(TDB) -p build/$(app).ihex

install: $(app).ihex reinstall

clean:
	rm -rf $(app) $(libs) build
