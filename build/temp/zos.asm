[bits 32]
ORG 0x280000
mov eax, 320
push eax
jmp main_z_screenWidth$next
main_z_screenWidth: dd 0
main_z_screenWidth$next:
pop eax
mov [main_z_screenWidth], eax
mov eax, 200
push eax
jmp main_z_screenHeight$next
main_z_screenHeight: dd 0
main_z_screenHeight$next:
pop eax
mov [main_z_screenHeight], eax
mov eax, 0x000a0000
push eax
jmp main_z_addrVram$next
main_z_addrVram: dd 0
main_z_addrVram$next:
pop eax
mov [main_z_addrVram], eax
mov eax, 0x0024e000
push eax
jmp main_z_addrPM$next
main_z_addrPM: dd 0
main_z_addrPM$next:
pop eax
mov [main_z_addrPM], eax
mov eax, 0x0026e000
push eax
jmp main_z_addrPDT$next
main_z_addrPDT: dd 0
main_z_addrPDT$next:
pop eax
mov [main_z_addrPDT], eax
mov eax, 0x0026f800
push eax
jmp main_z_addrIDT$next
main_z_addrIDT: dd 0
main_z_addrIDT$next:
pop eax
mov [main_z_addrIDT], eax
mov eax, 0x00270000
push eax
jmp main_z_addrGDT$next
main_z_addrGDT: dd 0
main_z_addrGDT$next:
pop eax
mov [main_z_addrGDT], eax

;function
jmp main_z_run_once$next
main_z_run_once:
pop ebp
push ebp
ret
main_z_run_once$next:

;function
jmp main_z_run_loop$next
main_z_run_loop:
pop ebp
push ebp
call kernel_z_halt
ret
main_z_run_loop$next:

;function
jmp memory_z_set_1byte$next
memory_z_set_1byte:
;param
jmp memory_z_set_1byte_val$next
memory_z_set_1byte_val: dd 0
memory_z_set_1byte_val$next:
;param
jmp memory_z_set_1byte_addr$next
memory_z_set_1byte_addr: dd 0
memory_z_set_1byte_addr$next:
pop ebp
pop eax
mov [memory_z_set_1byte_addr], eax
pop eax
mov [memory_z_set_1byte_val], eax
push ebp
mov eax, [memory_z_set_1byte_val]
push eax
mov eax, [memory_z_set_1byte_addr]
push eax
call kernel_z_setMem_1byte
ret
memory_z_set_1byte$next:

;function
jmp memory_z_set_2byte$next
memory_z_set_2byte:
;param
jmp memory_z_set_2byte_val$next
memory_z_set_2byte_val: dd 0
memory_z_set_2byte_val$next:
;param
jmp memory_z_set_2byte_addr$next
memory_z_set_2byte_addr: dd 0
memory_z_set_2byte_addr$next:
pop ebp
pop eax
mov [memory_z_set_2byte_addr], eax
pop eax
mov [memory_z_set_2byte_val], eax
push ebp
mov eax, [memory_z_set_2byte_val]
push eax
mov eax, [memory_z_set_2byte_addr]
push eax
call kernel_z_setMem_2byte
ret
memory_z_set_2byte$next:

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
jmp draw_z_font$next
draw_z_font:
;param
jmp draw_z_font_charAddr$next
draw_z_font_charAddr: dd 0
draw_z_font_charAddr$next:
;param
jmp draw_z_font_left$next
draw_z_font_left: dd 0
draw_z_font_left$next:
;param
jmp draw_z_font_top$next
draw_z_font_top: dd 0
draw_z_font_top$next:
;param
jmp draw_z_font_foreColor$next
draw_z_font_foreColor: dd 0
draw_z_font_foreColor$next:
;param
jmp draw_z_font_backColor$next
draw_z_font_backColor: dd 0
draw_z_font_backColor$next:
pop ebp
pop eax
mov [draw_z_font_backColor], eax
pop eax
mov [draw_z_font_foreColor], eax
pop eax
mov [draw_z_font_top], eax
pop eax
mov [draw_z_font_left], eax
pop eax
mov [draw_z_font_charAddr], eax
push ebp
ret
draw_z_font$next:

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
jmp draw_z_flush_left$next
draw_z_flush_left: dd 0
draw_z_flush_left$next:
pop eax
mov [draw_z_flush_left], eax
mov eax, 0
push eax
jmp draw_z_flush_top$next
draw_z_flush_top: dd 0
draw_z_flush_top$next:
pop eax
mov [draw_z_flush_top], eax
; while start
draw_z_flush_while$1_start:
mov eax, [draw_z_flush_top]
push eax
mov eax, 25
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
mov [draw_z_flush_left], eax
; while start
draw_z_flush_while$1_while$1_start:
mov eax, [draw_z_flush_left]
push eax
mov eax, 40
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
mov eax, [draw_z_flush_top]
push eax
mov eax, 40
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z_flush_left]
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
mov eax, [draw_z_flush_left]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z_flush_top]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z_flush_while$1_while$1_color]
push eax
mov eax, 320
push eax
mov eax, [draw_z_flush_addrVram]
push eax
call draw_z_pixel
mov eax, [draw_z_flush_left]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_flush_left], eax
jmp draw_z_flush_while$1_while$1_start
draw_z_flush_while$1_while$1_end:
;while end
mov eax, [draw_z_flush_top]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_flush_top], eax
jmp draw_z_flush_while$1_start
draw_z_flush_while$1_end:
;while end
ret
draw_z_flush$next:

