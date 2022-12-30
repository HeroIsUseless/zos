mov eax, 1
push eax
mov eax, 2
push eax
pop eax
pop ebx
add eax, ebx
push eax
jmp e17_float_z@a$pass
e17_float_z@a: dd 0
e17_float_z@a$pass:
pop eax
mov [e17_float_z@a], eax


