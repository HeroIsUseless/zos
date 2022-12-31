;########## e12_nest_z@if#r1@$start ##########
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@if#r1@$else
;########## e12_nest_z@if#r1@if#r2@$start ##########
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@if#r1@if#r2@$else
jmp e12_nest_z@if#r1@if#r2@$end
e12_nest_z@if#r1@if#r2@$else:
mov eax, 1
push eax
jmp e12_nest_z@if#r1@if#r2@a$pass
e12_nest_z@if#r1@if#r2@a: dd 0
e12_nest_z@if#r1@if#r2@a$pass:
pop eax
mov [e12_nest_z@if#r1@if#r2@a], eax

e12_nest_z@if#r1@if#r2@$end:
;========== e12_nest_z@if#r1@if#r2@$end ==========

jmp e12_nest_z@if#r1@$end
e12_nest_z@if#r1@$else:
e12_nest_z@if#r1@$end:
;========== e12_nest_z@if#r1@$end ==========

;########## e12_nest_z@if#r3@$start ##########
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@if#r3@$else
jmp e12_nest_z@if#r3@$end
e12_nest_z@if#r3@$else:
e12_nest_z@if#r3@$end:
;========== e12_nest_z@if#r3@$end ==========

;########## e12_nest_z@while#r4@$start ##########
e12_nest_z@while#r4@$start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@while#r4@$end
;########## e12_nest_z@while#r4@while#r5@$start ##########
e12_nest_z@while#r4@while#r5@$start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@while#r4@while#r5@$end
jmp e12_nest_z@while#r4@while#r5@$start
e12_nest_z@while#r4@while#r5@$end:
;========== e12_nest_z@while#r4@while#r5@$end ==========

jmp e12_nest_z@while#r4@$start
e12_nest_z@while#r4@$end:
;========== e12_nest_z@while#r4@$end ==========

;########## e12_nest_z@while#r6@$start ##########
e12_nest_z@while#r6@$start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z@while#r6@$end
jmp e12_nest_z@while#r6@$start
e12_nest_z@while#r6@$end:
;========== e12_nest_z@while#r6@$end ==========


