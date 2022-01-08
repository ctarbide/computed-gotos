
#include <stdio.h>
#include <stdlib.h>

enum {
	OP_HALT,
	OP_INC,
	OP_DEC,
	OP_MUL2,
	OP_DIV2,
	OP_ADD7,
	OP_NEG,
	OP__SENTINEL,
	OP__LAST = OP__SENTINEL - 1,
};

int interp_switch(unsigned char *code, int initval);
int interp_cgoto(unsigned char *code, int initval);
int interp_call(unsigned char *code, int initval);
