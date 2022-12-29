mov eax, 1234
push eax
jmp e6_assgin_asm_a$next
e6_assgin_asm_a: dd 0
e6_assgin_asm_a$next:
pop eax
mov [e6_assgin_asm_a], eax
mov eax, 5678
push eax
pop eax
mov [e6_assgin_asm_a], eax

#############新映射器效果############
jmp _a_pass
_a: dd 0
_a_pass:
pop eax
mov [_a], eax

