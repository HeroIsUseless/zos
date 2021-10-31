default:
	cd build && flex ../src/lex.l
	cd build && bison -d ../src/parse.y 
	cd build && cc lex.yy.c parse.tab.c -ll -o zlang
	cd build && ./zlang ../example/1_var.z ../build/1_var.asm
