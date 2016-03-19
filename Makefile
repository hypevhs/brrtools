#for windows compilation
#CC=i686-w64-mingw32-gcc.exe
#FLAGS=--std=c99 -m32 -lm -Wall -fdata-sections -ffunction-sections -s -Os
# add this to flags to inspect generated assembly
# -save-temps -fverbose-asm -masm=intel

#for linux compilation
CC=gcc
FLAGS=--std=c99 -lm -Wall -fdata-sections -ffunction-sections -s -Os

all: brr_decoder spc_decoder brr_encoder

brr_decoder : brr.o brr_decoder.c common.h Makefile
	$(CC) $(FLAGS) -fwhole-program brr_decoder.c brr.o -o brr_decoder

spc_decoder : brr.o spc_decoder.c common.h Makefile
	$(CC) $(FLAGS)  -fwhole-program spc_decoder.c brr.o -o spc_decoder

brr_encoder : brr.o brr_encoder.c common.h Makefile
	$(CC) $(FLAGS)  -fwhole-program brr_encoder.c brr.o -o brr_encoder

brr.o : brr.h brr.c common.h Makefile
	$(CC) $(FLAGS) -c brr.c -o brr.o
	
clean:
	rm -f *.o *.s *.i
	rm -f brr_encoder spc_decoder brr_decoder
