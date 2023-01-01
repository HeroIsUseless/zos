mov eax, 123
push eax
jmp e11_exp_z_a$pass
e11_exp_z_a: dd 0
e11_exp_z_a$pass:
pop eax
mov [e11_exp_z_a], eax

mov eax, 234
push eax
jmp e11_exp_z_b$pass
e11_exp_z_b: dd 0
e11_exp_z_b$pass:
pop eax
mov [e11_exp_z_b], eax

mov eax, [e11_exp_z_a]
push eax
mov eax, [e11_exp_z_b]
push eax
pop ebx
pop eax
cmp eax, ebx
jb e11_exp_z_les#r1$true
mov eax, 0
jmp e11_exp_z_les#r1$false
e11_exp_z_les#r1$true:
mov eax, 1
e11_exp_z_les#r1$false:
push eax
jmp e11_exp_z_d$pass
e11_exp_z_d: dd 0
e11_exp_z_d$pass:
pop eax
mov [e11_exp_z_d], eax

mov eax, [e11_exp_z_a]
push eax
mov eax, [e11_exp_z_b]
push eax
pop ebx
pop eax
cmp eax, ebx
ja e11_exp_z_mor#r2$true
mov eax, 0
jmp e11_exp_z_mor#r2$false
e11_exp_z_mor#r2$true:
mov eax, 1
e11_exp_z_mor#r2$false:
push eax
jmp e11_exp_z_c$pass
e11_exp_z_c: dd 0
e11_exp_z_c$pass:
pop eax
mov [e11_exp_z_c], eax

mov eax, [e11_exp_z_a]
push eax
mov eax, [e11_exp_z_b]
push eax
pop ebx
pop eax
cmp eax, ebx
je e11_exp_z_equ#r3$true
mov eax, 0
jmp e11_exp_z_equ#r3$false
e11_exp_z_equ#r3$true:
mov eax, 1
e11_exp_z_equ#r3$false:
push eax
jmp e11_exp_z_e$pass
e11_exp_z_e: dd 0
e11_exp_z_e$pass:
pop eax
mov [e11_exp_z_e], eax

mov eax, [e11_exp_z_a]
push eax
mov eax, [e11_exp_z_b]
push eax
pop ebx
pop eax
cmp eax, ebx
jne e11_exp_z_neq#r4$true
mov eax, 0
jmp e11_exp_z_neq#r4$false
e11_exp_z_neq#r4$true:
mov eax, 1
e11_exp_z_neq#r4$false:
push eax
jmp e11_exp_z_f$pass
e11_exp_z_f: dd 0
e11_exp_z_f$pass:
pop eax
mov [e11_exp_z_f], eax


