
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

#############新映射器效果############

;############[fun begin]func############
jmp _func_pass
_func:
pop ebp
push ebp
jmp func__a_pass
func__a: dd 0
func__a_pass:
pop eax
pop ebp
push eax
push ebp
ret
jmp func__b_pass
func__b: dd 0
func__b_pass:
ret
;========[fun end]func========
_func_pass:
jmp _b_pass
_b: dd 0
_b_pass:

