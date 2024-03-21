#!/bin/sh
set -eux

./main <prog
echo

time -p ./main_switch <prog
echo

time -p ./main_cgoto <prog
echo

time -p ./main_call <prog
echo

time -p ./main_cgotow <prog
echo

time -p ./main_switchc <prog
echo

time -p ./main_sgoto <prog
echo

echo all done
