mov eax, 3
push eax
jmp e2_var_z_c$next
e2_var_z_c: dd 0
e2_var_z_c$next:
pop eax
mov [e2_var_z_c], eax
mov eax, 4
push eax
jmp e2_var_z_d$next
e2_var_z_d: dd 0
e2_var_z_d$next:
pop eax
mov [e2_var_z_d], eax
