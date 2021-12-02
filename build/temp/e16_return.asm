
;function
jmp e16_return_z_func$next
e16_return_z_func:
pop ebp
push ebp
mov eax, 0
push eax
jmp e16_return_z_func_a$next
e16_return_z_func_a: dd 0
e16_return_z_func_a$next:
pop eax
mov [e16_return_z_func_a], eax
mov eax, [e16_return_z_func_a]
push eax
pop eax
pop ebp
push eax
push ebp
ret
mov eax, 1
push eax
jmp e16_return_z_func_b$next
e16_return_z_func_b: dd 0
e16_return_z_func_b$next:
pop eax
mov [e16_return_z_func_b], eax
ret
e16_return_z_func$next:
call e16_return_z_func
jmp e16_return_z_b$next
e16_return_z_b: dd 0
e16_return_z_b$next:
pop eax
mov [e16_return_z_b], eax
