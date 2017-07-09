all: floatSinTest floatSin

floatSinTest:	testProgramm.c sin.asm
	nasm -f macho -o sin.o sin.asm
	clang -m32 -o floatSinTest testProgramm.c sin.o

floatSin:	rahmenProgramm.c sin.asm
	nasm -f macho -o sin.o sin.asm
	clang -m32 -o floatSin rahmenProgramm.c sin.o

clean:
	rm floatSin floatSinTest sin.o