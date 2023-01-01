;########## e10_while_z_while#r1_$start ##########
e10_while_z_while#r1_$start:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e10_while_z_while#r1_$end
jmp e10_while_z_while#r1_$start
e10_while_z_while#r1_$end:
;========== e10_while_z_while#r1_$end ==========


