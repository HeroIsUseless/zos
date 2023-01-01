mov eax, 1234
push eax
jmp e6_assgin_z_a$pass
e6_assgin_z_a: dd 0
e6_assgin_z_a$pass:
pop eax
mov [e6_assgin_z_a], eax

mov eax, 5678
push eax
pop eax
mov [e6_assgin_z_a], eax

