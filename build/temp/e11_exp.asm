mov eax, 123
push eax
jmp e11_exp_asm_a$next
e11_exp_asm_a: dd 0
e11_exp_asm_a$next:
pop eax
mov [e11_exp_asm_a], eax
mov eax, 234
push eax
jmp e11_exp_asm_b$next
e11_exp_asm_b: dd 0
e11_exp_asm_b$next:
pop eax
mov [e11_exp_asm_b], eax
mov eax, [e11_exp_asm_a]
push eax
mov eax, [e11_exp_asm_b]
push eax
pop ebx
pop eax
cmp eax, ebx
jb e11_exp_asm_less@true$1
mov eax, 0
jmp e11_exp_asm_less@false$1
e11_exp_asm_less@true$1:
mov eax, 1
e11_exp_asm_less@false$1:
push eax
jmp e11_exp_asm_d$next
e11_exp_asm_d: dd 0
e11_exp_asm_d$next:
pop eax
mov [e11_exp_asm_d], eax
mov eax, [e11_exp_asm_a]
push eax
mov eax, [e11_exp_asm_b]
push eax
pop ebx
pop eax
cmp eax, ebx
ja e11_exp_asm_more@true$2
mov eax, 0
jmp e11_exp_asm_more@false$2
e11_exp_asm_more@true$2:
mov eax, 1
e11_exp_asm_more@false$2:
push eax
jmp e11_exp_asm_c$next
e11_exp_asm_c: dd 0
e11_exp_asm_c$next:
pop eax
mov [e11_exp_asm_c], eax
mov eax, [e11_exp_asm_a]
push eax
mov eax, [e11_exp_asm_b]
push eax
pop ebx
pop eax
cmp eax, ebx
je e11_exp_asm_equal@true$3
mov eax, 0
jmp e11_exp_asm_equal@false$3
e11_exp_asm_equal@true$3:
mov eax, 1
e11_exp_asm_equal@false$3:
push eax
jmp e11_exp_asm_e$next
e11_exp_asm_e: dd 0
e11_exp_asm_e$next:
pop eax
mov [e11_exp_asm_e], eax
mov eax, [e11_exp_asm_a]
push eax
mov eax, [e11_exp_asm_b]
push eax
pop ebx
pop eax
cmp eax, ebx
jne e11_exp_asm_unequal@true$4
mov eax, 0
jmp e11_exp_asm_unequal@false$4
e11_exp_asm_unequal@true$4:
mov eax, 1
e11_exp_asm_unequal@false$4:
push eax
jmp e11_exp_asm_f$next
e11_exp_asm_f: dd 0
e11_exp_asm_f$next:
pop eax
mov [e11_exp_asm_f], eax

#############新映射器效果############
jmp _a_pass
_a: dd 0
_a_pass:
jmp _b_pass
_b: dd 0
_b_pass:
jmp _d_pass
_d: dd 0
_d_pass:
jmp _c_pass
_c: dd 0
_c_pass:
jmp _e_pass
_e: dd 0
_e_pass:
jmp _f_pass
_f: dd 0
_f_pass:

