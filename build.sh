#!/bin/sh
set -eux

CC=${CC:-gcc}
CFLAGS="-O3 -Wall -Wextra -Werror -Wno-unused-parameter"

# asm (to analyse)
${CC} ${CFLAGS} -S -o interp_switch.S interp_switch.c
${CC} ${CFLAGS} -S -o interp_cgoto.S interp_cgoto.c
${CC} ${CFLAGS} -S -o interp_call.S interp_call.c
${CC} ${CFLAGS} -S -o interp_cgotow.S interp_cgotow.c
${CC} ${CFLAGS} -S -o interp_switchc.S interp_switchc.c
${CC} ${CFLAGS} -S -o interp_sgoto.S interp_sgoto.c

# compile
${CC} ${CFLAGS} -c -o interp_switch.o interp_switch.c
${CC} ${CFLAGS} -c -o interp_cgoto.o interp_cgoto.c
${CC} ${CFLAGS} -c -o interp_call.o interp_call.c
${CC} ${CFLAGS} -c -o interp_cgotow.o interp_cgotow.c
${CC} ${CFLAGS} -c -o interp_switchc.o interp_switchc.c
${CC} ${CFLAGS} -c -o interp_sgoto.o interp_sgoto.c

# main
${CC} ${CFLAGS} -c -o main.o main.c
${CC} ${CFLAGS} -c -DBENCH_SWITCH -o main_switch.o main.c
${CC} ${CFLAGS} -c -DBENCH_CGOTO -o main_cgoto.o main.c
${CC} ${CFLAGS} -c -DBENCH_CALL -o main_call.o main.c
${CC} ${CFLAGS} -c -DBENCH_CGOTOW -o main_cgotow.o main.c
${CC} ${CFLAGS} -c -DBENCH_SWITCHC -o main_switchc.o main.c
${CC} ${CFLAGS} -c -DBENCH_SGOTO -o main_sgoto.o main.c

# link
${CC} ${CFLAGS} -o main interp_switch.o interp_cgoto.o interp_call.o \
    interp_cgotow.o interp_switchc.o interp_sgoto.o main.o
${CC} ${CFLAGS} -o main_switch interp_switch.o main_switch.o
${CC} ${CFLAGS} -o main_cgoto interp_cgoto.o main_cgoto.o
${CC} ${CFLAGS} -o main_call interp_call.o main_call.o
${CC} ${CFLAGS} -o main_cgotow interp_cgotow.o main_cgotow.o
${CC} ${CFLAGS} -o main_switchc interp_switchc.o main_switchc.o
${CC} ${CFLAGS} -o main_sgoto interp_sgoto.o main_sgoto.o
echo all done
