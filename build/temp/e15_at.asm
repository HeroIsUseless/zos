jmp e15_at_asm_str$next
e15_at_asm_str: dd \
65, 66, 67, 68, 0
e15_at_asm_str$next:

;function
jmp e15_at_asm_func$next
e15_at_asm_func:
;param
jmp e15_at_asm_func_strAddr$next
e15_at_asm_func_strAddr: dd 0
e15_at_asm_func_strAddr$next:
pop ebp
pop eax
mov [e15_at_asm_func_strAddr], eax
push ebp
mov eax, 0
push eax
jmp e15_at_asm_func_a$next
e15_at_asm_func_a: dd 0
e15_at_asm_func_a$next:
pop eax
mov [e15_at_asm_func_a], eax
mov eax, 1
push eax
mov ebx, 4
pop eax
mul ebx
mov ebx, eax
mov eax, [e15_at_asm_func_strAddr]
add eax, ebx
mov ebx, [eax]
push ebx
pop eax
mov [e15_at_asm_func_a], eax
mov eax, 1
push eax
mov eax, 123
push eax
pop eax
pop ebx
mov ecx, [e15_at_asm_func_strAddr]
add ecx, ebx
mov [ecx], eax
ret
e15_at_asm_func$next:
mov eax, e15_at_asm_str
push eax
call e15_at_asm_func

#############新映射器效果############
jmp _str_pass
_str: dd "ABCD"
_str_pass:

;############[fun begin]func############
jmp _func_pass
_func:
pop ebp
pop eax
mv func__strAddr, eaxpush ebp
jmp func__a_pass
func__a: dd 0
func__a_pass:
pop eax
mov [func__a], eax
ret
;========[fun end]func========
_func_pass:

