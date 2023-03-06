[bits 32]
ORG 0x280000
mov eax, 320
push eax
jmp main_z_screenWidth$pass
main_z_screenWidth: dd 0
main_z_screenWidth$pass:
pop eax
mov [main_z_screenWidth], eax

mov eax, 200
push eax
jmp main_z_screenHeight$pass
main_z_screenHeight: dd 0
main_z_screenHeight$pass:
pop eax
mov [main_z_screenHeight], eax

mov eax, 0x000a0000
push eax
jmp main_z_addrVram$pass
main_z_addrVram: dd 0
main_z_addrVram$pass:
pop eax
mov [main_z_addrVram], eax

mov eax, 0x0024e000
push eax
jmp main_z_addrPM$pass
main_z_addrPM: dd 0
main_z_addrPM$pass:
pop eax
mov [main_z_addrPM], eax

mov eax, 0x0026e000
push eax
jmp main_z_addrPDT$pass
main_z_addrPDT: dd 0
main_z_addrPDT$pass:
pop eax
mov [main_z_addrPDT], eax

mov eax, 0x0026f800
push eax
jmp main_z_addrIDT$pass
main_z_addrIDT: dd 0
main_z_addrIDT$pass:
pop eax
mov [main_z_addrIDT], eax

mov eax, 0x00270000
push eax
jmp main_z_addrGDT$pass
main_z_addrGDT: dd 0
main_z_addrGDT$pass:
pop eax
mov [main_z_addrGDT], eax


;############[fun begin]run_once############
jmp main_z_run_once$pass
main_z_run_once:
pop ebp
push ebp
mov eax, [main_z_addrVram]
push eax
call test_z_draw

call GDT_z_init

call IDT_z_init

ret
main_z_run_once$pass:
;============[fun end]run_once=============


;############[fun begin]run_loop############
jmp main_z_run_loop$pass
main_z_run_loop:
pop ebp
push ebp
call kernel_z_halt

ret
main_z_run_loop$pass:
;============[fun end]run_loop=============



;############[fun begin]set_1byte############
jmp memory_z_set_1byte$pass
memory_z_set_1byte:
pop ebp
;param: addr
jmp memory_z_set_1byte_addr$pass
memory_z_set_1byte_addr: dd 0
memory_z_set_1byte_addr$pass:
pop eax
mov [memory_z_set_1byte_addr], eax
;param: val
jmp memory_z_set_1byte_val$pass
memory_z_set_1byte_val: dd 0
memory_z_set_1byte_val$pass:
pop eax
mov [memory_z_set_1byte_val], eax
push ebp
mov eax, [memory_z_set_1byte_val]
push eax
mov eax, [memory_z_set_1byte_addr]
push eax
call kernel_z_setMem_1byte

ret
memory_z_set_1byte$pass:
;============[fun end]set_1byte=============


;############[fun begin]set_2byte############
jmp memory_z_set_2byte$pass
memory_z_set_2byte:
pop ebp
;param: addr
jmp memory_z_set_2byte_addr$pass
memory_z_set_2byte_addr: dd 0
memory_z_set_2byte_addr$pass:
pop eax
mov [memory_z_set_2byte_addr], eax
;param: val
jmp memory_z_set_2byte_val$pass
memory_z_set_2byte_val: dd 0
memory_z_set_2byte_val$pass:
pop eax
mov [memory_z_set_2byte_val], eax
push ebp
mov eax, [memory_z_set_2byte_val]
push eax
mov eax, [memory_z_set_2byte_addr]
push eax
call kernel_z_setMem_2byte

ret
memory_z_set_2byte$pass:
;============[fun end]set_2byte=============


;############[fun begin]set_4byte############
jmp memory_z_set_4byte$pass
memory_z_set_4byte:
pop ebp
;param: addr
jmp memory_z_set_4byte_addr$pass
memory_z_set_4byte_addr: dd 0
memory_z_set_4byte_addr$pass:
pop eax
mov [memory_z_set_4byte_addr], eax
;param: val
jmp memory_z_set_4byte_val$pass
memory_z_set_4byte_val: dd 0
memory_z_set_4byte_val$pass:
pop eax
mov [memory_z_set_4byte_val], eax
push ebp
mov eax, [memory_z_set_4byte_val]
push eax
mov eax, [memory_z_set_4byte_addr]
push eax
call kernel_z_setMem_4byte

ret
memory_z_set_4byte$pass:
;============[fun end]set_4byte=============



;############[fun begin]pixel############
jmp draw_z_pixel$pass
draw_z_pixel:
pop ebp
;param: vramAddr
jmp draw_z_pixel_vramAddr$pass
draw_z_pixel_vramAddr: dd 0
draw_z_pixel_vramAddr$pass:
pop eax
mov [draw_z_pixel_vramAddr], eax
;param: screenWidth
jmp draw_z_pixel_screenWidth$pass
draw_z_pixel_screenWidth: dd 0
draw_z_pixel_screenWidth$pass:
pop eax
mov [draw_z_pixel_screenWidth], eax
;param: color
jmp draw_z_pixel_color$pass
draw_z_pixel_color: dd 0
draw_z_pixel_color$pass:
pop eax
mov [draw_z_pixel_color], eax
;param: y
jmp draw_z_pixel_y$pass
draw_z_pixel_y: dd 0
draw_z_pixel_y$pass:
pop eax
mov [draw_z_pixel_y], eax
;param: x
jmp draw_z_pixel_x$pass
draw_z_pixel_x: dd 0
draw_z_pixel_x$pass:
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
jmp draw_z_pixel_addr$pass
draw_z_pixel_addr: dd 0
draw_z_pixel_addr$pass:
pop eax
mov [draw_z_pixel_addr], eax

mov eax, [draw_z_pixel_color]
push eax
mov eax, [draw_z_pixel_addr]
push eax
call memory_z_set_1byte

ret
draw_z_pixel$pass:
;============[fun end]pixel=============


