
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

;########## GDT_z@init@while#1@$start ##########
GDT_z@init@while#1@$start:
mov eax, [GDT_z@init@while#1@i]
push eax
mov eax, 8192
push eax
pop ebx
pop eax
cmp eax, ebx
jb GDT_z@init@while#1@les#1@true
mov eax, 0
jmp GDT_z@init@while#1@les#1@false
GDT_z@init@while#1@les#1@true:
mov eax, 1
GDT_z@init@while#1@les#1@false:
push eax
pop eax
cmp eax, 0
je GDT_z@init@while#1@$end
mov eax, [main_z_Addr]
push eax

