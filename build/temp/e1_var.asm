mov eax, 1
push eax
jmp e1_var_z@a$next
e1_var_z@a: db 0
e1_var_z@a$next:
pop eax
mov [e1_var_z@a], eax
mov eax, 2
push eax
jmp e1_var_z@b$next
e1_var_z@b: db 0
e1_var_z@b$next:
pop eax
mov [e1_var_z@b], eax
