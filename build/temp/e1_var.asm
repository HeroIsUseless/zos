mov eax, 1
push eax
jmp e1_var_asm_a$next
e1_var_asm_a: dd 0
e1_var_asm_a$next:
pop eax
mov [e1_var_asm_a], eax
mov eax, 2
push eax
jmp e1_var_asm_b$next
e1_var_asm_b: dd 0
e1_var_asm_b$next:
pop eax
mov [e1_var_asm_b], eax

#############新映射器效果############
jmp _a_pass
_a: dd 0
_a_pass:
jmp _b_pass
_b: dd 0
_b_pass:

