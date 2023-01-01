
;############[fun begin]func############
jmp e15_return_z_func$pass
e15_return_z_func:
pop ebp
push ebp
mov eax, 0
push eax
jmp e15_return_z_func_a$pass
e15_return_z_func_a: dd 0
e15_return_z_func_a$pass:
pop eax
mov [e15_return_z_func_a], eax

mov eax, [e15_return_z_func_a]
push eax
pop eax
pop ebp
push eax
push ebp
ret
mov eax, 1
push eax
jmp e15_return_z_func_b$pass
e15_return_z_func_b: dd 0
e15_return_z_func_b$pass:
pop eax
mov [e15_return_z_func_b], eax

ret
e15_return_z_func$pass:
;============[fun end]func=============

call e15_return_z_func

jmp e15_return_z_b$pass
e15_return_z_b: dd 0
e15_return_z_b$pass:
pop eax
mov [e15_return_z_b], eax