;############[fun begin]hLine############
jmp draw_z_hLine$pass
draw_z_hLine:
pop ebp
;param: vramAddr
jmp draw_z_hLine_vramAddr$pass
draw_z_hLine_vramAddr: dd 0
draw_z_hLine_vramAddr$pass:
pop eax
mov [draw_z_hLine_vramAddr], eax
;param: screenWidth
jmp draw_z_hLine_screenWidth$pass
draw_z_hLine_screenWidth: dd 0
draw_z_hLine_screenWidth$pass:
pop eax
mov [draw_z_hLine_screenWidth], eax
;param: color
jmp draw_z_hLine_color$pass
draw_z_hLine_color: dd 0
draw_z_hLine_color$pass:
pop eax
mov [draw_z_hLine_color], eax
;param: ey
jmp draw_z_hLine_ey$pass
draw_z_hLine_ey: dd 0
draw_z_hLine_ey$pass:
pop eax
mov [draw_z_hLine_ey], eax
;param: ex
jmp draw_z_hLine_ex$pass
draw_z_hLine_ex: dd 0
draw_z_hLine_ex$pass:
pop eax
mov [draw_z_hLine_ex], eax
;param: by
jmp draw_z_hLine_by$pass
draw_z_hLine_by: dd 0
draw_z_hLine_by$pass:
pop eax
mov [draw_z_hLine_by], eax
;param: bx
jmp draw_z_hLine_bx$pass
draw_z_hLine_bx: dd 0
draw_z_hLine_bx$pass:
pop eax
mov [draw_z_hLine_bx], eax
push ebp
mov eax, [draw_z_hLine_bx]
push eax
jmp draw_z_hLine_i$pass
draw_z_hLine_i: dd 0
draw_z_hLine_i$pass:
pop eax
mov [draw_z_hLine_i], eax

;########## draw_z_hLine_while#r1_$start ##########
draw_z_hLine_while#r1_$start:
mov eax, [draw_z_hLine_i]
push eax
mov eax, [draw_z_hLine_ex]
push eax
pop ebx
pop eax
cmp eax, ebx
jbe draw_z_hLine_while#r1_leq#r2$true
mov eax, 0
jmp draw_z_hLine_while#r1_leq#r2$false
draw_z_hLine_while#r1_leq#r2$true:
mov eax, 1
draw_z_hLine_while#r1_leq#r2$false:
push eax
pop eax
cmp eax, 0
je draw_z_hLine_while#r1_$end
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
jmp draw_z_hLine_while#r1_$start
draw_z_hLine_while#r1_$end:
;========== draw_z_hLine_while#r1_$end ==========

ret
draw_z_hLine$pass:
;============[fun end]hLine=============


;############[fun begin]font############
jmp draw_z_font$pass
draw_z_font:
pop ebp
;param: backColor
jmp draw_z_font_backColor$pass
draw_z_font_backColor: dd 0
draw_z_font_backColor$pass:
pop eax
mov [draw_z_font_backColor], eax
;param: foreColor
jmp draw_z_font_foreColor$pass
draw_z_font_foreColor: dd 0
draw_z_font_foreColor$pass:
pop eax
mov [draw_z_font_foreColor], eax
;param: top
jmp draw_z_font_top$pass
draw_z_font_top: dd 0
draw_z_font_top$pass:
pop eax
mov [draw_z_font_top], eax
;param: left
jmp draw_z_font_left$pass
draw_z_font_left: dd 0
draw_z_font_left$pass:
pop eax
mov [draw_z_font_left], eax
;param: charAddr
jmp draw_z_font_charAddr$pass
draw_z_font_charAddr: dd 0
draw_z_font_charAddr$pass:
pop eax
mov [draw_z_font_charAddr], eax
push ebp
ret
draw_z_font$pass:
;============[fun end]font=============


;############[fun begin]flush############
jmp draw_z_flush$pass
draw_z_flush:
pop ebp
;param: addrVram
jmp draw_z_flush_addrVram$pass
draw_z_flush_addrVram: dd 0
draw_z_flush_addrVram$pass:
pop eax
mov [draw_z_flush_addrVram], eax
push ebp
mov eax, 0
push eax
jmp draw_z_flush_left$pass
draw_z_flush_left: dd 0
draw_z_flush_left$pass:
pop eax
mov [draw_z_flush_left], eax

mov eax, 0
push eax
jmp draw_z_flush_top$pass
draw_z_flush_top: dd 0
draw_z_flush_top$pass:
pop eax
mov [draw_z_flush_top], eax

