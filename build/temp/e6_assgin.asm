mov eax, 1234
push eax
jmp e6_assgin_z_a$next
e6_assgin_z_a: dd 0
e6_assgin_z_a$next:
pop eax
mov [e6_assgin_z_a], eax
mov eax, 5678
mov [e6_assgin_z_a], eax
