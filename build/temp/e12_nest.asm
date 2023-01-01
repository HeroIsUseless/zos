;########## e12_nest_z_if#r1_$start ##########
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z_if#r1_$else
;########## e12_nest_z_if#r1_if#r2_$start ##########
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z_if#r1_if#r2_$else
jmp e12_nest_z_if#r1_if#r2_$end
e12_nest_z_if#r1_if#r2_$else:
mov eax, 1
push eax
jmp e12_nest_z_if#r1_if#r2_a$pass
e12_nest_z_if#r1_if#r2_a: dd 0
e12_nest_z_if#r1_if#r2_a$pass:
pop eax
mov [e12_nest_z_if#r1_if#r2_a], eax

e12_nest_z_if#r1_if#r2_$end:
;========== e12_nest_z_if#r1_if#r2_$end ==========

jmp e12_nest_z_if#r1_$end
e12_nest_z_if#r1_$else:
e12_nest_z_if#r1_$end:
;========== e12_nest_z_if#r1_$end ==========

;########## e12_nest_z_if#r3_$start ##########
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z_if#r3_$else
jmp e12_nest_z_if#r3_$end
e12_nest_z_if#r3_$else:
e12_nest_z_if#r3_$end:
;========== e12_nest_z_if#r3_$end ==========

;########## e12_nest_z_while#r4_$start ##########
e12_nest_z_while#r4_$start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z_while#r4_$end
;########## e12_nest_z_while#r4_while#r5_$start ##########
e12_nest_z_while#r4_while#r5_$start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z_while#r4_while#r5_$end
jmp e12_nest_z_while#r4_while#r5_$start
e12_nest_z_while#r4_while#r5_$end:
;========== e12_nest_z_while#r4_while#r5_$end ==========

jmp e12_nest_z_while#r4_$start
e12_nest_z_while#r4_$end:
;========== e12_nest_z_while#r4_$end ==========

;########## e12_nest_z_while#r6_$start ##########
e12_nest_z_while#r6_$start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e12_nest_z_while#r6_$end
jmp e12_nest_z_while#r6_$start
e12_nest_z_while#r6_$end:
;========== e12_nest_z_while#r6_$end ==========


