
#include "interp.h"

int
do_inc(int val)
{
	return val + 1;
}

int
do_dec(int val)
{
	return val - 1;
}

int
do_mul2(int val)
{
	return val * 2;
}

int
do_div2(int val)
{
	return val / 2;
}

int
do_add7(int val)
{
	return val + 7;
}

int
do_neg(int val)
{
	return - val;
}

static int running;

int
do_halt(int val)
{
	running = 0;
	return val;
}

int
interp_call(unsigned char *code, int initval)
{
	static int (*dispatch_table[])(int) = {
		&do_halt, &do_inc, &do_dec, &do_mul2,
		&do_div2, &do_add7, &do_neg
	};
	int pc = 0;
	int val = initval;
	running = 1;

	do {
		val = dispatch_table[code[pc++]](val);
	} while (running);

	return val;
}
