jmp test_z_draw$next
test_z_draw:
jmp test_z_draw_addrVram$next
test_z_draw_addrVram: dd 0
test_z_draw_addrVram$next:
pop ebp
pop eax
mov [test_z_draw_addrVram], eax
push ebp
mov eax, 0
push eax
mov eax, 0
push eax
mov eax, 0
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 1
push eax
mov eax, 1
push eax
mov eax, 1
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 2
push eax
mov eax, 2
push eax
mov eax, 2
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 3
push eax
mov eax, 3
push eax
mov eax, 3
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 4
push eax
mov eax, 4
push eax
mov eax, 4
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 5
push eax
mov eax, 5
push eax
mov eax, 5
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 6
push eax
mov eax, 6
push eax
mov eax, 6
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 7
push eax
mov eax, 7
push eax
mov eax, 7
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 8
push eax
mov eax, 8
push eax
mov eax, 8
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 9
push eax
mov eax, 9
push eax
mov eax, 9
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 10
push eax
mov eax, 10
push eax
mov eax, 10
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 11
push eax
mov eax, 11
push eax
mov eax, 11
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 12
push eax
mov eax, 12
push eax
mov eax, 12
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 13
push eax
mov eax, 13
push eax
mov eax, 13
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 14
push eax
mov eax, 14
push eax
mov eax, 14
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 15
push eax
mov eax, 15
push eax
mov eax, 15
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
; while start
test_z_draw_while$1_start:
mov eax, [test_z_draw_while$1_i]
push eax
mov eax, 16
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
cmp eax, 0
je test_z_draw_while$1_end
mov eax, [test_z_draw_while$1_i]
push eax
mov eax, 0
push eax
mov eax, [test_z_draw_while$1_i]
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_while$1_addrVram]
push eax
call draw_z_pixel
mov eax, [test_z_draw_while$1_i]
push eax
mov eax, 1
pop ebx
add eax, ebx
mov [ !!! var is not defined !!! i], eax
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
mov eax, [test_z_draw_while$2_y]
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
cmp eax, 0
je test_z_draw_while$2_end
; while start
test_z_draw_while$2_while$1_start:
mov eax, [test_z_draw_while$2_while$1_x]
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
cmp eax, 0
je test_z_draw_while$2_while$1_end
mov eax, [test_z_draw_while$2_while$1_x]
push eax
mov eax, [test_z_draw_while$2_while$1_y]
push eax
mov eax, [test_z_draw_while$2_while$1_y]
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_while$2_while$1_addrVram]
push eax
call draw_z_pixel
mov eax, [test_z_draw_while$2_while$1_x]
push eax
mov eax, 1
pop ebx
add eax, ebx
mov [ !!! var is not defined !!! x], eax
jmp test_z_draw_while$2_while$1_start
test_z_draw_while$2_while$1_end:
;while end
mov eax, [test_z_draw_while$2_y]
push eax
mov eax, 1
pop ebx
add eax, ebx
mov [ !!! var is not defined !!! y], eax
jmp test_z_draw_while$2_start
test_z_draw_while$2_end:
;while end
ret
test_z_draw$next:
