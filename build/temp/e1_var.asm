mov eax, 1
push eax
jmp e1_var_z_a$pass
e1_var_z_a: dd 0
e1_var_z_a$pass:
pop eax
mov [e1_var_z_a], eax

mov eax, 2
push eax
jmp e1_var_z_b$pass
e1_var_z_b: dd 0
e1_var_z_b$pass:
pop eax
mov [e1_var_z_b], eax


