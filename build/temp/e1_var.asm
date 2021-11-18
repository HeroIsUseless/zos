mov eax, 1
push eax
jmp e1_var_z_a$next
e1_var_z_a: db 0
e1_var_z_a$next:
pop eax
mov [e1_var_z_a], eax
mov eax, 2
push eax
jmp e1_var_z_b$next
e1_var_z_b: db 0
e1_var_z_b$next:
pop eax
mov [e1_var_z_b], eax
