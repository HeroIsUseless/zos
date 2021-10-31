tools: src/tools/makeImg.c
	gcc src/tools/makeImg.c -o build/makeImg
	make zlang

zlang:
	cd build/temp && flex ../../src/tools/zlang/lex.l
	cd build/temp && bison -d ../../src/tools/zlang/parse.y 
	cd build/temp && cc lex.yy.c parse.tab.c -ll -o ../zlang
	cd build && ./zlang ../example/1_var.z 1_var.asm

compile:
	nasm -f bin src/boot/IPL.asm -o build/temp/IPL.bin -l log/IPL.log
	nasm -f bin src/boot/boot.asm -o build/temp/boot.bin -l log/boot.log
	nasm -f bin src/boot/main.asm -o build/temp/main.bin -l log/main.log

run:
	cd build && ./makeImg ./temp/IPL.bin ./temp/boot.bin ./temp/main.bin ZOS.img
	cd build && qemu-system-x86_64 -m 128M  -fda ZOS.img -vnc :1 -monitor stdio

all:
	make tools
	make compile
	make run
