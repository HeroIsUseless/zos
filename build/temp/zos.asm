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
mov eax, [main_z_addrVram]
push eax
call test_z_draw
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
jb draw_z_flush_while$1_less@true$2
mov eax, 0
jmp draw_z_flush_while$1_less@false$2
draw_z_flush_while$1_less@true$2:
mov eax, 1
draw_z_flush_while$1_less@false$2:
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
jb draw_z_flush_while$1_while$1_less@true$3
mov eax, 0
jmp draw_z_flush_while$1_while$1_less@false$3
draw_z_flush_while$1_while$1_less@true$3:
mov eax, 1
draw_z_flush_while$1_while$1_less@false$3:
push eax
pop eax
cmp eax, 0
je draw_z_flush_while$1_while$1_end
mov eax, 15
push eax
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
jmp draw_z_char_left$next
draw_z_char_left: dd 0
draw_z_char_left$next:
;param
jmp draw_z_char_top$next
draw_z_char_top: dd 0
draw_z_char_top$next:
;param
jmp draw_z_char_foreColor$next
draw_z_char_foreColor: dd 0
draw_z_char_foreColor$next:
;param
jmp draw_z_char_backColor$next
draw_z_char_backColor: dd 0
draw_z_char_backColor$next:
;param
jmp draw_z_char_ascii$next
draw_z_char_ascii: dd 0
draw_z_char_ascii$next:
;param
jmp draw_z_char_screenWidth$next
draw_z_char_screenWidth: dd 0
draw_z_char_screenWidth$next:
;param
jmp draw_z_char_addrVram$next
draw_z_char_addrVram: dd 0
draw_z_char_addrVram$next:
pop ebp
pop eax
mov [draw_z_char_addrVram], eax
pop eax
mov [draw_z_char_screenWidth], eax
pop eax
mov [draw_z_char_ascii], eax
pop eax
mov [draw_z_char_backColor], eax
pop eax
mov [draw_z_char_foreColor], eax
pop eax
mov [draw_z_char_top], eax
pop eax
mov [draw_z_char_left], eax
push ebp
mov eax, [draw_z_char_ascii]
push eax
call font_z_getAddrByAscii
jmp draw_z_char_fontAddr$next
draw_z_char_fontAddr: dd 0
draw_z_char_fontAddr$next:
pop eax
mov [draw_z_char_fontAddr], eax
mov eax, 0
push eax
jmp draw_z_char_x$next
draw_z_char_x: dd 0
draw_z_char_x$next:
pop eax
mov [draw_z_char_x], eax
mov eax, 0
push eax
jmp draw_z_char_y$next
draw_z_char_y: dd 0
draw_z_char_y$next:
pop eax
mov [draw_z_char_y], eax
; while start
draw_z_char_while$1_start:
mov eax, [draw_z_char_y]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jb draw_z_char_while$1_less@true$4
mov eax, 0
jmp draw_z_char_while$1_less@false$4
draw_z_char_while$1_less@true$4:
mov eax, 1
draw_z_char_while$1_less@false$4:
push eax
pop eax
cmp eax, 0
je draw_z_char_while$1_end
mov eax, 0
push eax
pop eax
mov [draw_z_char_x], eax
; while start
draw_z_char_while$1_while$1_start:
mov eax, [draw_z_char_x]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jb draw_z_char_while$1_while$1_less@true$5
mov eax, 0
jmp draw_z_char_while$1_while$1_less@false$5
draw_z_char_while$1_while$1_less@true$5:
mov eax, 1
draw_z_char_while$1_while$1_less@false$5:
push eax
pop eax
cmp eax, 0
je draw_z_char_while$1_while$1_end
mov eax, [draw_z_char_y]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z_char_x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov ebx, 4
pop eax
mul ebx
mov ebx, eax
mov eax, [draw_z_char_fontAddr]
add eax, ebx
mov ebx, [eax]
push ebx
jmp draw_z_char_while$1_while$1_color$next
draw_z_char_while$1_while$1_color: dd 0
draw_z_char_while$1_while$1_color$next:
pop eax
mov [draw_z_char_while$1_while$1_color], eax
; if start
draw_z_char_while$1_while$1_if$1_start:
mov eax, [draw_z_char_y]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z_char_x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov ebx, 4
pop eax
mul ebx
mov ebx, eax
mov eax, [draw_z_char_fontAddr]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 0
push eax
pop ebx
pop eax
cmp eax, ebx
jne draw_z_char_while$1_while$1_if$1_unequal@true$6
mov eax, 0
jmp draw_z_char_while$1_while$1_if$1_unequal@false$6
draw_z_char_while$1_while$1_if$1_unequal@true$6:
mov eax, 1
draw_z_char_while$1_while$1_if$1_unequal@false$6:
push eax
pop eax
cmp eax, 0
je draw_z_char_while$1_while$1_if$1_else
draw_z_char_while$1_while$1_if$1_then:
mov eax, 15
push eax
pop eax
mov [draw_z_char_while$1_while$1_color], eax
jmp draw_z_char_while$1_while$1_if$1_end
draw_z_char_while$1_while$1_if$1_else:
mov eax, 0
push eax
pop eax
mov [draw_z_char_while$1_while$1_color], eax
draw_z_char_while$1_while$1_if$1_end:
;if end
mov eax, [draw_z_char_left]
push eax
mov eax, [draw_z_char_x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [draw_z_char_top]
push eax
mov eax, [draw_z_char_y]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [draw_z_char_while$1_while$1_color]
push eax
mov eax, 320
push eax
mov eax, [draw_z_char_addrVram]
push eax
call draw_z_pixel
mov eax, [draw_z_char_x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_char_x], eax
jmp draw_z_char_while$1_while$1_start
draw_z_char_while$1_while$1_end:
;while end
mov eax, [draw_z_char_y]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_char_y], eax
jmp draw_z_char_while$1_start
draw_z_char_while$1_end:
;while end
ret
draw_z_char$next:

