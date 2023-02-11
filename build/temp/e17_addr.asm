mov eax, 1
push eax
jmp e17_addr_z_a$pass
e17_addr_z_a: dd 0
e17_addr_z_a$pass:
pop eax
mov [e17_addr_z_a], eax

mov eax, e17_addr_z_a
push eax
jmp e17_addr_z_b$pass
e17_addr_z_b: dd 0
e17_addr_z_b$pass:
pop eax
mov [e17_addr_z_b], eax


