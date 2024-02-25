
#include <stdio.h>
#include <stdlib.h>

/* [0,7] */

typedef enum {
	OP_HALT,
	OP_INC,
	OP_DEC,
	OP_MUL2,
	OP_DIV2,
	OP_ADD7,
	OP_NEG,
	OP__PAD
} opcode_t;

#define OP__LAST OP_NEG
#define OP__MASK 0x7u

int interp_switch(unsigned char *code, int initval);
int interp_cgoto(unsigned char *code, int initval);
int interp_call(unsigned char *code, int initval);
int interp_cgotow(unsigned char *code, int initval);
int interp_switchc(unsigned char *code, int initval);
