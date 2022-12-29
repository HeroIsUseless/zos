; if start
e12_nest_asm_if$1_start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_asm_if$1_else
e12_nest_asm_if$1_then:
; if start
e12_nest_asm_if$1_if$1_start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_asm_if$1_if$1_else
e12_nest_asm_if$1_if$1_then:
jmp e12_nest_asm_if$1_if$1_end
e12_nest_asm_if$1_if$1_else:
mov eax, 1
push eax
jmp e12_nest_asm_if$1_if$1_a$next
e12_nest_asm_if$1_if$1_a: dd 0
e12_nest_asm_if$1_if$1_a$next:
pop eax
mov [e12_nest_asm_if$1_if$1_a], eax
e12_nest_asm_if$1_if$1_end:
;if end
jmp e12_nest_asm_if$1_end
e12_nest_asm_if$1_else:
e12_nest_asm_if$1_end:
;if end
; if start
e12_nest_asm_if$2_start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_asm_if$2_else
e12_nest_asm_if$2_then:
jmp e12_nest_asm_if$2_end
e12_nest_asm_if$2_else:
e12_nest_asm_if$2_end:
;if end
; while start
e12_nest_asm_while$1_start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_asm_while$1_end
; while start
e12_nest_asm_while$1_while$1_start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_asm_while$1_while$1_end
jmp e12_nest_asm_while$1_while$1_start
e12_nest_asm_while$1_while$1_end:
;while end
jmp e12_nest_asm_while$1_start
e12_nest_asm_while$1_end:
;while end
; while start
e12_nest_asm_while$2_start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_asm_while$2_end
jmp e12_nest_asm_while$2_start
e12_nest_asm_while$2_end:
;while end
;#############新映射器效果############
mov eax, 1
push eax
mov eax, 1
push eax
mov eax, 1
push eax
jmp e12_nest_z@a$pass
e12_nest_z@a: dd 0
e12_nest_z@a$pass:
pop eax
mov [e12_nest_z@a], eax

e12_nest_z@end:
;if end
mov eax, 1
push eax
mov eax, 1
push eax
mov eax, 1
push eax
mov eax, 1
push eax

