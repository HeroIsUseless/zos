mov eax, 1
push eax
mov eax, 2
push eax
pop eax
pop ebx
add eax, ebx
push eax
jmp e16_float_z_a$pass
e16_float_z_a: dd 0
e16_float_z_a$pass:
pop eax
mov [e16_float_z_a], eax


