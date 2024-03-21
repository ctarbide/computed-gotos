
#include "interp.h"

#define DISPATCH() do {					\
		opcode = code[pc++] & OP__MASK;		\
		goto again;				\
	} while (0)

int
interp_sgoto(unsigned char *code, int initval)
{
	int pc = 0;
	opcode_t opcode;
	int val = initval;
	DISPATCH();
again:
	switch (opcode) {
		case OP_HALT: goto do_halt;
		case OP_INC: goto do_inc;
		case OP_DEC: goto do_dec;
		case OP_MUL2: goto do_mul2;
		case OP_DIV2: goto do_div2;
		case OP_ADD7: goto do_add7;
		case OP_NEG: goto do_neg;
		case OP__PAD: goto do_pad;
	}
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
do_pad:
	/* no-op, shouldnt happen */
	DISPATCH();
}
