
#include "interp.h"

int
interp_switch(unsigned char *code, int initval)
{
	int pc = 0;
	int val = initval;

	while (1) {
		switch (code[pc++]) {
		case OP_HALT:
			return val;

		case OP_INC:
			val++;
			break;

		case OP_DEC:
			val--;
			break;

		case OP_MUL2:
			val *= 2;
			break;

		case OP_DIV2:
			val /= 2;
			break;

		case OP_ADD7:
			val += 7;
			break;

		case OP_NEG:
			val = -val;
			break;

		default:
			return val;
		}
	}
}