;function
jmp draw_z_string$next
draw_z_string:
;param
jmp draw_z_string_left$next
draw_z_string_left: dd 0
draw_z_string_left$next:
;param
jmp draw_z_string_top$next
draw_z_string_top: dd 0
draw_z_string_top$next:
;param
jmp draw_z_string_strAddr$next
draw_z_string_strAddr: dd 0
draw_z_string_strAddr$next:
;param
jmp draw_z_string_screenWidth$next
draw_z_string_screenWidth: dd 0
draw_z_string_screenWidth$next:
;param
jmp draw_z_string_addrVram$next
draw_z_string_addrVram: dd 0
draw_z_string_addrVram$next:
pop ebp
pop eax
mov [draw_z_string_addrVram], eax
pop eax
mov [draw_z_string_screenWidth], eax
pop eax
mov [draw_z_string_strAddr], eax
pop eax
mov [draw_z_string_top], eax
pop eax
mov [draw_z_string_left], eax
push ebp
mov eax, 0
push eax
jmp draw_z_string_i$next
draw_z_string_i: dd 0
draw_z_string_i$next:
pop eax
mov [draw_z_string_i], eax
; while start
draw_z_string_while$1_start:
mov eax, [draw_z_string_i]
push eax
mov ebx, 4
pop eax
mul ebx
mov ebx, eax
mov eax, [draw_z_string_strAddr]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 0
push eax
pop ebx
pop eax
cmp eax, ebx
jne draw_z_string_while$1_unequal@true$7
mov eax, 0
jmp draw_z_string_while$1_unequal@false$7
draw_z_string_while$1_unequal@true$7:
mov eax, 1
draw_z_string_while$1_unequal@false$7:
push eax
pop eax
cmp eax, 0
je draw_z_string_while$1_end
mov eax, [draw_z_string_left]
push eax
mov eax, [draw_z_string_i]
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
mov eax, [draw_z_string_top]
push eax
mov eax, 1
push eax
mov eax, 2
push eax
mov eax, [draw_z_string_i]
push eax
mov ebx, 4
pop eax
mul ebx
mov ebx, eax
mov eax, [draw_z_string_strAddr]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, [draw_z_string_screenWidth]
push eax
mov eax, [draw_z_string_addrVram]
push eax
call draw_z_char
mov eax, [draw_z_string_i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_string_i], eax
jmp draw_z_string_while$1_start
draw_z_string_while$1_end:
;while end
ret
draw_z_string$next:
jmp font_z_A$next
font_z_A: dd \
0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_A$next:
jmp font_z_B$next
font_z_B: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
font_z_B$next:
jmp font_z_C$next
font_z_C: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
font_z_C$next:
jmp font_z_D$next
font_z_D: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
font_z_D$next:
jmp font_z_E$next
font_z_E: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
font_z_E$next:
jmp font_z_F$next
font_z_F: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_F$next:
jmp font_z_G$next
font_z_G: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,1,0,0,0,0,1,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
font_z_G$next:
jmp font_z_H$next
font_z_H: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_H$next:
jmp font_z_I$next
font_z_I: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
font_z_I$next:
jmp font_z_J$next
font_z_J: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,
font_z_J$next:
jmp font_z_K$next
font_z_K: dd \
0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,1,0,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,1,1,0,0,0,0,1,0,0,1,1,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
font_z_K$next:
jmp font_z_L$next
font_z_L: dd \
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
font_z_L$next:
jmp font_z_M$next
font_z_M: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_M$next:
jmp font_z_N$next
font_z_N: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,0,0,0,1,0,0,1,0,1,0,0,1,0,0,1,0,0,1,0,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_N$next:
jmp font_z_O$next
font_z_O: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
font_z_O$next:
jmp font_z_P$next
font_z_P: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_P$next:
jmp font_z_Q$next
font_z_Q: dd \
0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,1,0,1,0,0,0,1,0,0,1,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0,0,
font_z_Q$next:
jmp font_z_R$next
font_z_R: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_R$next:
jmp font_z_S$next
font_z_S: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,1,0,0,0,0,1,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
font_z_S$next:
jmp font_z_T$next
font_z_T: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_T$next:
jmp font_z_U$next
font_z_U: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,
font_z_U$next:
jmp font_z_V$next
font_z_V: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,
font_z_V$next:
jmp font_z_W$next
font_z_W: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_W$next:
jmp font_z_X$next
font_z_X: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
font_z_X$next:
jmp font_z_Y$next
font_z_Y: dd \
0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,1,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_Y$next:
jmp font_z_Z$next
font_z_Z: dd \
0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
font_z_Z$next:
jmp font_z_question$next
font_z_question: dd \
0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
font_z_question$next:
jmp font_z_space$next
font_z_space: dd \
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_space$next:
jmp font_z_add$next
font_z_add: dd \
0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,
font_z_add$next:
jmp font_z_sub$next
font_z_sub: dd \
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
font_z_sub$next:
jmp font_z_screen_buf$next
font_z_screen_buf: dd \
32,32,32,32,33,34,35,36,37,38,39,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,
font_z_screen_buf$next:

