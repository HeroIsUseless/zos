mov eax, 123
push eax

jmp e11_exp_z_a$next
e11_exp_z_a: dd 0
e11_exp_z_a$next:
pop eax
mov [e11_exp_z_a], eax
mov eax, 234
push eax

jmp e11_exp_z_b$next
e11_exp_z_b: dd 0
e11_exp_z_b$next:
pop eax
mov [e11_exp_z_b], eax
mov eax, [e11_exp_z_a]
push eax
mov eax, [e11_exp_z_b]
push eax
pop ebx
pop eax
cmp eax, ebx
jb e11_exp_z_less@true$1
mov eax, 0
jmp e11_exp_z_less@false$1
e11_exp_z_less@true$1:
mov eax, 1
e11_exp_z_less@false$1:
push eax

jmp e11_exp_z_d$next
e11_exp_z_d: dd 0
e11_exp_z_d$next:
pop eax
mov [e11_exp_z_d], eax
mov eax, [e11_exp_z_a]
push eax
mov eax, [e11_exp_z_b]
push eax
pop ebx
pop eax
cmp eax, ebx
ja e11_exp_z_more@true$2
mov eax, 0
jmp e11_exp_z_more@false$2
e11_exp_z_more@true$2:
mov eax, 1
e11_exp_z_more@false$2:
push eax

jmp e11_exp_z_c$next
e11_exp_z_c: dd 0
e11_exp_z_c$next:
pop eax
mov [e11_exp_z_c], eax
mov eax, [e11_exp_z_a]
push eax
mov eax, [e11_exp_z_b]
push eax
pop ebx
pop eax
cmp eax, ebx
je e11_exp_z_equal@true$3
mov eax, 0
jmp e11_exp_z_equal@false$3
e11_exp_z_equal@true$3:
mov eax, 1
e11_exp_z_equal@false$3:
push eax

jmp e11_exp_z_e$next
e11_exp_z_e: dd 0
e11_exp_z_e$next:
pop eax
mov [e11_exp_z_e], eax
mov eax, [e11_exp_z_a]
push eax
mov eax, [e11_exp_z_b]
push eax
pop ebx
pop eax
cmp eax, ebx
jne e11_exp_z_unequal@true$4
mov eax, 0
jmp e11_exp_z_unequal@false$4
e11_exp_z_unequal@true$4:
mov eax, 1
e11_exp_z_unequal@false$4:
push eax

jmp e11_exp_z_f$next
e11_exp_z_f: dd 0
e11_exp_z_f$next:
pop eax
mov [e11_exp_z_f], eax
