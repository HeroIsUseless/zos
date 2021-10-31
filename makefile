tools: src/tools/makeImg.c
	gcc src/tools/makeImg.c -o build/makeImg
	make zlang

zlang:
	cd build && flex ../src/tools/zlang/lex.l
	cd build && bison -d ../src/tools/zlang/parse.y 
	cd build && cc lex.yy.c parse.tab.c -ll -o zlang
	cd build && ./zlang ../example/1_var.z 1_var.asm

compile:
	nasm -f bin src/boot/IPL.asm -o build/IPL.bin -l log/IPL.log
	nasm -f bin src/boot/boot.asm -o build/boot.bin -l log/boot.log
	nasm -f bin src/boot/main.asm -o build/main.bin -l log/main.log

run:
	./build/makeImg
	cd build && qemu-system-x86_64 -m 128M  -fda ZOS.img -vnc :1 -monitor stdio

all:
	make tools
	make compile
	make run
