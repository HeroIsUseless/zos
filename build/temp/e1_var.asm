mov eax, 1
push eax
jmp e1_var_z@a$pass
e1_var_z@a: dd 0
e1_var_z@a$pass:
pop eax
mov [e1_var_z@a], eax

mov eax, 2
push eax
jmp e1_var_z@b$pass
e1_var_z@b: dd 0
e1_var_z@b$pass:
pop eax
mov [e1_var_z@b], eax


