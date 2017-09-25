CFLAGS  = -std=c99
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -pedantic
CFLAGS += -Werror
CFLAGS += -g
CFLAGS += `pkg-config --cflags glib-2.0`
LDFLAGS = `pkg-config --libs glib-2.0`

test: tests.out
	@./tests.out

clean:
	rm -f *.o *.out

tests.out: test/test_isogram.c src/isogram.c src/isogram.h
	@echo Compiling $@
	@cc $(CFLAGS) src/isogram.c test/vendor/unity.c test/test_isogram.c $(LDFLAGS) -o tests.out
