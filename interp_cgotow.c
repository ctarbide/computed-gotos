
#include "interp.h"

int
interp_cgotow(unsigned char *code, int initval)
{
	/* The indices of labels in the dispatch_table are the relevant opcodes
	 */
	static void *dispatch_table[] = {
		&&do_halt, &&do_inc, &&do_dec, &&do_mul2,
		&&do_div2, &&do_add7, &&do_neg, &&do_pad
	};
	int pc = 0;
	int val = initval;

	while (1) {
		goto *dispatch_table[code[pc++] & OP__MASK];
		do_halt:
			return val;
		do_inc:
			val++;
			continue;
		do_dec:
			val--;
			continue;
		do_mul2:
			val *= 2;
			continue;
		do_div2:
			val /= 2;
			continue;
		do_add7:
			val += 7;
			continue;
		do_neg:
			val = -val;
		do_pad:
			/* no-op, shouldnt happen */
			continue;
	}
}
