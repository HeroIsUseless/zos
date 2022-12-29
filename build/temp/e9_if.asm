; if start
e9_if_asm_if$1_start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e9_if_asm_if$1_else
e9_if_asm_if$1_then:
jmp e9_if_asm_if$1_end
e9_if_asm_if$1_else:
e9_if_asm_if$1_end:
;if end
;#############新映射器效果############
mov eax, 1
push eax

