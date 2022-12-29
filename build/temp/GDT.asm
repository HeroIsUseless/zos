
;function
jmp GDT_z_init$next
GDT_z_init:
pop ebp
push ebp
mov eax, 0
push eax
jmp GDT_z_init_i$next
GDT_z_init_i: dd 0
GDT_z_init_i$next:
pop eax
mov [GDT_z_init_i], eax
; while start
GDT_z_init_while$1_start:
mov eax, [GDT_z_init_i]
push eax
mov eax, 8192
push eax
pop ebx
pop eax
cmp eax, ebx
jb GDT_z_init_while$1_less@true$1
mov eax, 0
jmp GDT_z_init_while$1_less@false$1
GDT_z_init_while$1_less@true$1:
mov eax, 1
GDT_z_init_while$1_less@false$1:
push eax
pop eax
cmp eax, 0
je GDT_z_init_while$1_end
mov eax, [GDT_z_init_while$1_main_z_Addr]
push eax
