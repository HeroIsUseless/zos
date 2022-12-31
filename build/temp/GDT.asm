
;############[fun begin]init############
jmp GDT_z@init$pass
GDT_z@init:
pop ebp
push ebp
mov eax, 0
push eax
jmp GDT_z@init@i$pass
GDT_z@init@i: dd 0
GDT_z@init@i$pass:
pop eax
mov [GDT_z@init@i], eax

;########## GDT_z@init@while#r1@$start ##########
GDT_z@init@while#r1@$start:
mov eax, [GDT_z@init@i]
push eax
mov eax, 8192
push eax
pop ebx
pop eax
cmp eax, ebx
jb les#r2@true
mov eax, 0
jmp les#r2@false
les#r2@true:
mov eax, 1
les#r2@false:
push eax
pop eax
cmp eax, 0
je GDT_z@init@while#r1@$end
mov eax, [GDT_z@init@i]
push eax
mov eax, 2
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, 0
push eax
pop eax
pop ebx
mov [main_z_Addr_GDT+ebx], eax
mov eax, [GDT_z@init@i]
push eax
mov eax, 2
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, 0
push eax
pop eax
pop ebx
mov [main_z_Addr_GDT+ebx], eax
mov eax, [GDT_z@init@i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [GDT_z@init@i], eax
jmp GDT_z@init@while#r1@$start
GDT_z@init@while#r1@$end:
;========== GDT_z@init@while#r1@$end ==========

mov eax, [main_z_Addr_GDT]
push eax
mov eax, 1
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, 0x00000000
push eax
mov eax, 0x0fffff92
push eax
call kernel_z_setGDT

mov eax, [main_z_Addr_GDT]
push eax
mov eax, 2
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, 0x00000000
push eax
mov eax, 0x07ffff9a
push eax
call kernel_z_setGDT

call kernel_z_loadGDT

ret
GDT_z@init$pass:
;============[fun end]init=============


