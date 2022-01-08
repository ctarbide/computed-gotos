#!/bin/sh
set -eux
CFLAGS="-std=c99 -O2 -Wall -Wextra -Werror -Wno-unused-parameter"
# compile
gcc ${CFLAGS} -c -o interp_switch.o interp_switch.c
gcc ${CFLAGS} -c -o interp_cgoto.o interp_cgoto.c
gcc ${CFLAGS} -c -o interp_call.o interp_call.c
gcc ${CFLAGS} -c -o main.o main.c
gcc ${CFLAGS} -c -DBENCH_SWITCH -o main_switch.o main.c
gcc ${CFLAGS} -c -DBENCH_CGOTO -o main_cgoto.o main.c
gcc ${CFLAGS} -c -DBENCH_CALL -o main_call.o main.c
# link
gcc ${CFLAGS} -o main interp_switch.o interp_cgoto.o interp_call.o main.o
gcc ${CFLAGS} -o main_switch interp_switch.o main_switch.o
gcc ${CFLAGS} -o main_cgoto interp_cgoto.o main_cgoto.o
gcc ${CFLAGS} -o main_call interp_call.o main_call.o
echo all done
