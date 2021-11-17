mov eax, 3
push eax
jmp e2_var_z@c$next
e2_var_z@c: db 0
e2_var_z@c$next:
pop eax
mov [e2_var_z@c], eax
mov eax, 4
push eax
jmp e2_var_z@d$next
e2_var_z@d: db 0
e2_var_z@d$next:
pop eax
mov [e2_var_z@d], eax
