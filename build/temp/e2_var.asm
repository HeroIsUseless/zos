mov eax, 3
push eax
jmp e2_var_asm_c$next
e2_var_asm_c: dd 0
e2_var_asm_c$next:
pop eax
mov [e2_var_asm_c], eax
mov eax, 4
push eax
jmp e2_var_asm_d$next
e2_var_asm_d: dd 0
e2_var_asm_d$next:
pop eax
mov [e2_var_asm_d], eax

#############新映射器效果############
jmp _c_pass
_c: dd 0
_c_pass:
jmp _d_pass
_d: dd 0
_d_pass:

