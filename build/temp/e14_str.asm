jmp e14_str_asm_a$next
e14_str_asm_a: dd \
65, 66, 67, 68, 0
e14_str_asm_a$next:
#############新映射器效果############
jmp e14_str_z@a$pass
e14_str_z@a: dd "ABCD"
e14_str_z@a$pass:

