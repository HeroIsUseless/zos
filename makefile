tools: src/tools/makeImg.c
	rm build/makeImg build/zlink
	gcc src/tools/makeImg.c -o build/makeImg
	gcc src/tools/zlink.c -o build/zlink
	make zlang

zlang:
	cd build/temp && flex ../../src/tools/zlang/lex.l
	cd build/temp && bison -d ../../src/tools/zlang/parse.y 
	cd build/temp && cc lex.yy.c parse.tab.c -ll -o ../zlang
	make exam

exam:
	cd build && ./zlang ../example/e1_var.z ./temp/e1_var.asm
	cd build && ./zlang ../example/e2_var.z ./temp/e2_var.asm
	cd build && ./zlang ../example/e3_fun.z ./temp/e3_fun.asm
	cd build && ./zlang ../example/e4_anno.z ./temp/e4_anno.asm
	cd build && ./zlang ../example/e5_param.z ./temp/e5_param.asm
	cd build && ./zlang ../example/e6_assgin.z ./temp/e6_assgin.asm

test:
	cd src/tools/zlang && gcc test.c -o test 
	mv src/tools/zlang/test build/test
	build/test

compile:
	cd build && ./zlang ../example/e1_var.z ./temp/e1_var.asm
	cd build && ./zlang ../example/e2_var.z ./temp/e2_var.asm
	cd build && ./zlink ../src/kernel/kernel.asm ./temp/e1_var.asm ./temp/e2_var.asm ./temp/kernel.asm
	nasm -f bin src/boot/IPL.asm -o build/temp/IPL.bin -l log/IPL.log
	nasm -f bin src/boot/boot.asm -o build/temp/boot.bin -l log/boot.log
	nasm -f bin build/temp/kernel.asm -o build/temp/kernel.bin -l log/kernel.log

run:
	cd build && ./makeImg ./temp/IPL.bin ./temp/boot.bin ./temp/kernel.bin ZOS.img
	cd build && qemu-system-x86_64 -m 128M  -fda ZOS.img -vnc :1 -monitor stdio

all:
	make tools
	make compile
	make run
