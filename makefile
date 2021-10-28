default:
	nasm -f bin src/boot/IPL.asm -o build/IPL.bin -l log/IPL.log

tools:
	gcc src/tools/makeImg.c -o build/makeImg
	./build/makeImg