;function
jmp draw_z_char$next
draw_z_char:
;param
jmp draw_z_char_ascii$next
draw_z_char_ascii: dd 0
draw_z_char_ascii$next:
;param
jmp draw_z_char_addrVram$next
draw_z_char_addrVram: dd 0
draw_z_char_addrVram$next:
pop ebp
pop eax
mov [draw_z_char_addrVram], eax
pop eax
mov [draw_z_char_ascii], eax
push ebp
ret
draw_z_char$next:

;function
jmp draw_z_string$next
draw_z_string:
;param
jmp draw_z_string_strAddr$next
draw_z_string_strAddr: dd 0
draw_z_string_strAddr$next:
;param
jmp draw_z_string_addrVram$next
draw_z_string_addrVram: dd 0
draw_z_string_addrVram$next:
pop ebp
pop eax
mov [draw_z_string_addrVram], eax
pop eax
mov [draw_z_string_strAddr], eax
push ebp
ret
draw_z_string$next:
jmp font_z_font_A$next
font_z_font_A: dd \
0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_font_A$next:
jmp font_z_font_B$next
font_z_font_B: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
font_z_font_B$next:
jmp font_z_font_C$next
font_z_font_C: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
font_z_font_C$next:
jmp font_z_font_D$next
font_z_font_D: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
font_z_font_D$next:
jmp font_z_font_E$next
font_z_font_E: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
font_z_font_E$next:
jmp font_z_font_F$next
font_z_font_F: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_F$next:
jmp font_z_font_G$next
font_z_font_G: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,1,0,0,0,0,1,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
font_z_font_G$next:
jmp font_z_font_H$next
font_z_font_H: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_font_H$next:
jmp font_z_font_I$next
font_z_font_I: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_I$next:
jmp font_z_font_J$next
font_z_font_J: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_J$next:
jmp font_z_font_K$next
font_z_font_K: dd \
0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,1,0,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,1,1,0,0,0,0,1,0,0,1,1,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
font_z_font_K$next:
jmp font_z_font_L$next
font_z_font_L: dd \
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
font_z_font_L$next:
jmp font_z_font_M$next
font_z_font_M: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_font_M$next:
jmp font_z_font_N$next
font_z_font_N: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,0,0,0,1,0,0,1,0,1,0,0,1,0,0,1,0,0,1,0,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_font_N$next:
jmp font_z_font_O$next
font_z_font_O: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
font_z_font_O$next:
jmp font_z_font_P$next
font_z_font_P: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_P$next:
jmp font_z_font_Q$next
font_z_font_Q: dd \
0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,1,0,1,0,0,0,1,0,0,1,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0,0,
font_z_font_Q$next:
jmp font_z_font_R$next
font_z_font_R: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_font_R$next:
jmp font_z_font_S$next
font_z_font_S: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,1,0,0,0,0,1,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
font_z_font_S$next:
jmp font_z_font_T$next
font_z_font_T: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_T$next:
jmp font_z_font_U$next
font_z_font_U: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_U$next:
jmp font_z_font_V$next
font_z_font_V: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_V$next:
jmp font_z_font_W$next
font_z_font_W: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_font_W$next:
jmp font_z_font_X$next
font_z_font_X: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_font_X$next:
jmp font_z_font_Y$next
font_z_font_Y: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,1,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_Y$next:
jmp font_z_font_Z$next
font_z_font_Z: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
font_z_font_Z$next:
jmp font_z_font_question$next
font_z_font_question: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
font_z_font_question$next:
jmp font_z_font_space$next
font_z_font_space: dd \
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_space$next:
jmp font_z_font_add$next
font_z_font_add: dd \
0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_add$next:
jmp font_z_font_sub$next
font_z_font_sub: dd \
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_font_sub$next:
jmp font_z_screen_buf$next
font_z_screen_buf: dd \
32,32,32,32,33,34,35,36,37,38,39,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,
font_z_screen_buf$next:

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
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_flush
jmp test_z_draw_tstr$next
test_z_draw_tstr: dd \
65, 66, 67, 68, 0
test_z_draw_tstr$next:
mov eax, test_z_draw_tstr
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_string
ret
test_z_draw$next:
jmp main

; 读写内存
; kernel.z\setMem.1byte(val:dword, addr:dword)
kernel_z_setMem_1byte:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], al
ret

; kernel.z\setMem.2byte(val:dword, addr:dword)
kernel_z_setMem_2byte:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], ax
ret

; kernel.z\setMem.4byte(val:dword, addr:dword)
kernel_z_setMem_4byte:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], eax
ret

; kernel.z\halt()
kernel_z_halt:
  hlt
ret

main:
  call main_z_run_once
  .loop:
    call main_z_run_loop
  jmp .loop