;function
jmp font_z_getAddrByAscii$next
font_z_getAddrByAscii:
;param
jmp font_z_getAddrByAscii_ascii$next
font_z_getAddrByAscii_ascii: dd 0
font_z_getAddrByAscii_ascii$next:
pop ebp
pop eax
mov [font_z_getAddrByAscii_ascii], eax
push ebp
; if start
font_z_getAddrByAscii_if$1_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 32
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$1_equal@true$1
mov eax, 0
jmp font_z_getAddrByAscii_if$1_equal@false$1
font_z_getAddrByAscii_if$1_equal@true$1:
mov eax, 1
font_z_getAddrByAscii_if$1_equal@false$1:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$1_else
font_z_getAddrByAscii_if$1_then:
mov eax, font_z_space
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$1_end
font_z_getAddrByAscii_if$1_else:
font_z_getAddrByAscii_if$1_end:
;if end
; if start
font_z_getAddrByAscii_if$2_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 65
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$2_equal@true$2
mov eax, 0
jmp font_z_getAddrByAscii_if$2_equal@false$2
font_z_getAddrByAscii_if$2_equal@true$2:
mov eax, 1
font_z_getAddrByAscii_if$2_equal@false$2:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$2_else
font_z_getAddrByAscii_if$2_then:
mov eax, font_z_A
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$2_end
font_z_getAddrByAscii_if$2_else:
font_z_getAddrByAscii_if$2_end:
;if end
; if start
font_z_getAddrByAscii_if$3_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 66
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$3_equal@true$3
mov eax, 0
jmp font_z_getAddrByAscii_if$3_equal@false$3
font_z_getAddrByAscii_if$3_equal@true$3:
mov eax, 1
font_z_getAddrByAscii_if$3_equal@false$3:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$3_else
font_z_getAddrByAscii_if$3_then:
mov eax, font_z_B
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$3_end
font_z_getAddrByAscii_if$3_else:
font_z_getAddrByAscii_if$3_end:
;if end
; if start
font_z_getAddrByAscii_if$4_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 67
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$4_equal@true$4
mov eax, 0
jmp font_z_getAddrByAscii_if$4_equal@false$4
font_z_getAddrByAscii_if$4_equal@true$4:
mov eax, 1
font_z_getAddrByAscii_if$4_equal@false$4:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$4_else
font_z_getAddrByAscii_if$4_then:
mov eax, font_z_C
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$4_end
font_z_getAddrByAscii_if$4_else:
font_z_getAddrByAscii_if$4_end:
;if end
; if start
font_z_getAddrByAscii_if$5_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 68
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$5_equal@true$5
mov eax, 0
jmp font_z_getAddrByAscii_if$5_equal@false$5
font_z_getAddrByAscii_if$5_equal@true$5:
mov eax, 1
font_z_getAddrByAscii_if$5_equal@false$5:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$5_else
font_z_getAddrByAscii_if$5_then:
mov eax, font_z_D
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$5_end
font_z_getAddrByAscii_if$5_else:
font_z_getAddrByAscii_if$5_end:
;if end
; if start
font_z_getAddrByAscii_if$6_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 69
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$6_equal@true$6
mov eax, 0
jmp font_z_getAddrByAscii_if$6_equal@false$6
font_z_getAddrByAscii_if$6_equal@true$6:
mov eax, 1
font_z_getAddrByAscii_if$6_equal@false$6:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$6_else
font_z_getAddrByAscii_if$6_then:
mov eax, font_z_E
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$6_end
font_z_getAddrByAscii_if$6_else:
font_z_getAddrByAscii_if$6_end:
;if end
; if start
font_z_getAddrByAscii_if$7_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 70
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$7_equal@true$7
mov eax, 0
jmp font_z_getAddrByAscii_if$7_equal@false$7
font_z_getAddrByAscii_if$7_equal@true$7:
mov eax, 1
font_z_getAddrByAscii_if$7_equal@false$7:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$7_else
font_z_getAddrByAscii_if$7_then:
mov eax, font_z_F
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$7_end
font_z_getAddrByAscii_if$7_else:
font_z_getAddrByAscii_if$7_end:
;if end
; if start
font_z_getAddrByAscii_if$8_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 71
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$8_equal@true$8
mov eax, 0
jmp font_z_getAddrByAscii_if$8_equal@false$8
font_z_getAddrByAscii_if$8_equal@true$8:
mov eax, 1
font_z_getAddrByAscii_if$8_equal@false$8:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$8_else
font_z_getAddrByAscii_if$8_then:
mov eax, font_z_G
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$8_end
font_z_getAddrByAscii_if$8_else:
font_z_getAddrByAscii_if$8_end:
;if end
; if start
font_z_getAddrByAscii_if$9_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 72
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$9_equal@true$9
mov eax, 0
jmp font_z_getAddrByAscii_if$9_equal@false$9
font_z_getAddrByAscii_if$9_equal@true$9:
mov eax, 1
font_z_getAddrByAscii_if$9_equal@false$9:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$9_else
font_z_getAddrByAscii_if$9_then:
mov eax, font_z_H
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$9_end
font_z_getAddrByAscii_if$9_else:
font_z_getAddrByAscii_if$9_end:
;if end
; if start
font_z_getAddrByAscii_if$10_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 73
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$10_equal@true$10
mov eax, 0
jmp font_z_getAddrByAscii_if$10_equal@false$10
font_z_getAddrByAscii_if$10_equal@true$10:
mov eax, 1
font_z_getAddrByAscii_if$10_equal@false$10:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$10_else
font_z_getAddrByAscii_if$10_then:
mov eax, font_z_I
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$10_end
font_z_getAddrByAscii_if$10_else:
font_z_getAddrByAscii_if$10_end:
;if end
; if start
font_z_getAddrByAscii_if$11_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 74
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$11_equal@true$11
mov eax, 0
jmp font_z_getAddrByAscii_if$11_equal@false$11
font_z_getAddrByAscii_if$11_equal@true$11:
mov eax, 1
font_z_getAddrByAscii_if$11_equal@false$11:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$11_else
font_z_getAddrByAscii_if$11_then:
mov eax, font_z_G
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$11_end
font_z_getAddrByAscii_if$11_else:
font_z_getAddrByAscii_if$11_end:
;if end
; if start
font_z_getAddrByAscii_if$12_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 75
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$12_equal@true$12
mov eax, 0
jmp font_z_getAddrByAscii_if$12_equal@false$12
font_z_getAddrByAscii_if$12_equal@true$12:
mov eax, 1
font_z_getAddrByAscii_if$12_equal@false$12:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$12_else
font_z_getAddrByAscii_if$12_then:
mov eax, font_z_K
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$12_end
font_z_getAddrByAscii_if$12_else:
font_z_getAddrByAscii_if$12_end:
;if end
; if start
font_z_getAddrByAscii_if$13_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 76
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$13_equal@true$13
mov eax, 0
jmp font_z_getAddrByAscii_if$13_equal@false$13
font_z_getAddrByAscii_if$13_equal@true$13:
mov eax, 1
font_z_getAddrByAscii_if$13_equal@false$13:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$13_else
font_z_getAddrByAscii_if$13_then:
mov eax, font_z_L
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$13_end
font_z_getAddrByAscii_if$13_else:
font_z_getAddrByAscii_if$13_end:
;if end
; if start
font_z_getAddrByAscii_if$14_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 77
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$14_equal@true$14
mov eax, 0
jmp font_z_getAddrByAscii_if$14_equal@false$14
font_z_getAddrByAscii_if$14_equal@true$14:
mov eax, 1
font_z_getAddrByAscii_if$14_equal@false$14:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$14_else
font_z_getAddrByAscii_if$14_then:
mov eax, font_z_M
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$14_end
font_z_getAddrByAscii_if$14_else:
font_z_getAddrByAscii_if$14_end:
;if end
; if start
font_z_getAddrByAscii_if$15_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 78
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$15_equal@true$15
mov eax, 0
jmp font_z_getAddrByAscii_if$15_equal@false$15
font_z_getAddrByAscii_if$15_equal@true$15:
mov eax, 1
font_z_getAddrByAscii_if$15_equal@false$15:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$15_else
font_z_getAddrByAscii_if$15_then:
mov eax, font_z_N
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$15_end
font_z_getAddrByAscii_if$15_else:
font_z_getAddrByAscii_if$15_end:
;if end
; if start
font_z_getAddrByAscii_if$16_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 79
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$16_equal@true$16
mov eax, 0
jmp font_z_getAddrByAscii_if$16_equal@false$16
font_z_getAddrByAscii_if$16_equal@true$16:
mov eax, 1
font_z_getAddrByAscii_if$16_equal@false$16:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$16_else
font_z_getAddrByAscii_if$16_then:
mov eax, font_z_O
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$16_end
font_z_getAddrByAscii_if$16_else:
font_z_getAddrByAscii_if$16_end:
;if end
; if start
font_z_getAddrByAscii_if$17_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 80
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$17_equal@true$17
mov eax, 0
jmp font_z_getAddrByAscii_if$17_equal@false$17
font_z_getAddrByAscii_if$17_equal@true$17:
mov eax, 1
font_z_getAddrByAscii_if$17_equal@false$17:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$17_else
font_z_getAddrByAscii_if$17_then:
mov eax, font_z_P
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$17_end
font_z_getAddrByAscii_if$17_else:
font_z_getAddrByAscii_if$17_end:
;if end
; if start
font_z_getAddrByAscii_if$18_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 81
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$18_equal@true$18
mov eax, 0
jmp font_z_getAddrByAscii_if$18_equal@false$18
font_z_getAddrByAscii_if$18_equal@true$18:
mov eax, 1
font_z_getAddrByAscii_if$18_equal@false$18:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$18_else
font_z_getAddrByAscii_if$18_then:
mov eax, font_z_Q
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$18_end
font_z_getAddrByAscii_if$18_else:
font_z_getAddrByAscii_if$18_end:
;if end
; if start
font_z_getAddrByAscii_if$19_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 82
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$19_equal@true$19
mov eax, 0
jmp font_z_getAddrByAscii_if$19_equal@false$19
font_z_getAddrByAscii_if$19_equal@true$19:
mov eax, 1
font_z_getAddrByAscii_if$19_equal@false$19:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$19_else
font_z_getAddrByAscii_if$19_then:
mov eax, font_z_R
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$19_end
font_z_getAddrByAscii_if$19_else:
font_z_getAddrByAscii_if$19_end:
;if end
; if start
font_z_getAddrByAscii_if$20_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 83
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$20_equal@true$20
mov eax, 0
jmp font_z_getAddrByAscii_if$20_equal@false$20
font_z_getAddrByAscii_if$20_equal@true$20:
mov eax, 1
font_z_getAddrByAscii_if$20_equal@false$20:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$20_else
font_z_getAddrByAscii_if$20_then:
mov eax, font_z_S
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$20_end
font_z_getAddrByAscii_if$20_else:
font_z_getAddrByAscii_if$20_end:
;if end
; if start
font_z_getAddrByAscii_if$21_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 84
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$21_equal@true$21
mov eax, 0
jmp font_z_getAddrByAscii_if$21_equal@false$21
font_z_getAddrByAscii_if$21_equal@true$21:
mov eax, 1
font_z_getAddrByAscii_if$21_equal@false$21:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$21_else
font_z_getAddrByAscii_if$21_then:
mov eax, font_z_T
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$21_end
font_z_getAddrByAscii_if$21_else:
font_z_getAddrByAscii_if$21_end:
;if end
; if start
font_z_getAddrByAscii_if$22_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 85
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$22_equal@true$22
mov eax, 0
jmp font_z_getAddrByAscii_if$22_equal@false$22
font_z_getAddrByAscii_if$22_equal@true$22:
mov eax, 1
font_z_getAddrByAscii_if$22_equal@false$22:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$22_else
font_z_getAddrByAscii_if$22_then:
mov eax, font_z_U
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$22_end
font_z_getAddrByAscii_if$22_else:
font_z_getAddrByAscii_if$22_end:
;if end
; if start
font_z_getAddrByAscii_if$23_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 86
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$23_equal@true$23
mov eax, 0
jmp font_z_getAddrByAscii_if$23_equal@false$23
font_z_getAddrByAscii_if$23_equal@true$23:
mov eax, 1
font_z_getAddrByAscii_if$23_equal@false$23:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$23_else
font_z_getAddrByAscii_if$23_then:
mov eax, font_z_V
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$23_end
font_z_getAddrByAscii_if$23_else:
font_z_getAddrByAscii_if$23_end:
;if end
; if start
font_z_getAddrByAscii_if$24_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 87
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$24_equal@true$24
mov eax, 0
jmp font_z_getAddrByAscii_if$24_equal@false$24
font_z_getAddrByAscii_if$24_equal@true$24:
mov eax, 1
font_z_getAddrByAscii_if$24_equal@false$24:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$24_else
font_z_getAddrByAscii_if$24_then:
mov eax, font_z_W
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$24_end
font_z_getAddrByAscii_if$24_else:
font_z_getAddrByAscii_if$24_end:
;if end
; if start
font_z_getAddrByAscii_if$25_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 88
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$25_equal@true$25
mov eax, 0
jmp font_z_getAddrByAscii_if$25_equal@false$25
font_z_getAddrByAscii_if$25_equal@true$25:
mov eax, 1
font_z_getAddrByAscii_if$25_equal@false$25:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$25_else
font_z_getAddrByAscii_if$25_then:
mov eax, font_z_X
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$25_end
font_z_getAddrByAscii_if$25_else:
font_z_getAddrByAscii_if$25_end:
;if end
; if start
font_z_getAddrByAscii_if$26_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 89
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$26_equal@true$26
mov eax, 0
jmp font_z_getAddrByAscii_if$26_equal@false$26
font_z_getAddrByAscii_if$26_equal@true$26:
mov eax, 1
font_z_getAddrByAscii_if$26_equal@false$26:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$26_else
font_z_getAddrByAscii_if$26_then:
mov eax, font_z_Y
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$26_end
font_z_getAddrByAscii_if$26_else:
font_z_getAddrByAscii_if$26_end:
;if end
; if start
font_z_getAddrByAscii_if$27_start:
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 90
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if$27_equal@true$27
mov eax, 0
jmp font_z_getAddrByAscii_if$27_equal@false$27
font_z_getAddrByAscii_if$27_equal@true$27:
mov eax, 1
font_z_getAddrByAscii_if$27_equal@false$27:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if$27_else
font_z_getAddrByAscii_if$27_then:
mov eax, font_z_Z
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if$27_end
font_z_getAddrByAscii_if$27_else:
font_z_getAddrByAscii_if$27_end:
;if end
ret
font_z_getAddrByAscii$next:

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
; while start
test_z_block_while$1_start:
mov eax, [test_z_block_i]
push eax
mov eax, 300
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
mov eax, [test_z_block_i]
push eax
mov eax, [test_z_block_i]
push eax
mov eax, [test_z_block_i]
push eax
mov eax, 320
push eax
mov eax, [test_z_block_addrVram]
push eax
call draw_z_pixel
mov eax, [test_z_block_i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z_block_i], eax
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
jmp test_z_draw_tstr$next
test_z_draw_tstr: dd \
72, 69, 76, 76, 79, 32, 87, 79, 82, 76, 68, 0
test_z_draw_tstr$next:
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

