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


