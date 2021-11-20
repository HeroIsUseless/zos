tools: src/tools/makeImg.c
	gcc src/tools/makeImg.c -o build/makeImg
	gcc src/tools/zlink.c -o build/zlink
	make zlang

zlang:
	cd src/tools/zlang && flex lex.l
	cd src/tools/zlang && bison -d parse.y -v
	cd src/tools/zlang && cc lex.yy.c parse.tab.c -ll -o zlang
	mv src/tools/zlang/parse.output log
	mv src/tools/zlang/lex.yy.c build/temp
	mv src/tools/zlang/parse.tab.* build/temp
	mv src/tools/zlang/zlang build
	make exam

exam:
	cd build && ./zlang ../example/e1_var.z ./temp/e1_var.asm
	cd build && ./zlang ../example/e2_var.z ./temp/e2_var.asm
	cd build && ./zlang ../example/e3_fun.z ./temp/e3_fun.asm
	cd build && ./zlang ../example/e4_anno.z ./temp/e4_anno.asm
	cd build && ./zlang ../example/e5_param.z ./temp/e5_param.asm
	cd build && ./zlang ../example/e6_assgin.z ./temp/e6_assgin.asm
	cd build && ./zlang ../example/e7_exec_func.z ./temp/e7_exec_func.asm
	cd build && ./zlang ../example/e8_exec_param.z ./temp/e8_exec_param.asm
	cd build && ./zlang ../example/e9_if.z ./temp/e9_if.asm
	cd build && ./zlang ../example/e10_while.z ./temp/e10_while.asm
	cd build && ./zlang ../example/e11_exp.z ./temp/e11_exp.asm
	cd build && ./zlang ../example/e12_nest.z ./temp/e12_nest.asm

test:
	cd src/tools/zlang && gcc test.c -o test 
	mv src/tools/zlang/test build/test
	build/test

compile:
	cd build && ./zlang ../src/main.z ./temp/main.asm
	cd build && ./zlang ../src/kernel/memory.z ./temp/memory.asm
	cd build && ./zlang ../src/screen/draw.z ./temp/draw.asm
	cd build && ./zlang ../src/test.z ./temp/test.asm
	cd build && ./zlink ../src/kernel/kernel.asm \
										   ./temp/main.asm \
											 ./temp/memory.asm \
											 ./temp/draw.asm \
											 ./temp/test.asm \
											 ./temp/zos.asm
	nasm -f bin src/boot/IPL.asm -o build/temp/IPL.bin -l log/IPL.log
	nasm -f bin src/boot/boot.asm -o build/temp/boot.bin -l log/boot.log
	nasm -f bin build/temp/zos.asm -o build/temp/zos.bin -l log/zos.log
	cd build && ./makeImg ./temp/IPL.bin ./temp/boot.bin ./temp/zos.bin ZOS.img

debug:
	nasm -f bin build/temp/zos.asm -o build/temp/zos.bin -l log/zos.log
	cd build && ./makeImg ./temp/IPL.bin ./temp/boot.bin ./temp/zos.bin ZOS.img
	make run

run:
	cd build && qemu-system-x86_64 -m 128M  -fda ZOS.img -vnc :1 -monitor stdio

all:
	make test
	make tools
	make compile
	make run
