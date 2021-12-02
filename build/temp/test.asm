
;function
jmp test_z_rect$next
test_z_rect:
;param
jmp test_z_rect_left$next
test_z_rect_left: dd 0
test_z_rect_left$next:
;param
jmp test_z_rect_top$next
test_z_rect_top: dd 0
test_z_rect_top$next:
;param
jmp test_z_rect_addrVram$next
test_z_rect_addrVram: dd 0
test_z_rect_addrVram$next:
pop ebp
pop eax
mov [test_z_rect_addrVram], eax
pop eax
mov [test_z_rect_top], eax
pop eax
mov [test_z_rect_left], eax
push ebp
mov eax, 0
push eax
jmp test_z_rect_x$next
test_z_rect_x: dd 0
test_z_rect_x$next:
pop eax
mov [test_z_rect_x], eax
mov eax, 0
push eax
jmp test_z_rect_y$next
test_z_rect_y: dd 0
test_z_rect_y$next:
pop eax
mov [test_z_rect_y], eax
; while start
test_z_rect_while$1_start:
mov eax, [test_z_rect_y]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jbe test_z_rect_while$1_lessequal@true$1
mov eax, 0
jmp test_z_rect_while$1_lessequal@false$1
test_z_rect_while$1_lessequal@true$1:
mov eax, 1
test_z_rect_while$1_lessequal@false$1:
push eax
pop eax
cmp eax, 0
je test_z_rect_while$1_end
; while start
test_z_rect_while$1_while$1_start:
mov eax, [test_z_rect_x]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jbe test_z_rect_while$1_while$1_lessequal@true$2
mov eax, 0
jmp test_z_rect_while$1_while$1_lessequal@false$2
test_z_rect_while$1_while$1_lessequal@true$2:
mov eax, 1
test_z_rect_while$1_while$1_lessequal@false$2:
push eax
pop eax
cmp eax, 0
je test_z_rect_while$1_while$1_end
mov eax, 3
push eax
jmp test_z_rect_while$1_while$1_color$next
test_z_rect_while$1_while$1_color: dd 0
test_z_rect_while$1_while$1_color$next:
pop eax
mov [test_z_rect_while$1_while$1_color], eax
mov eax, [test_z_rect_left]
push eax
mov eax, [test_z_rect_x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [test_z_rect_top]
push eax
mov eax, [test_z_rect_y]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [test_z_rect_while$1_while$1_color]
push eax
mov eax, 320
push eax
mov eax, [test_z_rect_addrVram]
push eax
call draw_z_pixel
mov eax, [test_z_rect_x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z_rect_x], eax
jmp test_z_rect_while$1_while$1_start
test_z_rect_while$1_while$1_end:
;while end
mov eax, [test_z_rect_y]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z_rect_y], eax
jmp test_z_rect_while$1_start
test_z_rect_while$1_end:
;while end
ret
test_z_rect$next:

;function
jmp test_z_block$next
test_z_block:
;param
jmp test_z_block_addrVram$next
test_z_block_addrVram: dd 0
test_z_block_addrVram$next:
pop ebp
pop eax
mov [test_z_block_addrVram], eax
push ebp
mov eax, 0
push eax
jmp test_z_block_i$next
test_z_block_i: dd 0
test_z_block_i$next:
pop eax
mov [test_z_block_i], eax
mov eax, 0
push eax
jmp test_z_block_x$next
test_z_block_x: dd 0
test_z_block_x$next:
pop eax
mov [test_z_block_x], eax
mov eax, 0
push eax
jmp test_z_block_y$next
test_z_block_y: dd 0
test_z_block_y$next:
pop eax
mov [test_z_block_y], eax
; while start
test_z_block_while$1_start:
mov eax, [test_z_block_y]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jb test_z_block_while$1_less@true$3
mov eax, 0
jmp test_z_block_while$1_less@false$3
test_z_block_while$1_less@true$3:
mov eax, 1
test_z_block_while$1_less@false$3:
push eax
pop eax
cmp eax, 0
je test_z_block_while$1_end
mov eax, 0
push eax
pop eax
mov [test_z_block_x], eax
; while start
test_z_block_while$1_while$1_start:
mov eax, [test_z_block_x]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jb test_z_block_while$1_while$1_less@true$4
mov eax, 0
jmp test_z_block_while$1_while$1_less@false$4
test_z_block_while$1_while$1_less@true$4:
mov eax, 1
test_z_block_while$1_while$1_less@false$4:
push eax
pop eax
cmp eax, 0
je test_z_block_while$1_while$1_end
mov eax, [test_z_block_y]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [test_z_block_x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [font_z_A+eax]
push ebx
jmp test_z_block_while$1_while$1_color$next
test_z_block_while$1_while$1_color: dd 0
test_z_block_while$1_while$1_color$next:
pop eax
mov [test_z_block_while$1_while$1_color], eax
mov eax, 10
push eax
mov eax, [test_z_block_x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, 10
push eax
mov eax, [test_z_block_y]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [test_z_block_while$1_while$1_color]
push eax
mov eax, 320
push eax
mov eax, [test_z_block_addrVram]
push eax
call draw_z_pixel
mov eax, [test_z_block_x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z_block_x], eax
jmp test_z_block_while$1_while$1_start
test_z_block_while$1_while$1_end:
;while end
mov eax, [test_z_block_y]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z_block_y], eax
jmp test_z_block_while$1_start
test_z_block_while$1_end:
;while end
ret
test_z_block$next:

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
mov eax, [test_z_draw_addrVram]
push eax
call test_z_block
ret
test_z_draw$next:
