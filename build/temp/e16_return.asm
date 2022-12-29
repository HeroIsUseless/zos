
;function
jmp e16_return_asm_func$next
e16_return_asm_func:
pop ebp
push ebp
mov eax, 0
push eax
jmp e16_return_asm_func_a$next
e16_return_asm_func_a: dd 0
e16_return_asm_func_a$next:
pop eax
mov [e16_return_asm_func_a], eax
mov eax, [e16_return_asm_func_a]
push eax
pop eax
pop ebp
push eax
push ebp
ret
mov eax, 1
push eax
jmp e16_return_asm_func_b$next
e16_return_asm_func_b: dd 0
e16_return_asm_func_b$next:
pop eax
mov [e16_return_asm_func_b], eax
ret
e16_return_asm_func$next:
call e16_return_asm_func
jmp e16_return_asm_b$next
e16_return_asm_b: dd 0
e16_return_asm_b$next:
pop eax
mov [e16_return_asm_b], eax
;#############新映射器效果############

;############[fun begin]func############
jmp e16_return_z@func$pass
e16_return_z@func:
pop ebp
push ebp
mov eax, 0
push eax
jmp e16_return_z@func@a$pass
e16_return_z@func@a: dd 0
e16_return_z@func@a$pass:
pop eax
mov [e16_return_z@func@a], eax

pop eax
pop ebp
push eax
push ebp
ret
mov eax, 1
push eax
jmp e16_return_z@func@b$pass
e16_return_z@func@b: dd 0
e16_return_z@func@b$pass:
pop eax
mov [e16_return_z@func@b], eax

ret
e16_return_z@func$pass:
;============[fun end]func=============

jmp e16_return_z@b$pass
e16_return_z@b: dd 0
e16_return_z@b$pass:
pop eax
mov [e16_return_z@b], eax


