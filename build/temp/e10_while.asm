; while start
e10_while_asm_while$1_start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e10_while_asm_while$1_end
jmp e10_while_asm_while$1_start
e10_while_asm_while$1_end:
;while end
#############新映射器效果############
mov eax, 1
push eax

