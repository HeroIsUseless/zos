default:
	nasm -f bin src/boot/IPL.asm -o build/IPL.bin -l log/IPL.log

tools: src/tools/makeImg.c
	gcc src/tools/makeImg.c -o build/makeImg
	./build/makeImg

run:
	cd build && qemu-system-x86_64 -fda ZOS.img
