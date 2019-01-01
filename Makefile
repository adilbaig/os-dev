%:
	nasm $@.asm -f bin -o bin/$@.bin

# Ex: make run BIN=bin/addressing.bin
run:
	qemu-system-i386 ${BIN}