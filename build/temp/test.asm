
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
jmp test_z_rect_x$pass
test_z_rect_x: dd 0
test_z_rect_x$pass:
pop eax
mov [test_z_rect_x], eax

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
mov eax, 8
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
;########## test_z_rect_while#r1_while#r3_$start ##########
test_z_rect_while#r1_while#r3_$start:
mov eax, [test_z_rect_x]
push eax
mov eax, 8
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
mov eax, 3
push eax
jmp test_z_rect_while#r1_while#r3_color$pass
test_z_rect_while#r1_while#r3_color: dd 0
test_z_rect_while#r1_while#r3_color$pass:
pop eax
mov [test_z_rect_while#r1_while#r3_color], eax

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
mov eax, [test_z_rect_while#r1_while#r3_color]
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


;############[fun begin]block############
jmp test_z_block$pass
test_z_block:
pop ebp
;param: addrVram
jmp test_z_block_addrVram$pass
test_z_block_addrVram: dd 0
test_z_block_addrVram$pass:
pop eax
mov [test_z_block_addrVram], eax
push ebp
mov eax, 0
push eax
jmp test_z_block_i$pass
test_z_block_i: dd 0
test_z_block_i$pass:
pop eax
mov [test_z_block_i], eax

;########## test_z_block_while#r5_$start ##########
test_z_block_while#r5_$start:
mov eax, [test_z_block_i]
push eax
mov eax, 300
push eax
pop ebx
pop eax
cmp eax, ebx
jb test_z_block_while#r5_les#r6$true
mov eax, 0
jmp test_z_block_while#r5_les#r6$false
test_z_block_while#r5_les#r6$true:
mov eax, 1
test_z_block_while#r5_les#r6$false:
push eax
pop eax
cmp eax, 0
je test_z_block_while#r5_$end
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
jmp test_z_block_while#r5_$start
test_z_block_while#r5_$end:
;========== test_z_block_while#r5_$end ==========

ret
test_z_block$pass:
;============[fun end]block=============


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
call test_z_block

ret
test_z_draw$pass:
;============[fun end]draw=============


