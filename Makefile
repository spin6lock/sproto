.PHONY : all win clean

all : linux
win : sproto.dll

# For Linux
linux:
	make sproto.so "DLLFLAGS = -shared -fPIC"
# For Mac OS
macosx:
	make sproto.so "DLLFLAGS = -bundle -undefined dynamic_lookup -L/usr/local/lib/ -I/usr/local/include/lua5.4"

sproto.so : sproto.c lsproto.c
	env gcc -O2 -Wall $(DLLFLAGS) -o $@ $^

sproto.dll : sproto.c lsproto.c
	gcc -O2 -Wall --shared -o $@ $^ -I/usr/local/include -L/usr/local/bin -llua53

clean :
	rm -f sproto.so sproto.dll
