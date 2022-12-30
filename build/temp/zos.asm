[bits 32]
ORG 0x280000
mov eax, 320
push eax
jmp main_z@screenWidth$pass
main_z@screenWidth: dd 0
main_z@screenWidth$pass:
pop eax
mov [main_z@screenWidth], eax

mov eax, 200
push eax
jmp main_z@screenHeight$pass
main_z@screenHeight: dd 0
main_z@screenHeight$pass:
pop eax
mov [main_z@screenHeight], eax

mov eax, 0x000a0000
push eax
jmp main_z@addrVram$pass
main_z@addrVram: dd 0
main_z@addrVram$pass:
pop eax
mov [main_z@addrVram], eax

mov eax, 0x0024e000
push eax
jmp main_z@addrPM$pass
main_z@addrPM: dd 0
main_z@addrPM$pass:
pop eax
mov [main_z@addrPM], eax

mov eax, 0x0026e000
push eax
jmp main_z@addrPDT$pass
main_z@addrPDT: dd 0
main_z@addrPDT$pass:
pop eax
mov [main_z@addrPDT], eax

mov eax, 0x0026f800
push eax
jmp main_z@addrIDT$pass
main_z@addrIDT: dd 0
main_z@addrIDT$pass:
pop eax
mov [main_z@addrIDT], eax

mov eax, 0x00270000
push eax
jmp main_z@addrGDT$pass
main_z@addrGDT: dd 0
main_z@addrGDT$pass:
pop eax
mov [main_z@addrGDT], eax


;############[fun begin]run_once############
jmp main_z@run_once$pass
main_z@run_once:
pop ebp
push ebp
ret
main_z@run_once$pass:
;============[fun end]run_once=============


;############[fun begin]run_loop############
jmp main_z@run_loop$pass
main_z@run_loop:
pop ebp
push ebp
call kernel_z_halt

ret
main_z@run_loop$pass:
;============[fun end]run_loop=============



;############[fun begin]set_1byte############
jmp memory_z@set_1byte$pass
memory_z@set_1byte:
pop ebp
;param: addr
jmp memory_z@set_1byte@addr$pass
memory_z@set_1byte@addr: dd 0
memory_z@set_1byte@addr$pass:
pop eax
mov [memory_z@set_1byte@addr], eax
;param: val
jmp memory_z@set_1byte@val$pass
memory_z@set_1byte@val: dd 0
memory_z@set_1byte@val$pass:
pop eax
mov [memory_z@set_1byte@val], eax
push ebp
mov eax, [memory_z@set_1byte@val]
push eax
mov eax, [memory_z@set_1byte@addr]
push eax
call kernel_z_setMem_1byte

ret
memory_z@set_1byte$pass:
;============[fun end]set_1byte=============


;############[fun begin]set_2byte############
jmp memory_z@set_2byte$pass
memory_z@set_2byte:
pop ebp
;param: addr
jmp memory_z@set_2byte@addr$pass
memory_z@set_2byte@addr: dd 0
memory_z@set_2byte@addr$pass:
pop eax
mov [memory_z@set_2byte@addr], eax
;param: val
jmp memory_z@set_2byte@val$pass
memory_z@set_2byte@val: dd 0
memory_z@set_2byte@val$pass:
pop eax
mov [memory_z@set_2byte@val], eax
push ebp
mov eax, [memory_z@set_2byte@val]
push eax
mov eax, [memory_z@set_2byte@addr]
push eax
call kernel_z_setMem_2byte

ret
memory_z@set_2byte$pass:
;============[fun end]set_2byte=============


