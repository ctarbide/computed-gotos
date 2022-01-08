
#include "interp.h"

#define DISPATCH() goto *dispatch_table[code[pc++]]

int
interp_cgoto(unsigned char *code, int initval)
{
	/* The indices of labels in the dispatch_table are the relevant opcodes
	 */
	static void *dispatch_table[] = {
		&&do_halt, &&do_inc, &&do_dec, &&do_mul2,
		&&do_div2, &&do_add7, &&do_neg
	};
	int pc = 0;
	int val = initval;
	DISPATCH();
do_halt:
	return val;
do_inc:
	val++;
	DISPATCH();
do_dec:
	val--;
	DISPATCH();
do_mul2:
	val *= 2;
	DISPATCH();
do_div2:
	val /= 2;
	DISPATCH();
do_add7:
	val += 7;
	DISPATCH();
do_neg:
	val = -val;
	DISPATCH();
}
