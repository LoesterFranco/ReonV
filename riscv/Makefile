################################################################################
#
# Author: Lucas Castro
# Last modification: april/2018
#
# 	Makefile for running programs on ReonV
#
################################################################################
#
# Update the following variables to your environment and board used

# Cross compiler (Must be RV32I only)
CROSS=../../riscv-gcc/bin/riscv32-unknown-elf-
GRMON=../../grmon-eval-3.0.9/linux/bin64/grmon
GRMON_OPTIONS=-digilent -u

# Design you are targeting
DESIGN=leon3-digilent-nexys4ddr


CC=gcc
AS=as
OBJCOPY=objcopy
CFLAGS=-nostdlib
OBJCPFLAGS=-O binary -j .text -j .data
LD_SCRIPT=ld_script
WRAP=-Wl,-wrap,exit,-wrap,open,-wrap,close,-wrap,write,-wrap,read,-wrap,lseek,-wrap,sbrk

################################################################################
#
# 	Targets for compiling
#
MAIN_OBJS=reonv_crt0.o mini_printf.o posix.o

# Compiled binary linked with reonv_crt0
#%.out : %.c reonv_crt0.o posix.o
#	${CROSS}${CC} -static  -static-libgcc -march=rv32i ${WRAP} -T${LD_SCRIPT} $< -o $@
%.out : $(MAIN_OBJS) %.o
	${CROSS}gcc -static -nostartfiles -march=rv32i $^ \
	${WRAP},-lm,--no-relax,-melf32lriscv,-Ttext=0x40001000,-e,__reonv_start -o $@
#	${WRAP},--verbose -Tlinker_script -o $@

# Targets for .S.
# .o is for linking programs (i.e. crt0.S)
# .hex is for other assembly programs
%.hex : %.S
	${CROSS}$(AS) $< -o $@

%.o : %.c
	${CROSS}${CC} -lm -march=rv32i -D TEST -c $< -o $@

#mini_printf.o : mini_printf.c
#	${CROSS}${CC} -c $< -o $@

posix.o : posix.c
	${CROSS}${CC} -c $< -o $@ -nostdlib

reonv_crt0.o : reonv_crt0.S
	${CROSS}${CC} -c $< -o $@ -nostdlib

# Target raw binary to avoid grmon2 errors saying this is not SPARC '-'
%.bin : %.out
	${CROSS}$(OBJCOPY) $(OBJCPFLAGS)  $< $@

%.bin : %.hex
	${CROSS}$(OBJCOPY) $(OBJCPFLAGS)  $< $@

# Make binaries readable
%.read : %.* ./tools/to_text.x86
	./tools/to_text.x86 $< $@

# Copy grmon-dump.bin from design directory
copy_dump : ../designs/$(DESIGN)/grmon-dump.bin
	cp ../designs/$(DESIGN)/grmon-dump.bin .

# Read dump from grmon
read_dump : copy_dump ./tools/to_text.x86
	./tools/to_text.x86 grmon-dump.bin grmon-dump.read
	rm grmon-dump.bin ./tools/*.x86 -f

################################################################################
#
#   Benchmarks
#
#
SRC := wcet_benchmark

SOURCES := $(wildcard $(SRC)/*.c)
TESTS := $(patsubst $(SRC)/%.c, $(SRC)/%.out, $(SOURCES))
X86 := $(patsubst $(SRC)/%.c, $(SRC)/%.x86, $(SOURCES))

tests: $(TESTS)
	@echo "Generated tests for ReonV"

x86: $(X86)
	@echo "Generated x86 to check correct output"

bench: tests x86
	@chmod +x tools/run_bench.sh
	@tools/run_bench.sh $(GRMON) $(GRMON_OPTIONS)

grmon_run :
	$(GRMON) $(GRMON_OPTIONS) -c grmon_script.txt -log grmon_log.txt -abaud 115200 > /dev/null

grmon_norun :
	$(GRMON) $(GRMON_OPTIONS) -c grmon_norun.txt > /dev/null

#$(SRC)/%.out: $(SRC)/%.c
#	$(CC) -I$(SRC) $< -o $@

$(SRC)/%.x86 : $(SRC)/%.c
	gcc $< -o $@ -lm


################################################################################
#
# 	Boot Code
#
# Adapted PROM generation based on original leon3 script (found at ../bin)
ahbrom.vhd : ahbrom boot_code.bin
	./ahbrom boot_code.bin ahbrom.vhd

bootcode : ahbrom.vhd
	cp ahbrom.vhd ../designs/${DESIGN}/ahbrom.vhd -f
	@echo "Generated ahbrom.vhd and placed at ../../designs/${DESIGN}"

ahbrom : ../bin/ahbrom.c
	gcc ../bin/ahbrom.c -o ahbrom

clean:
	rm -rf ahbrom* tools/*.x86 *.hex *.inv *.convert *.bin *.o *log *.jou *.str \
	$(SRC)/*.out $(SRC)/*.o $(SRC)/*.x86 $(SRC)/*.log *.out *.read grmon_log.txt \
	./tools/grmon_run ./tools/grmon_norun ./tools/res.* ./tools/to_text
