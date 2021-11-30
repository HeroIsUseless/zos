
;function
jmp draw_z_pixel$next
draw_z_pixel:
;param
jmp draw_z_pixel_x$next
draw_z_pixel_x: dd 0
draw_z_pixel_x$next:
;param
jmp draw_z_pixel_y$next
draw_z_pixel_y: dd 0
draw_z_pixel_y$next:
;param
jmp draw_z_pixel_color$next
draw_z_pixel_color: dd 0
draw_z_pixel_color$next:
;param
jmp draw_z_pixel_screenWidth$next
draw_z_pixel_screenWidth: dd 0
draw_z_pixel_screenWidth$next:
;param
jmp draw_z_pixel_vramAddr$next
draw_z_pixel_vramAddr: dd 0
draw_z_pixel_vramAddr$next:
pop ebp
pop eax
mov [draw_z_pixel_vramAddr], eax
pop eax
mov [draw_z_pixel_screenWidth], eax
pop eax
mov [draw_z_pixel_color], eax
pop eax
mov [draw_z_pixel_y], eax
pop eax
mov [draw_z_pixel_x], eax
push ebp
mov eax, [draw_z_pixel_y]
push eax
mov eax, [draw_z_pixel_screenWidth]
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z_pixel_x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [draw_z_pixel_vramAddr]
push eax
pop eax
pop ebx
add eax, ebx
push eax
jmp draw_z_pixel_addr$next
draw_z_pixel_addr: dd 0
draw_z_pixel_addr$next:
pop eax
mov [draw_z_pixel_addr], eax
mov eax, [draw_z_pixel_color]
push eax
mov eax, [draw_z_pixel_addr]
push eax
call memory_z_set_1byte
ret
draw_z_pixel$next:

;function
jmp draw_z_hLine$next
draw_z_hLine:
;param
jmp draw_z_hLine_bx$next
draw_z_hLine_bx: dd 0
draw_z_hLine_bx$next:
;param
jmp draw_z_hLine_by$next
draw_z_hLine_by: dd 0
draw_z_hLine_by$next:
;param
jmp draw_z_hLine_ex$next
draw_z_hLine_ex: dd 0
draw_z_hLine_ex$next:
;param
jmp draw_z_hLine_ey$next
draw_z_hLine_ey: dd 0
draw_z_hLine_ey$next:
;param
jmp draw_z_hLine_color$next
draw_z_hLine_color: dd 0
draw_z_hLine_color$next:
;param
jmp draw_z_hLine_screenWidth$next
draw_z_hLine_screenWidth: dd 0
draw_z_hLine_screenWidth$next:
;param
jmp draw_z_hLine_vramAddr$next
draw_z_hLine_vramAddr: dd 0
draw_z_hLine_vramAddr$next:
pop ebp
pop eax
mov [draw_z_hLine_vramAddr], eax
pop eax
mov [draw_z_hLine_screenWidth], eax
pop eax
mov [draw_z_hLine_color], eax
pop eax
mov [draw_z_hLine_ey], eax
pop eax
mov [draw_z_hLine_ex], eax
pop eax
mov [draw_z_hLine_by], eax
pop eax
mov [draw_z_hLine_bx], eax
push ebp
mov eax, [draw_z_hLine_bx]
push eax
jmp draw_z_hLine_i$next
draw_z_hLine_i: dd 0
draw_z_hLine_i$next:
pop eax
mov [draw_z_hLine_i], eax
; while start
draw_z_hLine_while$1_start:
mov eax, [draw_z_hLine_i]
push eax
mov eax, [draw_z_hLine_ex]
push eax
pop ebx
pop eax
cmp eax, ebx
jbe draw_z_hLine_while$1_lessequal@true$1
mov eax, 0
jmp draw_z_hLine_while$1_lessequal@false$1
draw_z_hLine_while$1_lessequal@true$1:
mov eax, 1
draw_z_hLine_while$1_lessequal@false$1:
push eax
pop eax
cmp eax, 0
je draw_z_hLine_while$1_end
mov eax, [draw_z_hLine_i]
push eax
mov eax, [draw_z_hLine_by]
push eax
mov eax, [draw_z_hLine_color]
push eax
mov eax, [draw_z_hLine_screenWidth]
push eax
mov eax, [draw_z_hLine_vramAddr]
push eax
call draw_z_pixel
mov eax, [draw_z_hLine_i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_hLine_i], eax
jmp draw_z_hLine_while$1_start
draw_z_hLine_while$1_end:
;while end
ret
draw_z_hLine$next:

;function
jmp draw_z_flush$next
draw_z_flush:
;param
jmp draw_z_flush_addrVram$next
draw_z_flush_addrVram: dd 0
draw_z_flush_addrVram$next:
pop ebp
pop eax
mov [draw_z_flush_addrVram], eax
push ebp
mov eax, 0
push eax
jmp draw_z_flush_x$next
draw_z_flush_x: dd 0
draw_z_flush_x$next:
pop eax
mov [draw_z_flush_x], eax
mov eax, 0
push eax
jmp draw_z_flush_y$next
draw_z_flush_y: dd 0
draw_z_flush_y$next:
pop eax
mov [draw_z_flush_y], eax
; while start
draw_z_flush_while$1_start:
mov eax, [draw_z_flush_y]
push eax
mov eax, 200
push eax
pop ebx
pop eax
cmp eax, ebx
jbe draw_z_flush_while$1_lessequal@true$2
mov eax, 0
jmp draw_z_flush_while$1_lessequal@false$2
draw_z_flush_while$1_lessequal@true$2:
mov eax, 1
draw_z_flush_while$1_lessequal@false$2:
push eax
pop eax
cmp eax, 0
je draw_z_flush_while$1_end
mov eax, 0
push eax
pop eax
mov [draw_z_flush_x], eax
; while start
draw_z_flush_while$1_while$1_start:
mov eax, [draw_z_flush_x]
push eax
mov eax, 320
push eax
pop ebx
pop eax
cmp eax, ebx
jbe draw_z_flush_while$1_while$1_lessequal@true$3
mov eax, 0
jmp draw_z_flush_while$1_while$1_lessequal@false$3
draw_z_flush_while$1_while$1_lessequal@true$3:
mov eax, 1
draw_z_flush_while$1_while$1_lessequal@false$3:
push eax
pop eax
cmp eax, 0
je draw_z_flush_while$1_while$1_end
mov eax, [draw_z_flush_y]
push eax
mov eax, 320
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z_flush_x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [font_z_screen_buf+eax]
push ebx
jmp draw_z_flush_while$1_while$1_color$next
draw_z_flush_while$1_while$1_color: dd 0
draw_z_flush_while$1_while$1_color$next:
pop eax
mov [draw_z_flush_while$1_while$1_color], eax
mov eax, [draw_z_flush_x]
push eax
mov eax, [draw_z_flush_y]
push eax
mov eax, [draw_z_flush_while$1_while$1_color]
push eax
mov eax, 320
push eax
mov eax, [draw_z_flush_addrVram]
push eax
call draw_z_pixel
mov eax, [draw_z_flush_x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_flush_x], eax
jmp draw_z_flush_while$1_while$1_start
draw_z_flush_while$1_while$1_end:
;while end
mov eax, [draw_z_flush_y]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_flush_y], eax
jmp draw_z_flush_while$1_start
draw_z_flush_while$1_end:
;while end
ret
draw_z_flush$next:
