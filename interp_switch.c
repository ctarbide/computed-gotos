
#include "interp.h"

/* even with all the hints.. gcc cannot beat computed gotos
 */

int
interp_switch(unsigned char *code, int initval)
{
	int pc = 0;
	int val = initval;

	while (1) {
		opcode_t opcode = code[pc++] & OP__MASK;
		switch (opcode) {
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

		case OP__PAD:
			/* no-op, shouldnt happen */
			break;
		}
	}
}
