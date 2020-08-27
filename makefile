CFLAGS  := -fno-stack-protector -fno-builtin -nostdinc -O -g -Wall -I.
LDFLAGS := -NOSTDLIB -Wl,-N -Wl,-Ttext -Wl,100000

all: kernel.bin

kernel.bin: start.o kmain.o
	ld -T link.ld -o kernel.bin start.o kmain.o
	@echo Done.

kernel2.bin: start.asm kmain.c start.o
	gcc -o kernel.bin $(CFLAGS) start.o kmain.c $(LDFLAGS)

start.o: start.asm
	nasm -f elf32 -o start.o start.asm

kmain.o: kmain.c 
	gcc $(CFLAGS) -c -o kmain.o kmain.c

clean:
	rm -f *.o*.bin
