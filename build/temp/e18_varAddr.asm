mov eax, 0x28000001
push eax
jmp e18_varAddr_z_a$pass
e18_varAddr_z_a: dd 0
e18_varAddr_z_a$pass:
pop eax
mov [e18_varAddr_z_a], eax

mov eax, [e18_varAddr_z_a]
mov ebx, [eax]
push ebx
jmp e18_varAddr_z_b$pass
e18_varAddr_z_b: dd 0
e18_varAddr_z_b$pass:
pop eax
mov [e18_varAddr_z_b], eax


