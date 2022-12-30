mov eax, 123
push eax
jmp e11_exp_z@a$pass
e11_exp_z@a: dd 0
e11_exp_z@a$pass:
pop eax
mov [e11_exp_z@a], eax

mov eax, 234
push eax
jmp e11_exp_z@b$pass
e11_exp_z@b: dd 0
e11_exp_z@b$pass:
pop eax
mov [e11_exp_z@b], eax

mov eax, [e11_exp_z@a]
push eax
mov eax, [e11_exp_z@b]
push eax
pop ebx
pop eax
cmp eax, ebx
jb e11_exp_z@les#1@true
mov eax, 0
jmp e11_exp_z@les#1@false
e11_exp_z@les#1@true:
mov eax, 1
e11_exp_z@les#1@false:
push eax
jmp e11_exp_z@d$pass
e11_exp_z@d: dd 0
e11_exp_z@d$pass:
pop eax
mov [e11_exp_z@d], eax

mov eax, [e11_exp_z@a]
push eax
mov eax, [e11_exp_z@b]
push eax
pop ebx
pop eax
cmp eax, ebx
ja e11_exp_z@mor#1@true
mov eax, 0
jmp e11_exp_z@mor#1@false
e11_exp_z@mor#1@true:
mov eax, 1
e11_exp_z@mor#1@false:
push eax
jmp e11_exp_z@c$pass
e11_exp_z@c: dd 0
e11_exp_z@c$pass:
pop eax
mov [e11_exp_z@c], eax

mov eax, [e11_exp_z@a]
push eax
mov eax, [e11_exp_z@b]
push eax
pop ebx
pop eax
cmp eax, ebx
je e11_exp_z@equ#1@true
mov eax, 0
jmp e11_exp_z@equ#1@false
e11_exp_z@equ#1@true:
mov eax, 1
e11_exp_z@equ#1@false:
push eax
jmp e11_exp_z@e$pass
e11_exp_z@e: dd 0
e11_exp_z@e$pass:
pop eax
mov [e11_exp_z@e], eax

mov eax, [e11_exp_z@a]
push eax
mov eax, [e11_exp_z@b]
push eax
pop ebx
pop eax
cmp eax, ebx
jne e11_exp_z@neq#1@true
mov eax, 0
jmp e11_exp_z@neq#1@false
e11_exp_z@neq#1@true:
mov eax, 1
e11_exp_z@neq#1@false:
push eax
jmp e11_exp_z@f$pass
e11_exp_z@f: dd 0
e11_exp_z@f$pass:
pop eax
mov [e11_exp_z@f], eax


