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
mov eax, 3
push eax
jmp e2_var_z@c$pass
e2_var_z@c: dd 0
e2_var_z@c$pass:
pop eax
mov [e2_var_z@c], eax

mov eax, 4
push eax
jmp e2_var_z@d$pass
e2_var_z@d: dd 0
e2_var_z@d$pass:
pop eax
mov [e2_var_z@d], eax


