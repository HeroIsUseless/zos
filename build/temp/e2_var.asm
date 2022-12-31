mov eax, 3
push eax
jmp e2_var_z@c_d$pass
e2_var_z@c_d: dd 0
e2_var_z@c_d$pass:
pop eax
mov [e2_var_z@c_d], eax

mov eax, 4
push eax
jmp e2_var_z@e_f$pass
e2_var_z@e_f: dd 0
e2_var_z@e_f$pass:
pop eax
mov [e2_var_z@e_f], eax