;########## draw_z_flush_while#r3_$start ##########
draw_z_flush_while#r3_$start:
mov eax, [draw_z_flush_top]
push eax
mov eax, 25
push eax
pop ebx
pop eax
cmp eax, ebx
jb draw_z_flush_while#r3_les#r4$true
mov eax, 0
jmp draw_z_flush_while#r3_les#r4$false
draw_z_flush_while#r3_les#r4$true:
mov eax, 1
draw_z_flush_while#r3_les#r4$false:
push eax
pop eax
cmp eax, 0
je draw_z_flush_while#r3_$end
mov eax, 0
push eax
pop eax
mov [draw_z_flush_left], eax
;########## draw_z_flush_while#r3_while#r5_$start ##########
draw_z_flush_while#r3_while#r5_$start:
mov eax, [draw_z_flush_left]
push eax
mov eax, 40
push eax
pop ebx
pop eax
cmp eax, ebx
jb draw_z_flush_while#r3_while#r5_les#r6$true
mov eax, 0
jmp draw_z_flush_while#r3_while#r5_les#r6$false
draw_z_flush_while#r3_while#r5_les#r6$true:
mov eax, 1
draw_z_flush_while#r3_while#r5_les#r6$false:
push eax
pop eax
cmp eax, 0
je draw_z_flush_while#r3_while#r5_$end
mov eax, 15
push eax
jmp draw_z_flush_while#r3_while#r5_color$pass
draw_z_flush_while#r3_while#r5_color: dd 0
draw_z_flush_while#r3_while#r5_color$pass:
pop eax
mov [draw_z_flush_while#r3_while#r5_color], eax

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
mov eax, [draw_z_flush_while#r3_while#r5_color]
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
jmp draw_z_flush_while#r3_while#r5_$start
draw_z_flush_while#r3_while#r5_$end:
;========== draw_z_flush_while#r3_while#r5_$end ==========

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
jmp draw_z_flush_while#r3_$start
draw_z_flush_while#r3_$end:
;========== draw_z_flush_while#r3_$end ==========

ret
draw_z_flush$pass:
;============[fun end]flush=============


;############[fun begin]char############
jmp draw_z_char$pass
draw_z_char:
pop ebp
;param: addrVram
jmp draw_z_char_addrVram$pass
draw_z_char_addrVram: dd 0
draw_z_char_addrVram$pass:
pop eax
mov [draw_z_char_addrVram], eax
;param: screenWidth
jmp draw_z_char_screenWidth$pass
draw_z_char_screenWidth: dd 0
draw_z_char_screenWidth$pass:
pop eax
mov [draw_z_char_screenWidth], eax
;param: ascii
jmp draw_z_char_ascii$pass
draw_z_char_ascii: dd 0
draw_z_char_ascii$pass:
pop eax
mov [draw_z_char_ascii], eax
;param: backColor
jmp draw_z_char_backColor$pass
draw_z_char_backColor: dd 0
draw_z_char_backColor$pass:
pop eax
mov [draw_z_char_backColor], eax
;param: foreColor
jmp draw_z_char_foreColor$pass
draw_z_char_foreColor: dd 0
draw_z_char_foreColor$pass:
pop eax
mov [draw_z_char_foreColor], eax
;param: top
jmp draw_z_char_top$pass
draw_z_char_top: dd 0
draw_z_char_top$pass:
pop eax
mov [draw_z_char_top], eax
;param: left
jmp draw_z_char_left$pass
draw_z_char_left: dd 0
draw_z_char_left$pass:
pop eax
mov [draw_z_char_left], eax
push ebp
mov eax, [draw_z_char_ascii]
push eax
call font_z_getAddrByAscii

jmp draw_z_char_fontAddr$pass
draw_z_char_fontAddr: dd 0
draw_z_char_fontAddr$pass:
pop eax
mov [draw_z_char_fontAddr], eax

mov eax, 0
push eax
jmp draw_z_char_y$pass
draw_z_char_y: dd 0
draw_z_char_y$pass:
pop eax
mov [draw_z_char_y], eax

;########## draw_z_char_while#r7_$start ##########
draw_z_char_while#r7_$start:
mov eax, [draw_z_char_y]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jb draw_z_char_while#r7_les#r8$true
mov eax, 0
jmp draw_z_char_while#r7_les#r8$false
draw_z_char_while#r7_les#r8$true:
mov eax, 1
draw_z_char_while#r7_les#r8$false:
push eax
pop eax
cmp eax, 0
je draw_z_char_while#r7_$end
mov eax, 0
push eax
jmp draw_z_char_while#r7_x$pass
draw_z_char_while#r7_x: dd 0
draw_z_char_while#r7_x$pass:
pop eax
mov [draw_z_char_while#r7_x], eax

;########## draw_z_char_while#r7_while#r9_$start ##########
draw_z_char_while#r7_while#r9_$start:
mov eax, [draw_z_char_while#r7_x]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jb draw_z_char_while#r7_while#r9_les#r01$true
mov eax, 0
jmp draw_z_char_while#r7_while#r9_les#r01$false
draw_z_char_while#r7_while#r9_les#r01$true:
mov eax, 1
draw_z_char_while#r7_while#r9_les#r01$false:
push eax
pop eax
cmp eax, 0
je draw_z_char_while#r7_while#r9_$end
mov eax, [draw_z_char_foreColor]
push eax
jmp draw_z_char_while#r7_while#r9_color$pass
draw_z_char_while#r7_while#r9_color: dd 0
draw_z_char_while#r7_while#r9_color$pass:
pop eax
mov [draw_z_char_while#r7_while#r9_color], eax

mov eax, [draw_z_char_fontAddr]
push eax
mov eax, [draw_z_char_y]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, 4
push eax
pop eax
pop ebx
mul ebx
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [draw_z_char_while#r7_x]
push eax
mov eax, 4
push eax
pop eax
pop ebx
mul ebx
push eax
pop eax
pop ebx
add eax, ebx
push eax
jmp draw_z_char_while#r7_while#r9_fontByteAddr$pass
draw_z_char_while#r7_while#r9_fontByteAddr: dd 0
draw_z_char_while#r7_while#r9_fontByteAddr$pass:
pop eax
mov [draw_z_char_while#r7_while#r9_fontByteAddr], eax

mov eax, [draw_z_char_while#r7_while#r9_fontByteAddr]
mov ebx, [eax]
push ebx
jmp draw_z_char_while#r7_while#r9_fontByte$pass
draw_z_char_while#r7_while#r9_fontByte: dd 0
draw_z_char_while#r7_while#r9_fontByte$pass:
pop eax
mov [draw_z_char_while#r7_while#r9_fontByte], eax

;########## draw_z_char_while#r7_while#r9_if#r11_$start ##########
mov eax, [draw_z_char_while#r7_while#r9_fontByte]
push eax
mov eax, 0
push eax
pop ebx
pop eax
cmp eax, ebx
jne draw_z_char_while#r7_while#r9_if#r11_neq#r21$true
mov eax, 0
jmp draw_z_char_while#r7_while#r9_if#r11_neq#r21$false
draw_z_char_while#r7_while#r9_if#r11_neq#r21$true:
mov eax, 1
draw_z_char_while#r7_while#r9_if#r11_neq#r21$false:
push eax
pop eax
cmp eax, 0
je draw_z_char_while#r7_while#r9_if#r11_$else
mov eax, 15
push eax
pop eax
mov [draw_z_char_while#r7_while#r9_color], eax
jmp draw_z_char_while#r7_while#r9_if#r11_$end
draw_z_char_while#r7_while#r9_if#r11_$else:
mov eax, 0
push eax
pop eax
mov [draw_z_char_while#r7_while#r9_color], eax
draw_z_char_while#r7_while#r9_if#r11_$end:
;========== draw_z_char_while#r7_while#r9_if#r11_$end ==========

mov eax, [draw_z_char_left]
push eax
mov eax, [draw_z_char_while#r7_x]
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
mov eax, [draw_z_char_while#r7_while#r9_color]
push eax
mov eax, 320
push eax
mov eax, [draw_z_char_addrVram]
push eax
call draw_z_pixel

mov eax, [draw_z_char_while#r7_x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_char_while#r7_x], eax
jmp draw_z_char_while#r7_while#r9_$start
draw_z_char_while#r7_while#r9_$end:
;========== draw_z_char_while#r7_while#r9_$end ==========

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
jmp draw_z_char_while#r7_$start
draw_z_char_while#r7_$end:
;========== draw_z_char_while#r7_$end ==========

ret
draw_z_char$pass:
;============[fun end]char=============


;############[fun begin]string############
jmp draw_z_string$pass
draw_z_string:
pop ebp
;param: addrVram
jmp draw_z_string_addrVram$pass
draw_z_string_addrVram: dd 0
draw_z_string_addrVram$pass:
pop eax
mov [draw_z_string_addrVram], eax
;param: screenWidth
jmp draw_z_string_screenWidth$pass
draw_z_string_screenWidth: dd 0
draw_z_string_screenWidth$pass:
pop eax
mov [draw_z_string_screenWidth], eax
;param: strAddr
jmp draw_z_string_strAddr$pass
draw_z_string_strAddr: dd 0
draw_z_string_strAddr$pass:
pop eax
mov [draw_z_string_strAddr], eax
;param: top
jmp draw_z_string_top$pass
draw_z_string_top: dd 0
draw_z_string_top$pass:
pop eax
mov [draw_z_string_top], eax
;param: left
jmp draw_z_string_left$pass
draw_z_string_left: dd 0
draw_z_string_left$pass:
pop eax
mov [draw_z_string_left], eax
push ebp
mov eax, 0
push eax
jmp draw_z_string_i$pass
draw_z_string_i: dd 0
draw_z_string_i$pass:
pop eax
mov [draw_z_string_i], eax

mov eax, [draw_z_string_strAddr]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_string_strAddr], eax
mov eax, [draw_z_string_strAddr]
push eax
jmp draw_z_string_charAddr$pass
draw_z_string_charAddr: dd 0
draw_z_string_charAddr$pass:
pop eax
mov [draw_z_string_charAddr], eax

mov eax, [draw_z_string_charAddr]
mov ebx, [eax]
push ebx
jmp draw_z_string_t_char$pass
draw_z_string_t_char: dd 0
draw_z_string_t_char$pass:
pop eax
mov [draw_z_string_t_char], eax

mov eax, [draw_z_string_t_char]
push eax
mov eax, 24
push eax
pop ecx
pop eax
shr eax, cl
push eax
pop eax
mov [draw_z_string_t_char], eax
;########## draw_z_string_while#r31_$start ##########
draw_z_string_while#r31_$start:
mov eax, [draw_z_string_t_char]
push eax
mov eax, 0
push eax
pop ebx
pop eax
cmp eax, ebx
jne draw_z_string_while#r31_neq#r41$true
mov eax, 0
jmp draw_z_string_while#r31_neq#r41$false
draw_z_string_while#r31_neq#r41$true:
mov eax, 1
draw_z_string_while#r31_neq#r41$false:
push eax
pop eax
cmp eax, 0
je draw_z_string_while#r31_$end
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
mov eax, 7
push eax
mov eax, 8
push eax
mov eax, [draw_z_string_t_char]
push eax
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
mov eax, [draw_z_string_strAddr]
push eax
mov eax, [draw_z_string_i]
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z_string_charAddr], eax
mov eax, [draw_z_string_charAddr]
mov ebx, [eax]
push ebx
pop eax
mov [draw_z_string_t_char], eax
mov eax, [draw_z_string_t_char]
shr eax, 24
push eax
pop eax
mov [draw_z_string_t_char], eax
jmp draw_z_string_while#r31_$start
draw_z_string_while#r31_$end:
;========== draw_z_string_while#r31_$end ==========

ret
draw_z_string$pass:
;============[fun end]string=============


jmp font_z_A$pass
font_z_A: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_A$pass:
mov eax, font_z_A
mov eax, [font_z_A+4]

jmp font_z_B$pass
font_z_B: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_B$pass:
mov eax, font_z_B
mov eax, [font_z_B+4]

jmp font_z_C$pass
font_z_C: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_C$pass:
mov eax, font_z_C
mov eax, [font_z_C+4]

jmp font_z_D$pass
font_z_D: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_D$pass:
mov eax, font_z_D
mov eax, [font_z_D+4]

jmp font_z_E$pass
font_z_E: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_E$pass:
mov eax, font_z_E
mov eax, [font_z_E+4]

jmp font_z_F$pass
font_z_F: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_F$pass:
mov eax, font_z_F
mov eax, [font_z_F+4]

jmp font_z_G$pass
font_z_G: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_G$pass:
mov eax, font_z_G
mov eax, [font_z_G+4]

jmp font_z_H$pass
font_z_H: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_H$pass:
mov eax, font_z_H
mov eax, [font_z_H+4]

jmp font_z_I$pass
font_z_I: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_I$pass:
mov eax, font_z_I
mov eax, [font_z_I+4]

jmp font_z_J$pass
font_z_J: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_J$pass:
mov eax, font_z_J
mov eax, [font_z_J+4]

jmp font_z_K$pass
font_z_K: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_K$pass:
mov eax, font_z_K
mov eax, [font_z_K+4]

jmp font_z_L$pass
font_z_L: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_L$pass:
mov eax, font_z_L
mov eax, [font_z_L+4]

jmp font_z_M$pass
font_z_M: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_M$pass:
mov eax, font_z_M
mov eax, [font_z_M+4]

jmp font_z_N$pass
font_z_N: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_N$pass:
mov eax, font_z_N
mov eax, [font_z_N+4]

jmp font_z_O$pass
font_z_O: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_O$pass:
mov eax, font_z_O
mov eax, [font_z_O+4]

jmp font_z_P$pass
font_z_P: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_P$pass:
mov eax, font_z_P
mov eax, [font_z_P+4]

jmp font_z_Q$pass
font_z_Q: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_Q$pass:
mov eax, font_z_Q
mov eax, [font_z_Q+4]

jmp font_z_R$pass
font_z_R: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_R$pass:
mov eax, font_z_R
mov eax, [font_z_R+4]

jmp font_z_S$pass
font_z_S: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_S$pass:
mov eax, font_z_S
mov eax, [font_z_S+4]

jmp font_z_T$pass
font_z_T: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_T$pass:
mov eax, font_z_T
mov eax, [font_z_T+4]

jmp font_z_U$pass
font_z_U: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_U$pass:
mov eax, font_z_U
mov eax, [font_z_U+4]

jmp font_z_V$pass
font_z_V: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_V$pass:
mov eax, font_z_V
mov eax, [font_z_V+4]

jmp font_z_W$pass
font_z_W: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_W$pass:
mov eax, font_z_W
mov eax, [font_z_W+4]

jmp font_z_X$pass
font_z_X: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_X$pass:
mov eax, font_z_X
mov eax, [font_z_X+4]

jmp font_z_Y$pass
font_z_Y: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_Y$pass:
mov eax, font_z_Y
mov eax, [font_z_Y+4]

jmp font_z_Z$pass
font_z_Z: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_Z$pass:
mov eax, font_z_Z
mov eax, [font_z_Z+4]

jmp font_z_question$pass
font_z_question: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
font_z_question$pass:
mov eax, font_z_question
mov eax, [font_z_question+4]

jmp font_z_space$pass
font_z_space: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_space$pass:
mov eax, font_z_space
mov eax, [font_z_space+4]

jmp font_z_add$pass
font_z_add: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_add$pass:
mov eax, font_z_add
mov eax, [font_z_add+4]

jmp font_z_sub$pass
font_z_sub: dd 0 \
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z_sub$pass:
mov eax, font_z_sub
mov eax, [font_z_sub+4]

jmp font_z_screen_buf$pass
font_z_screen_buf: dd 0 \
32, 32, 32, 32, 33, 34, 35, 36, 37, 38, 39, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 
font_z_screen_buf$pass:
mov eax, font_z_screen_buf
mov eax, [font_z_screen_buf+4]


;############[fun begin]getAddrByAscii############
jmp font_z_getAddrByAscii$pass
font_z_getAddrByAscii:
pop ebp
;param: ascii
jmp font_z_getAddrByAscii_ascii$pass
font_z_getAddrByAscii_ascii: dd 0
font_z_getAddrByAscii_ascii$pass:
pop eax
mov [font_z_getAddrByAscii_ascii], eax
push ebp
;########## font_z_getAddrByAscii_if#r1_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 32
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r1_equ#r2$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r1_equ#r2$false
font_z_getAddrByAscii_if#r1_equ#r2$true:
mov eax, 1
font_z_getAddrByAscii_if#r1_equ#r2$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r1_$else
mov eax, font_z_space
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r1_$end
font_z_getAddrByAscii_if#r1_$else:
font_z_getAddrByAscii_if#r1_$end:
;========== font_z_getAddrByAscii_if#r1_$end ==========

;########## font_z_getAddrByAscii_if#r3_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 65
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r3_equ#r4$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r3_equ#r4$false
font_z_getAddrByAscii_if#r3_equ#r4$true:
mov eax, 1
font_z_getAddrByAscii_if#r3_equ#r4$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r3_$else
mov eax, font_z_A
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r3_$end
font_z_getAddrByAscii_if#r3_$else:
font_z_getAddrByAscii_if#r3_$end:
;========== font_z_getAddrByAscii_if#r3_$end ==========

;########## font_z_getAddrByAscii_if#r5_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 66
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r5_equ#r6$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r5_equ#r6$false
font_z_getAddrByAscii_if#r5_equ#r6$true:
mov eax, 1
font_z_getAddrByAscii_if#r5_equ#r6$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r5_$else
mov eax, font_z_B
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r5_$end
font_z_getAddrByAscii_if#r5_$else:
font_z_getAddrByAscii_if#r5_$end:
;========== font_z_getAddrByAscii_if#r5_$end ==========

;########## font_z_getAddrByAscii_if#r7_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 67
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r7_equ#r8$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r7_equ#r8$false
font_z_getAddrByAscii_if#r7_equ#r8$true:
mov eax, 1
font_z_getAddrByAscii_if#r7_equ#r8$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r7_$else
mov eax, font_z_C
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r7_$end
font_z_getAddrByAscii_if#r7_$else:
font_z_getAddrByAscii_if#r7_$end:
;========== font_z_getAddrByAscii_if#r7_$end ==========

;########## font_z_getAddrByAscii_if#r9_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 68
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r9_equ#r01$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r9_equ#r01$false
font_z_getAddrByAscii_if#r9_equ#r01$true:
mov eax, 1
font_z_getAddrByAscii_if#r9_equ#r01$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r9_$else
mov eax, font_z_D
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r9_$end
font_z_getAddrByAscii_if#r9_$else:
font_z_getAddrByAscii_if#r9_$end:
;========== font_z_getAddrByAscii_if#r9_$end ==========

;########## font_z_getAddrByAscii_if#r11_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 69
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r11_equ#r21$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r11_equ#r21$false
font_z_getAddrByAscii_if#r11_equ#r21$true:
mov eax, 1
font_z_getAddrByAscii_if#r11_equ#r21$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r11_$else
mov eax, font_z_E
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r11_$end
font_z_getAddrByAscii_if#r11_$else:
font_z_getAddrByAscii_if#r11_$end:
;========== font_z_getAddrByAscii_if#r11_$end ==========

;########## font_z_getAddrByAscii_if#r31_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 70
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r31_equ#r41$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r31_equ#r41$false
font_z_getAddrByAscii_if#r31_equ#r41$true:
mov eax, 1
font_z_getAddrByAscii_if#r31_equ#r41$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r31_$else
mov eax, font_z_F
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r31_$end
font_z_getAddrByAscii_if#r31_$else:
font_z_getAddrByAscii_if#r31_$end:
;========== font_z_getAddrByAscii_if#r31_$end ==========

;########## font_z_getAddrByAscii_if#r51_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 71
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r51_equ#r61$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r51_equ#r61$false
font_z_getAddrByAscii_if#r51_equ#r61$true:
mov eax, 1
font_z_getAddrByAscii_if#r51_equ#r61$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r51_$else
mov eax, font_z_G
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r51_$end
font_z_getAddrByAscii_if#r51_$else:
font_z_getAddrByAscii_if#r51_$end:
;========== font_z_getAddrByAscii_if#r51_$end ==========

;########## font_z_getAddrByAscii_if#r71_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 72
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r71_equ#r81$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r71_equ#r81$false
font_z_getAddrByAscii_if#r71_equ#r81$true:
mov eax, 1
font_z_getAddrByAscii_if#r71_equ#r81$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r71_$else
mov eax, font_z_H
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r71_$end
font_z_getAddrByAscii_if#r71_$else:
font_z_getAddrByAscii_if#r71_$end:
;========== font_z_getAddrByAscii_if#r71_$end ==========

;########## font_z_getAddrByAscii_if#r91_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 73
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r91_equ#r02$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r91_equ#r02$false
font_z_getAddrByAscii_if#r91_equ#r02$true:
mov eax, 1
font_z_getAddrByAscii_if#r91_equ#r02$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r91_$else
mov eax, font_z_I
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r91_$end
font_z_getAddrByAscii_if#r91_$else:
font_z_getAddrByAscii_if#r91_$end:
;========== font_z_getAddrByAscii_if#r91_$end ==========

;########## font_z_getAddrByAscii_if#r12_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 74
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r12_equ#r22$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r12_equ#r22$false
font_z_getAddrByAscii_if#r12_equ#r22$true:
mov eax, 1
font_z_getAddrByAscii_if#r12_equ#r22$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r12_$else
mov eax, font_z_G
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r12_$end
font_z_getAddrByAscii_if#r12_$else:
font_z_getAddrByAscii_if#r12_$end:
;========== font_z_getAddrByAscii_if#r12_$end ==========

;########## font_z_getAddrByAscii_if#r32_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 75
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r32_equ#r42$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r32_equ#r42$false
font_z_getAddrByAscii_if#r32_equ#r42$true:
mov eax, 1
font_z_getAddrByAscii_if#r32_equ#r42$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r32_$else
mov eax, font_z_K
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r32_$end
font_z_getAddrByAscii_if#r32_$else:
font_z_getAddrByAscii_if#r32_$end:
;========== font_z_getAddrByAscii_if#r32_$end ==========

;########## font_z_getAddrByAscii_if#r52_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 76
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r52_equ#r62$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r52_equ#r62$false
font_z_getAddrByAscii_if#r52_equ#r62$true:
mov eax, 1
font_z_getAddrByAscii_if#r52_equ#r62$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r52_$else
mov eax, font_z_L
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r52_$end
font_z_getAddrByAscii_if#r52_$else:
font_z_getAddrByAscii_if#r52_$end:
;========== font_z_getAddrByAscii_if#r52_$end ==========

;########## font_z_getAddrByAscii_if#r72_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 77
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r72_equ#r82$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r72_equ#r82$false
font_z_getAddrByAscii_if#r72_equ#r82$true:
mov eax, 1
font_z_getAddrByAscii_if#r72_equ#r82$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r72_$else
mov eax, font_z_M
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r72_$end
font_z_getAddrByAscii_if#r72_$else:
font_z_getAddrByAscii_if#r72_$end:
;========== font_z_getAddrByAscii_if#r72_$end ==========

;########## font_z_getAddrByAscii_if#r92_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 78
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r92_equ#r03$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r92_equ#r03$false
font_z_getAddrByAscii_if#r92_equ#r03$true:
mov eax, 1
font_z_getAddrByAscii_if#r92_equ#r03$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r92_$else
mov eax, font_z_N
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r92_$end
font_z_getAddrByAscii_if#r92_$else:
font_z_getAddrByAscii_if#r92_$end:
;========== font_z_getAddrByAscii_if#r92_$end ==========

;########## font_z_getAddrByAscii_if#r13_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 79
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r13_equ#r23$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r13_equ#r23$false
font_z_getAddrByAscii_if#r13_equ#r23$true:
mov eax, 1
font_z_getAddrByAscii_if#r13_equ#r23$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r13_$else
mov eax, font_z_O
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r13_$end
font_z_getAddrByAscii_if#r13_$else:
font_z_getAddrByAscii_if#r13_$end:
;========== font_z_getAddrByAscii_if#r13_$end ==========

;########## font_z_getAddrByAscii_if#r33_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 80
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r33_equ#r43$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r33_equ#r43$false
font_z_getAddrByAscii_if#r33_equ#r43$true:
mov eax, 1
font_z_getAddrByAscii_if#r33_equ#r43$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r33_$else
mov eax, font_z_P
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r33_$end
font_z_getAddrByAscii_if#r33_$else:
font_z_getAddrByAscii_if#r33_$end:
;========== font_z_getAddrByAscii_if#r33_$end ==========

;########## font_z_getAddrByAscii_if#r53_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 81
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r53_equ#r63$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r53_equ#r63$false
font_z_getAddrByAscii_if#r53_equ#r63$true:
mov eax, 1
font_z_getAddrByAscii_if#r53_equ#r63$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r53_$else
mov eax, font_z_Q
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r53_$end
font_z_getAddrByAscii_if#r53_$else:
font_z_getAddrByAscii_if#r53_$end:
;========== font_z_getAddrByAscii_if#r53_$end ==========

;########## font_z_getAddrByAscii_if#r73_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 82
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r73_equ#r83$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r73_equ#r83$false
font_z_getAddrByAscii_if#r73_equ#r83$true:
mov eax, 1
font_z_getAddrByAscii_if#r73_equ#r83$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r73_$else
mov eax, font_z_R
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r73_$end
font_z_getAddrByAscii_if#r73_$else:
font_z_getAddrByAscii_if#r73_$end:
;========== font_z_getAddrByAscii_if#r73_$end ==========

;########## font_z_getAddrByAscii_if#r93_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 83
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r93_equ#r04$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r93_equ#r04$false
font_z_getAddrByAscii_if#r93_equ#r04$true:
mov eax, 1
font_z_getAddrByAscii_if#r93_equ#r04$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r93_$else
mov eax, font_z_S
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r93_$end
font_z_getAddrByAscii_if#r93_$else:
font_z_getAddrByAscii_if#r93_$end:
;========== font_z_getAddrByAscii_if#r93_$end ==========

;########## font_z_getAddrByAscii_if#r14_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 84
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r14_equ#r24$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r14_equ#r24$false
font_z_getAddrByAscii_if#r14_equ#r24$true:
mov eax, 1
font_z_getAddrByAscii_if#r14_equ#r24$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r14_$else
mov eax, font_z_T
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r14_$end
font_z_getAddrByAscii_if#r14_$else:
font_z_getAddrByAscii_if#r14_$end:
;========== font_z_getAddrByAscii_if#r14_$end ==========

;########## font_z_getAddrByAscii_if#r34_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 85
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r34_equ#r44$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r34_equ#r44$false
font_z_getAddrByAscii_if#r34_equ#r44$true:
mov eax, 1
font_z_getAddrByAscii_if#r34_equ#r44$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r34_$else
mov eax, font_z_U
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r34_$end
font_z_getAddrByAscii_if#r34_$else:
font_z_getAddrByAscii_if#r34_$end:
;========== font_z_getAddrByAscii_if#r34_$end ==========

;########## font_z_getAddrByAscii_if#r54_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 86
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r54_equ#r64$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r54_equ#r64$false
font_z_getAddrByAscii_if#r54_equ#r64$true:
mov eax, 1
font_z_getAddrByAscii_if#r54_equ#r64$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r54_$else
mov eax, font_z_V
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r54_$end
font_z_getAddrByAscii_if#r54_$else:
font_z_getAddrByAscii_if#r54_$end:
;========== font_z_getAddrByAscii_if#r54_$end ==========

;########## font_z_getAddrByAscii_if#r74_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 87
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r74_equ#r84$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r74_equ#r84$false
font_z_getAddrByAscii_if#r74_equ#r84$true:
mov eax, 1
font_z_getAddrByAscii_if#r74_equ#r84$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r74_$else
mov eax, font_z_W
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r74_$end
font_z_getAddrByAscii_if#r74_$else:
font_z_getAddrByAscii_if#r74_$end:
;========== font_z_getAddrByAscii_if#r74_$end ==========

;########## font_z_getAddrByAscii_if#r94_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 88
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r94_equ#r05$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r94_equ#r05$false
font_z_getAddrByAscii_if#r94_equ#r05$true:
mov eax, 1
font_z_getAddrByAscii_if#r94_equ#r05$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r94_$else
mov eax, font_z_X
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r94_$end
font_z_getAddrByAscii_if#r94_$else:
font_z_getAddrByAscii_if#r94_$end:
;========== font_z_getAddrByAscii_if#r94_$end ==========

;########## font_z_getAddrByAscii_if#r15_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 89
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r15_equ#r25$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r15_equ#r25$false
font_z_getAddrByAscii_if#r15_equ#r25$true:
mov eax, 1
font_z_getAddrByAscii_if#r15_equ#r25$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r15_$else
mov eax, font_z_Y
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r15_$end
font_z_getAddrByAscii_if#r15_$else:
font_z_getAddrByAscii_if#r15_$end:
;========== font_z_getAddrByAscii_if#r15_$end ==========

;########## font_z_getAddrByAscii_if#r35_$start ##########
mov eax, [font_z_getAddrByAscii_ascii]
push eax
mov eax, 90
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z_getAddrByAscii_if#r35_equ#r45$true
mov eax, 0
jmp font_z_getAddrByAscii_if#r35_equ#r45$false
font_z_getAddrByAscii_if#r35_equ#r45$true:
mov eax, 1
font_z_getAddrByAscii_if#r35_equ#r45$false:
push eax
pop eax
cmp eax, 0
je font_z_getAddrByAscii_if#r35_$else
mov eax, font_z_Z
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z_getAddrByAscii_if#r35_$end
font_z_getAddrByAscii_if#r35_$else:
font_z_getAddrByAscii_if#r35_$end:
;========== font_z_getAddrByAscii_if#r35_$end ==========

ret
font_z_getAddrByAscii$pass:
;============[fun end]getAddrByAscii=============



;############[fun begin]rect############
jmp test_z_rect$pass
test_z_rect:
pop ebp
;param: addrVram
jmp test_z_rect_addrVram$pass
test_z_rect_addrVram: dd 0
test_z_rect_addrVram$pass:
pop eax
mov [test_z_rect_addrVram], eax
;param: color
jmp test_z_rect_color$pass
test_z_rect_color: dd 0
test_z_rect_color$pass:
pop eax
mov [test_z_rect_color], eax
;param: height
jmp test_z_rect_height$pass
test_z_rect_height: dd 0
test_z_rect_height$pass:
pop eax
mov [test_z_rect_height], eax
;param: width
jmp test_z_rect_width$pass
test_z_rect_width: dd 0
test_z_rect_width$pass:
pop eax
mov [test_z_rect_width], eax
;param: top
jmp test_z_rect_top$pass
test_z_rect_top: dd 0
test_z_rect_top$pass:
pop eax
mov [test_z_rect_top], eax
;param: left
jmp test_z_rect_left$pass
test_z_rect_left: dd 0
test_z_rect_left$pass:
pop eax
mov [test_z_rect_left], eax
push ebp
mov eax, 0
push eax
jmp test_z_rect_y$pass
test_z_rect_y: dd 0
test_z_rect_y$pass:
pop eax
mov [test_z_rect_y], eax

;########## test_z_rect_while#r1_$start ##########
test_z_rect_while#r1_$start:
mov eax, [test_z_rect_y]
push eax
mov eax, [test_z_rect_height]
push eax
pop ebx
pop eax
cmp eax, ebx
jbe test_z_rect_while#r1_leq#r2$true
mov eax, 0
jmp test_z_rect_while#r1_leq#r2$false
test_z_rect_while#r1_leq#r2$true:
mov eax, 1
test_z_rect_while#r1_leq#r2$false:
push eax
pop eax
cmp eax, 0
je test_z_rect_while#r1_$end
mov eax, 0
push eax
jmp test_z_rect_while#r1_x$pass
test_z_rect_while#r1_x: dd 0
test_z_rect_while#r1_x$pass:
pop eax
mov [test_z_rect_while#r1_x], eax

;########## test_z_rect_while#r1_while#r3_$start ##########
test_z_rect_while#r1_while#r3_$start:
mov eax, [test_z_rect_while#r1_x]
push eax
mov eax, [test_z_rect_width]
push eax
pop ebx
pop eax
cmp eax, ebx
jbe test_z_rect_while#r1_while#r3_leq#r4$true
mov eax, 0
jmp test_z_rect_while#r1_while#r3_leq#r4$false
test_z_rect_while#r1_while#r3_leq#r4$true:
mov eax, 1
test_z_rect_while#r1_while#r3_leq#r4$false:
push eax
pop eax
cmp eax, 0
je test_z_rect_while#r1_while#r3_$end
mov eax, [test_z_rect_color]
push eax
jmp test_z_rect_while#r1_while#r3_color$pass
test_z_rect_while#r1_while#r3_color: dd 0
test_z_rect_while#r1_while#r3_color$pass:
pop eax
mov [test_z_rect_while#r1_while#r3_color], eax

mov eax, [test_z_rect_left]
push eax
mov eax, [test_z_rect_while#r1_x]
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
mov eax, [test_z_rect_while#r1_while#r3_color]
push eax
mov eax, 320
push eax
mov eax, [test_z_rect_addrVram]
push eax
call draw_z_pixel

mov eax, [test_z_rect_while#r1_x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z_rect_while#r1_x], eax
jmp test_z_rect_while#r1_while#r3_$start
test_z_rect_while#r1_while#r3_$end:
;========== test_z_rect_while#r1_while#r3_$end ==========

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
jmp test_z_rect_while#r1_$start
test_z_rect_while#r1_$end:
;========== test_z_rect_while#r1_$end ==========

ret
test_z_rect$pass:
;============[fun end]rect=============


;############[fun begin]blocks############
jmp test_z_blocks$pass
test_z_blocks:
pop ebp
;param: addrVram
jmp test_z_blocks_addrVram$pass
test_z_blocks_addrVram: dd 0
test_z_blocks_addrVram$pass:
pop eax
mov [test_z_blocks_addrVram], eax
push ebp
mov eax, 0
push eax
mov eax, 175
push eax
mov eax, 320
push eax
mov eax, 24
push eax
mov eax, 7
push eax
mov eax, [test_z_blocks_addrVram]
push eax
call test_z_rect

mov eax, 5
push eax
mov eax, 180
push eax
mov eax, 24
push eax
mov eax, 12
push eax
mov eax, 3
push eax
mov eax, [test_z_blocks_addrVram]
push eax
call test_z_rect

ret
test_z_blocks$pass:
;============[fun end]blocks=============


;############[fun begin]draw############
jmp test_z_draw$pass
test_z_draw:
pop ebp
;param: addrVram
jmp test_z_draw_addrVram$pass
test_z_draw_addrVram: dd 0
test_z_draw_addrVram$pass:
pop eax
mov [test_z_draw_addrVram], eax
push ebp
mov eax, [test_z_draw_addrVram]
push eax
call test_z_blocks

jmp test_z_draw_tstr$pass
test_z_draw_tstr: dd 0, "HELLO ZOS", 0
test_z_draw_tstr$pass:
mov eax, 110
push eax
mov eax, 75
push eax
mov eax, test_z_draw_tstr
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_string

ret
test_z_draw$pass:
;============[fun end]draw=============



;############[fun begin]init############
jmp GDT_z_init$pass
GDT_z_init:
pop ebp
push ebp
mov eax, 0
push eax
jmp GDT_z_init_i$pass
GDT_z_init_i: dd 0
GDT_z_init_i$pass:
pop eax
mov [GDT_z_init_i], eax

;########## GDT_z_init_while#r1_$start ##########
GDT_z_init_while#r1_$start:
mov eax, [GDT_z_init_i]
push eax
mov eax, 8192
push eax
pop ebx
pop eax
cmp eax, ebx
jb GDT_z_init_while#r1_les#r2$true
mov eax, 0
jmp GDT_z_init_while#r1_les#r2$false
GDT_z_init_while#r1_les#r2$true:
mov eax, 1
GDT_z_init_while#r1_les#r2$false:
push eax
pop eax
cmp eax, 0
je GDT_z_init_while#r1_$end
mov eax, [GDT_z_init_i]
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
mov [main_z_addrGDT+ebx], eax
mov eax, [GDT_z_init_i]
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
mov [main_z_addrGDT+ebx], eax
mov eax, [GDT_z_init_i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [GDT_z_init_i], eax
jmp GDT_z_init_while#r1_$start
GDT_z_init_while#r1_$end:
;========== GDT_z_init_while#r1_$end ==========

mov eax, [main_z_addrGDT]
push eax
mov eax, 0
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
mov eax, 0x00000000
push eax
call kernel_z_setGDT

mov eax, [main_z_addrGDT]
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

mov eax, [main_z_addrGDT]
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
GDT_z_init$pass:
;============[fun end]init=============



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


jmp main

limit_low equ 0
base_low equ 2 
base_mid equ 4 
access_right equ 5
limit_high equ 6 
base_high equ 7 
	
ALIGNB	16
GDTR:
		DW 8*8192-1 ; 最后一个字节的偏移
		DD 0x270000 ; 表的地址

ALIGNB	16
IDTR:
		DW 8*256-1       ; 后16位是IDT的大小，limit
		DD 0x26f800      ; 前32位是IDT在内存中的位置

; esi是将要填入的地址，就是GDT表的地址，例如Addr_GDT+1*8, Addr_GDT+2*8
; eax是基地址，是代码的
; ebx是控制参数和限制 24+8 4位扩展(自动填上)20位限长8位参数
;     高4位参数 高4位限制 低16位限制 8位参数 = 32位ebx
; 实际上高4位参数被自己固定掉了
; 因此用一个常量代替比较好
; 设置GDT内容
; kernel.z\setGDT(addr: dword, param1: dword, param2: dword)
kernel_z_setGDT:
  pop ebp
  pop ebx
  pop eax
  pop esi
  push ebp
	mov [esi+base_low],  ax ; 基地址的低16位
	shr eax, 16
	mov [esi+base_mid], al ; 8位，1个字节
	mov [esi+base_high], ah
	; 下面是限制与权限设置
	mov [esi+access_right], bl;8位参数
	; 0x00 未使用的记录表
	; 0x92 系统模式，可读写不可执行
	; 0x9a 系统模式，可执行可读不可写
	; 0xf2 应用模式，可读写不可执行
	; 0xfa 应用模式，可执行可读不可写
	shr ebx, 8
	mov [esi+limit_low], bx ; 限制的低16位
	shr ebx, 16
	or  bl, 0xc0 ; 0xc0=11000000
	and bl, 0xcf ; 规定好前4位为1100，0x11001111
	mov [esi+limit_high], bl ; 4位参数+4位段限长，高4位被称为扩展访问权，参数固定为
	; G=1(开启4K),D/B=1(32位段),0(固定),AVL=0(也是默认的)这4位在386前是没有的
	; 因此注意limit在这里被规定为24位长，其中高四位是扩展访问权，是固定的
ret 

; 加载GDT
; kernel.z\loadGDT()
kernel_z_loadGDT:
  lgdt [GDTR] ; 不加dword会警告，因为现在的标签的确从0开始的
ret

kernel_z_loadIDT:
	lidt [IDTR];装载IDT
ret

offset_low equ 0
selector equ 2
dw_count equ 4
access_right equ 5
offset_high equ 6
	
; esi是将要填入的地址
; eax偏移地址4字节,也就是中断函数地址了
kernel_z_setIDT:
	pop ebp
	pop eax 
	pop esi 
	push ebp 
	mov [esi+offset_low], ax 
	shr eax, 16
	mov [esi+offset_high], ax
	mov [esi+selector], word 2<<3 ; 第二段 
	mov ax, 1000111000000000B ; 参数都在这里，中断门
	mov [esi+dw_count], ax 
ret

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
TESTA: DW 0x1234
; 主进程入口
main:

  ; 测试用
  finit
  fld DWORD [TESTA]
  fld DWORD [eax]
  fadd to st1

  call main_z_run_once
  .loop:
    call main_z_run_loop
  jmp .loop

