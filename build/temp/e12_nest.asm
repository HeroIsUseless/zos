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
;########## e12_nest_z@if#1@$start ##########
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@if#1@$else
;########## e12_nest_z@if#1@if#1@$start ##########
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@if#1@if#1@$else
jmp e12_nest_z@if#1@if#1@$end
e12_nest_z@if#1@if#1@$else:
mov eax, 1
push eax
jmp e12_nest_z@if#1@if#1@a$pass
e12_nest_z@if#1@if#1@a: dd 0
e12_nest_z@if#1@if#1@a$pass:
pop eax
mov [e12_nest_z@if#1@if#1@a], eax

e12_nest_z@if#1@if#1@$end:
;========== e12_nest_z@if#1@if#1@$end ==========

jmp e12_nest_z@if#1@$end
e12_nest_z@if#1@$else:
e12_nest_z@if#1@$end:
;========== e12_nest_z@if#1@$end ==========

;########## e12_nest_z@if#2@$start ##########
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@if#2@$else
jmp e12_nest_z@if#2@$end
e12_nest_z@if#2@$else:
e12_nest_z@if#2@$end:
;========== e12_nest_z@if#2@$end ==========

;########## e12_nest_z@while#1@$start ##########
e12_nest_z@while#1@$start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@while#1@$end
;########## e12_nest_z@while#1@while#1@$start ##########
e12_nest_z@while#1@while#1@$start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@while#1@while#1@$end
jmp e12_nest_z@while#1@while#1@$start
e12_nest_z@while#1@while#1@$end:
;========== e12_nest_z@while#1@while#1@$end ==========

jmp e12_nest_z@while#1@$start
e12_nest_z@while#1@$end:
;========== e12_nest_z@while#1@$end ==========

;########## e12_nest_z@while#2@$start ##########
e12_nest_z@while#2@$start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@while#2@$end
jmp e12_nest_z@while#2@$start
e12_nest_z@while#2@$end:
;========== e12_nest_z@while#2@$end ==========


