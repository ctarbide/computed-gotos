
#include "interp.h"

#define LOOP_COUNT (10*1000*1000)

#define PBUFSZ 1024

unsigned char pbuf[PBUFSZ];
unsigned pbuf_pos;

#define E_CHAR() error(__FILE__, __LINE__, "char")

#define E_PBUF() error(__FILE__, __LINE__, "program buffer")

#define PBUF_PUSH(C)					\
	do {						\
		int __c = C;				\
		if (pbuf_pos >= PBUFSZ - 1) E_PBUF();	\
		if (__c == 0) E_CHAR();			\
		pbuf[pbuf_pos++] = (char)__c;		\
		pbuf[pbuf_pos] = '\0';			\
	} while (0)

#define PBUF_TRUNCATE(IDX)				\
	do {						\
		unsigned __idx = IDX;			\
		if (__idx >= pbuf_pos) E_PBUF();	\
		pbuf_pos = __idx;			\
		if (pbuf_pos >= PBUFSZ - 1) E_PBUF();	\
		pbuf[pbuf_pos] = '\0';			\
	} while (0)

#define E_BYTECODE() error(__FILE__, __LINE__, "bytecode")

void
error(char *fname, unsigned line, char *msg)
{
	fprintf(stderr, "%s: %u: error: %s\n", fname, line, msg);
	exit(1);
}

int
main(int argc, const char **argv)
{
	int c;
	size_t check = 0;

	while ((c = getc(stdin)) != EOF) {
		if ((unsigned)c > OP__LAST) {
			E_BYTECODE();
		}

		PBUF_PUSH(c);
	}

#if defined(BENCH_SWITCH)

	for (int i = 0; i <= LOOP_COUNT; ++i) {
		check += (size_t)interp_switch(pbuf, 42);
	}

#elif defined(BENCH_CGOTO)

	for (int i = 0; i <= LOOP_COUNT; ++i) {
		check += (size_t)interp_cgoto(pbuf, 42);
	}

#elif defined(BENCH_CALL)

	for (int i = 0; i <= LOOP_COUNT; ++i) {
		check += (size_t)interp_call(pbuf, 42);
	}

#elif defined(BENCH_CGOTOW)

	for (int i = 0; i <= LOOP_COUNT; ++i) {
		check += (size_t)interp_cgotow(pbuf, 42);
	}

#elif defined(BENCH_SWITCHC)

	for (int i = 0; i <= LOOP_COUNT; ++i) {
		check += (size_t)interp_switchc(pbuf, 42);
	}

#else
	int v1 = interp_switch(pbuf, 42);
	int v2 = interp_cgoto(pbuf, 42);
	int v3 = interp_call(pbuf, 42);
	int v4 = interp_cgotow(pbuf, 42);
	int v5 = interp_switchc(pbuf, 42);
	printf("%d %d %d %d %d\n", v1, v2, v3, v4, v5);
#endif
	check %= 97;
	printf("%zu\n", check);
	return 0;
}
