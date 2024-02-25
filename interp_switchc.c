
#include "interp.h"

/* even with all the hints.. gcc cannot beat computed gotos
 */

/* using 'continue' instead of 'break' is faster (!?!), that's disturbing,
 * decades of optimization and this couldn't be abstracted?
 */

int
interp_switchc(unsigned char *code, int initval)
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
			continue;

		case OP_DEC:
			val--;
			continue;

		case OP_MUL2:
			val *= 2;
			continue;

		case OP_DIV2:
			val /= 2;
			continue;

		case OP_ADD7:
			val += 7;
			continue;

		case OP_NEG:
			val = -val;
			continue;

		case OP__PAD:
			/* no-op, shouldnt happen */
			continue;
		}
	}
}
