
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
jmp draw_z_char_x$pass
draw_z_char_x: dd 0
draw_z_char_x$pass:
pop eax
mov [draw_z_char_x], eax

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
pop eax
mov [draw_z_char_x], eax
;########## draw_z_char_while#r7_while#r9_$start ##########
draw_z_char_while#r7_while#r9_$start:
mov eax, [draw_z_char_x]
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
pop eax
mov ebx, 4
mul ebx
mov ebx, [draw_z_char_fontAddr+eax]
push ebx
jmp draw_z_char_while#r7_while#r9_color$pass
draw_z_char_while#r7_while#r9_color: dd 0
draw_z_char_while#r7_while#r9_color$pass:
pop eax
mov [draw_z_char_while#r7_while#r9_color], eax

;########## draw_z_char_while#r7_while#r9_if#r11_$start ##########
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
pop eax
mov ebx, 4
mul ebx
mov ebx, [draw_z_char_fontAddr+eax]
push ebx
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
mov eax, [draw_z_char_while#r7_while#r9_color]
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

;########## draw_z_string_while#r31_$start ##########
draw_z_string_while#r31_$start:
mov eax, [draw_z_string_i]
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [draw_z_string_strAddr+eax]
push ebx
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
mov eax, 1
push eax
mov eax, 2
push eax
mov eax, [draw_z_string_i]
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [draw_z_string_strAddr+eax]
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
jmp draw_z_string_while#r31_$start
draw_z_string_while#r31_$end:
;========== draw_z_string_while#r31_$end ==========

ret
draw_z_string$pass:
;============[fun end]string=============