;############[fun begin]set_4byte############
jmp memory_z@set_4byte$pass
memory_z@set_4byte:
pop ebp
;param: addr
jmp memory_z@set_4byte@addr$pass
memory_z@set_4byte@addr: dd 0
memory_z@set_4byte@addr$pass:
pop eax
mov [memory_z@set_4byte@addr], eax
;param: val
jmp memory_z@set_4byte@val$pass
memory_z@set_4byte@val: dd 0
memory_z@set_4byte@val$pass:
pop eax
mov [memory_z@set_4byte@val], eax
push ebp
mov eax, [memory_z@set_4byte@val]
push eax
mov eax, [memory_z@set_4byte@addr]
push eax
call kernel_z_setMem_4byte

ret
memory_z@set_4byte$pass:
;============[fun end]set_4byte=============



;############[fun begin]pixel############
jmp draw_z@pixel$pass
draw_z@pixel:
pop ebp
;param: vramAddr
jmp draw_z@pixel@vramAddr$pass
draw_z@pixel@vramAddr: dd 0
draw_z@pixel@vramAddr$pass:
pop eax
mov [draw_z@pixel@vramAddr], eax
;param: screenWidth
jmp draw_z@pixel@screenWidth$pass
draw_z@pixel@screenWidth: dd 0
draw_z@pixel@screenWidth$pass:
pop eax
mov [draw_z@pixel@screenWidth], eax
;param: color
jmp draw_z@pixel@color$pass
draw_z@pixel@color: dd 0
draw_z@pixel@color$pass:
pop eax
mov [draw_z@pixel@color], eax
;param: y
jmp draw_z@pixel@y$pass
draw_z@pixel@y: dd 0
draw_z@pixel@y$pass:
pop eax
mov [draw_z@pixel@y], eax
;param: x
jmp draw_z@pixel@x$pass
draw_z@pixel@x: dd 0
draw_z@pixel@x$pass:
pop eax
mov [draw_z@pixel@x], eax
push ebp
mov eax, [draw_z@pixel@y]
push eax
mov eax, [draw_z@pixel@screenWidth]
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z@pixel@x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [draw_z@pixel@vramAddr]
push eax
pop eax
pop ebx
add eax, ebx
push eax
jmp draw_z@pixel@addr$pass
draw_z@pixel@addr: dd 0
draw_z@pixel@addr$pass:
pop eax
mov [draw_z@pixel@addr], eax

mov eax, [draw_z@pixel@color]
push eax
mov eax, [draw_z@pixel@addr]
push eax
call memory_z_set_1byte

ret
draw_z@pixel$pass:
;============[fun end]pixel=============


;############[fun begin]hLine############
jmp draw_z@hLine$pass
draw_z@hLine:
pop ebp
;param: vramAddr
jmp draw_z@hLine@vramAddr$pass
draw_z@hLine@vramAddr: dd 0
draw_z@hLine@vramAddr$pass:
pop eax
mov [draw_z@hLine@vramAddr], eax
;param: screenWidth
jmp draw_z@hLine@screenWidth$pass
draw_z@hLine@screenWidth: dd 0
draw_z@hLine@screenWidth$pass:
pop eax
mov [draw_z@hLine@screenWidth], eax
;param: color
jmp draw_z@hLine@color$pass
draw_z@hLine@color: dd 0
draw_z@hLine@color$pass:
pop eax
mov [draw_z@hLine@color], eax
;param: ey
jmp draw_z@hLine@ey$pass
draw_z@hLine@ey: dd 0
draw_z@hLine@ey$pass:
pop eax
mov [draw_z@hLine@ey], eax
;param: ex
jmp draw_z@hLine@ex$pass
draw_z@hLine@ex: dd 0
draw_z@hLine@ex$pass:
pop eax
mov [draw_z@hLine@ex], eax
;param: by
jmp draw_z@hLine@by$pass
draw_z@hLine@by: dd 0
draw_z@hLine@by$pass:
pop eax
mov [draw_z@hLine@by], eax
;param: bx
jmp draw_z@hLine@bx$pass
draw_z@hLine@bx: dd 0
draw_z@hLine@bx$pass:
pop eax
mov [draw_z@hLine@bx], eax
push ebp
mov eax, [draw_z@hLine@bx]
push eax
jmp draw_z@hLine@i$pass
draw_z@hLine@i: dd 0
draw_z@hLine@i$pass:
pop eax
mov [draw_z@hLine@i], eax

