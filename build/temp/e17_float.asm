mov eax, 1
push eax
mov eax, 2
push eax
pop eax
pop ebx
add eax, ebx
push eax
jmp e17_float_z_a$next
e17_float_z_a: dd 0
e17_float_z_a$next:
pop eax
mov [e17_float_z_a], eax
