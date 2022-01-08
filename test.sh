#!/bin/sh
set -eux
./main <prog
echo

time ./main_switch <prog
echo

time ./main_cgoto <prog
echo

time ./main_call <prog
echo

echo all done