;########## draw_z@hLine@while#1@$start ##########
draw_z@hLine@while#1@$start:
mov eax, [draw_z@hLine@while#1@i]
push eax
mov eax, [draw_z@hLine@while#1@ex]
push eax
pop ebx
pop eax
cmp eax, ebx
jbe draw_z@hLine@while#1@leq#1@true
mov eax, 0
jmp draw_z@hLine@while#1@leq#1@false
draw_z@hLine@while#1@leq#1@true:
mov eax, 1
draw_z@hLine@while#1@leq#1@false:
push eax
pop eax
cmp eax, 0
je draw_z@hLine@while#1@$end
mov eax, [draw_z@hLine@while#1@i]
push eax
mov eax, [draw_z@hLine@while#1@by]
push eax
mov eax, [draw_z@hLine@while#1@color]
push eax
mov eax, [draw_z@hLine@while#1@screenWidth]
push eax
mov eax, [draw_z@hLine@while#1@vramAddr]
push eax
call draw_z@hLine@while#1@pixel

mov eax, [draw_z@hLine@while#1@i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@hLine@while#1@i], eax
jmp draw_z@hLine@while#1@$start
draw_z@hLine@while#1@$end:
;========== draw_z@hLine@while#1@$end ==========

ret
draw_z@hLine$pass:
;============[fun end]hLine=============


;############[fun begin]font############
jmp draw_z@font$pass
draw_z@font:
pop ebp
;param: backColor
jmp draw_z@font@backColor$pass
draw_z@font@backColor: dd 0
draw_z@font@backColor$pass:
pop eax
mov [draw_z@font@backColor], eax
;param: foreColor
jmp draw_z@font@foreColor$pass
draw_z@font@foreColor: dd 0
draw_z@font@foreColor$pass:
pop eax
mov [draw_z@font@foreColor], eax
;param: top
jmp draw_z@font@top$pass
draw_z@font@top: dd 0
draw_z@font@top$pass:
pop eax
mov [draw_z@font@top], eax
;param: left
jmp draw_z@font@left$pass
draw_z@font@left: dd 0
draw_z@font@left$pass:
pop eax
mov [draw_z@font@left], eax
;param: charAddr
jmp draw_z@font@charAddr$pass
draw_z@font@charAddr: dd 0
draw_z@font@charAddr$pass:
pop eax
mov [draw_z@font@charAddr], eax
push ebp
ret
draw_z@font$pass:
;============[fun end]font=============


;############[fun begin]flush############
jmp draw_z@flush$pass
draw_z@flush:
pop ebp
;param: addrVram
jmp draw_z@flush@addrVram$pass
draw_z@flush@addrVram: dd 0
draw_z@flush@addrVram$pass:
pop eax
mov [draw_z@flush@addrVram], eax
push ebp
mov eax, 0
push eax
jmp draw_z@flush@left$pass
draw_z@flush@left: dd 0
draw_z@flush@left$pass:
pop eax
mov [draw_z@flush@left], eax

mov eax, 0
push eax
jmp draw_z@flush@top$pass
draw_z@flush@top: dd 0
draw_z@flush@top$pass:
pop eax
mov [draw_z@flush@top], eax

;########## draw_z@flush@while#1@$start ##########
draw_z@flush@while#1@$start:
mov eax, [draw_z@flush@while#1@top]
push eax
mov eax, 25
push eax
pop ebx
pop eax
cmp eax, ebx
jb draw_z@flush@while#1@les#1@true
mov eax, 0
jmp draw_z@flush@while#1@les#1@false
draw_z@flush@while#1@les#1@true:
mov eax, 1
draw_z@flush@while#1@les#1@false:
push eax
pop eax
cmp eax, 0
je draw_z@flush@while#1@$end
mov eax, 0
push eax
pop eax
mov [draw_z@flush@while#1@left], eax
;########## draw_z@flush@while#1@while#1@$start ##########
draw_z@flush@while#1@while#1@$start:
mov eax, [draw_z@flush@while#1@while#1@left]
push eax
mov eax, 40
push eax
pop ebx
pop eax
cmp eax, ebx
jb draw_z@flush@while#1@while#1@les#1@true
mov eax, 0
jmp draw_z@flush@while#1@while#1@les#1@false
draw_z@flush@while#1@while#1@les#1@true:
mov eax, 1
draw_z@flush@while#1@while#1@les#1@false:
push eax
pop eax
cmp eax, 0
je draw_z@flush@while#1@while#1@$end
mov eax, 15
push eax
jmp draw_z@flush@while#1@while#1@color$pass
draw_z@flush@while#1@while#1@color: dd 0
draw_z@flush@while#1@while#1@color$pass:
pop eax
mov [draw_z@flush@while#1@while#1@color], eax

mov eax, [draw_z@flush@while#1@while#1@left]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z@flush@while#1@while#1@top]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z@flush@while#1@while#1@color]
push eax
mov eax, 320
push eax
mov eax, [draw_z@flush@while#1@while#1@addrVram]
push eax
call draw_z_pixel

mov eax, [draw_z@flush@while#1@while#1@left]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@flush@while#1@while#1@left], eax
jmp draw_z@flush@while#1@while#1@$start
draw_z@flush@while#1@while#1@$end:
;========== draw_z@flush@while#1@while#1@$end ==========

mov eax, [draw_z@flush@while#1@top]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@flush@while#1@top], eax
jmp draw_z@flush@while#1@$start
draw_z@flush@while#1@$end:
;========== draw_z@flush@while#1@$end ==========

ret
draw_z@flush$pass:
;============[fun end]flush=============


;############[fun begin]char############
jmp draw_z@char$pass
draw_z@char:
pop ebp
;param: addrVram
jmp draw_z@char@addrVram$pass
draw_z@char@addrVram: dd 0
draw_z@char@addrVram$pass:
pop eax
mov [draw_z@char@addrVram], eax
;param: screenWidth
jmp draw_z@char@screenWidth$pass
draw_z@char@screenWidth: dd 0
draw_z@char@screenWidth$pass:
pop eax
mov [draw_z@char@screenWidth], eax
;param: ascii
jmp draw_z@char@ascii$pass
draw_z@char@ascii: dd 0
draw_z@char@ascii$pass:
pop eax
mov [draw_z@char@ascii], eax
;param: backColor
jmp draw_z@char@backColor$pass
draw_z@char@backColor: dd 0
draw_z@char@backColor$pass:
pop eax
mov [draw_z@char@backColor], eax
;param: foreColor
jmp draw_z@char@foreColor$pass
draw_z@char@foreColor: dd 0
draw_z@char@foreColor$pass:
pop eax
mov [draw_z@char@foreColor], eax
;param: top
jmp draw_z@char@top$pass
draw_z@char@top: dd 0
draw_z@char@top$pass:
pop eax
mov [draw_z@char@top], eax
;param: left
jmp draw_z@char@left$pass
draw_z@char@left: dd 0
draw_z@char@left$pass:
pop eax
mov [draw_z@char@left], eax
push ebp
mov eax, [draw_z@char@ascii]
push eax
call font_z_getAddrByAscii

jmp draw_z@char@fontAddr$pass
draw_z@char@fontAddr: dd 0
draw_z@char@fontAddr$pass:
pop eax
mov [draw_z@char@fontAddr], eax

mov eax, 0
push eax
jmp draw_z@char@x$pass
draw_z@char@x: dd 0
draw_z@char@x$pass:
pop eax
mov [draw_z@char@x], eax

mov eax, 0
push eax
jmp draw_z@char@y$pass
draw_z@char@y: dd 0
draw_z@char@y$pass:
pop eax
mov [draw_z@char@y], eax

;########## draw_z@char@while#1@$start ##########
draw_z@char@while#1@$start:
mov eax, [draw_z@char@while#1@y]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jb draw_z@char@while#1@les#1@true
mov eax, 0
jmp draw_z@char@while#1@les#1@false
draw_z@char@while#1@les#1@true:
mov eax, 1
draw_z@char@while#1@les#1@false:
push eax
pop eax
cmp eax, 0
je draw_z@char@while#1@$end
mov eax, 0
push eax
pop eax
mov [draw_z@char@while#1@x], eax
;########## draw_z@char@while#1@while#1@$start ##########
draw_z@char@while#1@while#1@$start:
mov eax, [draw_z@char@while#1@while#1@x]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jb draw_z@char@while#1@while#1@les#1@true
mov eax, 0
jmp draw_z@char@while#1@while#1@les#1@false
draw_z@char@while#1@while#1@les#1@true:
mov eax, 1
draw_z@char@while#1@while#1@les#1@false:
push eax
pop eax
cmp eax, 0
je draw_z@char@while#1@while#1@$end
mov eax, [draw_z@char@while#1@while#1@y]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z@char@while#1@while#1@x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov ebx, 4
pop eax
mul ebx
mov ebx, eax
mov eax, [draw_z@char@while#1@while#1@fontAddr]
add eax, ebx
mov ebx, [eax]
push eax
jmp draw_z@char@while#1@while#1@color$pass
draw_z@char@while#1@while#1@color: dd 0
draw_z@char@while#1@while#1@color$pass:
pop eax
mov [draw_z@char@while#1@while#1@color], eax

;########## draw_z@char@while#1@while#1@if#1@$start ##########
mov eax, [draw_z@char@while#1@while#1@if#1@y]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z@char@while#1@while#1@if#1@x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov ebx, 4
pop eax
mul ebx
mov ebx, eax
mov eax, [draw_z@char@while#1@while#1@if#1@fontAddr]
add eax, ebx
mov ebx, [eax]
push eax
mov eax, 0
push eax
pop ebx
pop eax
cmp eax, ebx
jne draw_z@char@while#1@while#1@if#1@neq#1@true
mov eax, 0
jmp draw_z@char@while#1@while#1@if#1@neq#1@false
draw_z@char@while#1@while#1@if#1@neq#1@true:
mov eax, 1
draw_z@char@while#1@while#1@if#1@neq#1@false:
push eax
pop eax
cmp eax, 0
je draw_z@char@while#1@while#1@if#1@$else
mov eax, 15
push eax
pop eax
mov [draw_z@char@while#1@while#1@if#1@color], eax
jmp draw_z@char@while#1@while#1@if#1@$end
draw_z@char@while#1@while#1@if#1@$else:
mov eax, 0
push eax
pop eax
mov [draw_z@char@while#1@while#1@if#1@color], eax
draw_z@char@while#1@while#1@if#1@$end:
;========== draw_z@char@while#1@while#1@if#1@$end ==========

mov eax, [draw_z@char@while#1@while#1@left]
push eax
mov eax, [draw_z@char@while#1@while#1@x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [draw_z@char@while#1@while#1@top]
push eax
mov eax, [draw_z@char@while#1@while#1@y]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [draw_z@char@while#1@while#1@color]
push eax
mov eax, 320
push eax
mov eax, [draw_z@char@while#1@while#1@addrVram]
push eax
call draw_z_pixel

mov eax, [draw_z@char@while#1@while#1@x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@char@while#1@while#1@x], eax
jmp draw_z@char@while#1@while#1@$start
draw_z@char@while#1@while#1@$end:
;========== draw_z@char@while#1@while#1@$end ==========

mov eax, [draw_z@char@while#1@y]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@char@while#1@y], eax
jmp draw_z@char@while#1@$start
draw_z@char@while#1@$end:
;========== draw_z@char@while#1@$end ==========

ret
draw_z@char$pass:
;============[fun end]char=============


;############[fun begin]string############
jmp draw_z@string$pass
draw_z@string:
pop ebp
;param: addrVram
jmp draw_z@string@addrVram$pass
draw_z@string@addrVram: dd 0
draw_z@string@addrVram$pass:
pop eax
mov [draw_z@string@addrVram], eax
;param: screenWidth
jmp draw_z@string@screenWidth$pass
draw_z@string@screenWidth: dd 0
draw_z@string@screenWidth$pass:
pop eax
mov [draw_z@string@screenWidth], eax
;param: strAddr
jmp draw_z@string@strAddr$pass
draw_z@string@strAddr: dd 0
draw_z@string@strAddr$pass:
pop eax
mov [draw_z@string@strAddr], eax
;param: top
jmp draw_z@string@top$pass
draw_z@string@top: dd 0
draw_z@string@top$pass:
pop eax
mov [draw_z@string@top], eax
;param: left
jmp draw_z@string@left$pass
draw_z@string@left: dd 0
draw_z@string@left$pass:
pop eax
mov [draw_z@string@left], eax
push ebp
mov eax, 0
push eax
jmp draw_z@string@i$pass
draw_z@string@i: dd 0
draw_z@string@i$pass:
pop eax
mov [draw_z@string@i], eax

;########## draw_z@string@while#1@$start ##########
draw_z@string@while#1@$start:
mov eax, [draw_z@string@while#1@i]
push eax
mov ebx, 4
pop eax
mul ebx
mov ebx, eax
mov eax, [draw_z@string@while#1@strAddr]
add eax, ebx
mov ebx, [eax]
push eax
mov eax, 0
push eax
pop ebx
pop eax
cmp eax, ebx
jne draw_z@string@while#1@neq#1@true
mov eax, 0
jmp draw_z@string@while#1@neq#1@false
draw_z@string@while#1@neq#1@true:
mov eax, 1
draw_z@string@while#1@neq#1@false:
push eax
pop eax
cmp eax, 0
je draw_z@string@while#1@$end
mov eax, [draw_z@string@while#1@left]
push eax
mov eax, [draw_z@string@while#1@i]
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
mov eax, [draw_z@string@while#1@top]
push eax
mov eax, 1
push eax
mov eax, 2
push eax
mov eax, [draw_z@string@while#1@i]
push eax
mov ebx, 4
pop eax
mul ebx
mov ebx, eax
mov eax, [draw_z@string@while#1@strAddr]
add eax, ebx
mov ebx, [eax]
push eax
mov eax, [draw_z@string@while#1@screenWidth]
push eax
mov eax, [draw_z@string@while#1@addrVram]
push eax
call draw_z@string@while#1@char

mov eax, [draw_z@string@while#1@i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@string@while#1@i], eax
jmp draw_z@string@while#1@$start
draw_z@string@while#1@$end:
;========== draw_z@string@while#1@$end ==========

ret
draw_z@string$pass:
;============[fun end]string=============


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

; esi是将要填入的地址，就是GDT表的地址，例如Addr_GDT+1*8, Addr_GDT+2*8
; eax是基地址，是代码的
; ebx是控制参数和限制 24+8 4位扩展(自动填上)20位限长8位参数
;     高4位参数 高4位限制 低16位限制 8位参数 = 32位ebx
; 实际上高4位参数被自己固定掉了
; 因此用一个常量代替比较好
; 设置GDT内容
; kernel.z\setGDT(addr: dword, param1: dword, param2: dword)
setGDT:
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
loadGDT:
  lgdt [GDTR] ; 不加dword会警告，因为现在的标签的确从0开始的
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
  finit
  fld DWORD [TESTA]
  fld DWORD [eax]
  fadd to st1
  call main_z@run_once
  .loop:
    call main_z@run_loop
  jmp .loop

