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


