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
jb les#r1@true
mov eax, 0
jmp les#r1@false
les#r1@true:
mov eax, 1
les#r1@false:
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
ja mor#r2@true
mov eax, 0
jmp mor#r2@false
mor#r2@true:
mov eax, 1
mor#r2@false:
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
je equ#r3@true
mov eax, 0
jmp equ#r3@false
equ#r3@true:
mov eax, 1
equ#r3@false:
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
jne neq#r4@true
mov eax, 0
jmp neq#r4@false
neq#r4@true:
mov eax, 1
neq#r4@false:
push eax
jmp e11_exp_z@f$pass
e11_exp_z@f: dd 0
e11_exp_z@f$pass:
pop eax
mov [e11_exp_z@f], eax


