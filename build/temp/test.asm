
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
test_z_draw_tstr: dd 0, "HELLO ZLANG", 0
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


