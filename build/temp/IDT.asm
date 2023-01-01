
;############[fun begin]init############
jmp IDT_z_init$pass
IDT_z_init:
pop ebp
push ebp
mov eax, 0
push eax
jmp IDT_z_init_i$pass
IDT_z_init_i: dd 0
IDT_z_init_i$pass:
pop eax
mov [IDT_z_init_i], eax

;########## IDT_z_init_while#r1_$start ##########
IDT_z_init_while#r1_$start:
mov eax, [IDT_z_init_i]
push eax
mov eax, 256
push eax
pop ebx
pop eax
cmp eax, ebx
jb IDT_z_init_while#r1_les#r2$true
mov eax, 0
jmp IDT_z_init_while#r1_les#r2$false
IDT_z_init_while#r1_les#r2$true:
mov eax, 1
IDT_z_init_while#r1_les#r2$false:
push eax
pop eax
cmp eax, 0
je IDT_z_init_while#r1_$end
mov eax, [IDT_z_init_i]
push eax
mov eax, 0
push eax
pop eax
pop ebx
mov [main_z_addrIDT+ebx], eax
mov eax, [IDT_z_init_i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [IDT_z_init_i], eax
jmp IDT_z_init_while#r1_$start
IDT_z_init_while#r1_$end:
;========== IDT_z_init_while#r1_$end ==========

call kernel_z_loadIDT

ret
IDT_z_init$pass:
;============[fun end]init=============


