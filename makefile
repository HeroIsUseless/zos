default:
	nasm -f bin src/boot/IPL.asm -o build/IPL.bin -l log/IPL.log
	nasm -f bin src/boot/boot.asm -o build/boot.bin -l log/boot.log
	nasm -f bin src/boot/main.asm -o build/main.bin -l log/main.log

tools: src/tools/makeImg.c
	gcc src/tools/makeImg.c -o build/makeImg

run:
	./build/makeImg
	cd build && qemu-system-x86_64 -m 128M  -fda ZOS.img

all:
	make default
	make tools
	make run
