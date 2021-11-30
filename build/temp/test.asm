
;function
jmp test_z_draw$next
test_z_draw:
;param
jmp test_z_draw_addrVram$next
test_z_draw_addrVram: dd 0
test_z_draw_addrVram$next:
pop ebp
pop eax
mov [test_z_draw_addrVram], eax
push ebp
mov eax, 0
push eax
jmp test_z_draw_i$next
test_z_draw_i: dd 0
test_z_draw_i$next:
pop eax
mov [test_z_draw_i], eax
; while start
test_z_draw_while$1_start:
mov eax, [test_z_draw_i]
push eax
mov eax, 300
push eax
pop ebx
pop eax
cmp eax, ebx
jb test_z_draw_while$1_less@true$1
mov eax, 0
jmp test_z_draw_while$1_less@false$1
test_z_draw_while$1_less@true$1:
mov eax, 1
test_z_draw_while$1_less@false$1:
push eax
pop eax
cmp eax, 0
je test_z_draw_while$1_end
mov eax, [test_z_draw_i]
push eax
mov eax, [test_z_draw_i]
push eax
mov eax, [test_z_draw_i]
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, [test_z_draw_i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z_draw_i], eax
jmp test_z_draw_while$1_start
test_z_draw_while$1_end:
;while end
mov eax, 0
push eax
jmp test_z_draw_x$next
test_z_draw_x: dd 0
test_z_draw_x$next:
pop eax
mov [test_z_draw_x], eax
mov eax, 0
push eax
jmp test_z_draw_y$next
test_z_draw_y: dd 0
test_z_draw_y$next:
pop eax
mov [test_z_draw_y], eax
; while start
test_z_draw_while$2_start:
mov eax, [test_z_draw_y]
push eax
mov eax, 200
push eax
pop ebx
pop eax
cmp eax, ebx
jbe test_z_draw_while$2_lessequal@true$2
mov eax, 0
jmp test_z_draw_while$2_lessequal@false$2
test_z_draw_while$2_lessequal@true$2:
mov eax, 1
test_z_draw_while$2_lessequal@false$2:
push eax
pop eax
cmp eax, 0
je test_z_draw_while$2_end
mov eax, 0
push eax
pop eax
mov [test_z_draw_x], eax
; while start
test_z_draw_while$2_while$1_start:
mov eax, [test_z_draw_x]
push eax
mov eax, 320
push eax
pop ebx
pop eax
cmp eax, ebx
jbe test_z_draw_while$2_while$1_lessequal@true$3
mov eax, 0
jmp test_z_draw_while$2_while$1_lessequal@false$3
test_z_draw_while$2_while$1_lessequal@true$3:
mov eax, 1
test_z_draw_while$2_while$1_lessequal@false$3:
push eax
pop eax
cmp eax, 0
je test_z_draw_while$2_while$1_end
mov eax, [test_z_draw_x]
push eax
mov eax, [test_z_draw_y]
push eax
mov eax, [test_z_draw_x]
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, [test_z_draw_x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z_draw_x], eax
jmp test_z_draw_while$2_while$1_start
test_z_draw_while$2_while$1_end:
;while end
mov eax, [test_z_draw_y]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z_draw_y], eax
jmp test_z_draw_while$2_start
test_z_draw_while$2_end:
;while end
ret
test_z_draw$next:
