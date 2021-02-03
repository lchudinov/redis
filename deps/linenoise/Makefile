STD=
WARN= -Wall
OPT= -Os

R_CFLAGS= $(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS)
R_LDFLAGS= $(LDFLAGS)
DEBUG= -g

uname_S:= $(shell sh -c 'uname -s 2>/dev/null || echo not')

ifeq ($(uname_S),OS/390)
    # z/OS
	CC=c99_x
	R_CFLAGS=-O ${REDIS_ENHANCED_ASCII} -qfloat=ieee -qgonum -q64 -D _XOPEN_SOURCE_EXTENDED
	R_LDLAGS=-q64
endif

R_CC=$(CC) $(R_CFLAGS)
R_LD=$(CC) $(R_LDFLAGS)

linenoise.o: linenoise.h linenoise.c

linenoise_example: linenoise.o example.o
	$(R_LD) -o $@ $^

.c.o:
	$(R_CC) -c $<

clean:
	rm -f linenoise_example *.o
