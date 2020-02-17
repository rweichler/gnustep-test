# GNUstep from https://github.com/plaurent/gnustep-build

PREFIX := /usr/GNUstep/Local/Library
CFLAGS := -I$(PREFIX)/Headers
LDFLAGS := -lobjc -lgnustep-base -lgnustep-gui -L$(PREFIX)/Libraries
SFLAGS := $(shell gnustep-config --objc-flags)

a.out: main.m
	clang-8 $^ -o $@ $(CFLAGS) $(SFLAGS) $(LDFLAGS)  #-Wl,--verbose 

clean:
	rm -f a.out a.d
