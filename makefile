default:
	nasm -f bin src/boot/IPL.asm -o build/IPL.o

tools: src/tools/makeImg.c
	gcc src/tools/makeImg.c -o build/makeImg
	./build/makeImg
