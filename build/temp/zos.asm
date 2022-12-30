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


;############[fun begin]run.once############
jmp main_z@run.once$pass
main_z@run.once:
pop ebp
push ebp
ret
main_z@run.once$pass:
;============[fun end]run.once=============


;############[fun begin]run.loop############
jmp main_z@run.loop$pass
main_z@run.loop:
pop ebp
push ebp
call kernel_z_halt

ret
main_z@run.loop$pass:
;============[fun end]run.loop=============



;############[fun begin]set.1byte############
jmp memory_z@set.1byte$pass
memory_z@set.1byte:
pop ebp
;param: addr
memory_z@set.1byte@addr$pass
memory_z@set.1byte@addr: dd 0
memory_z@set.1byte@addr$pass:
pop eax
mv [memory_z@set.1byte@addr], eax
;param: val
memory_z@set.1byte@val$pass
memory_z@set.1byte@val: dd 0
memory_z@set.1byte@val$pass:
pop eax
mv [memory_z@set.1byte@val], eax
push ebp
mov eax, [memory_z@set.1byte@val]
push eax
mov eax, [memory_z@set.1byte@addr]
push eax
call kernel_z_setMem_1byte

ret
memory_z@set.1byte$pass:
;============[fun end]set.1byte=============


;############[fun begin]set.2byte############
jmp memory_z@set.2byte$pass
memory_z@set.2byte:
pop ebp
;param: addr
memory_z@set.2byte@addr$pass
memory_z@set.2byte@addr: dd 0
memory_z@set.2byte@addr$pass:
pop eax
mv [memory_z@set.2byte@addr], eax
;param: val
memory_z@set.2byte@val$pass
memory_z@set.2byte@val: dd 0
memory_z@set.2byte@val$pass:
pop eax
mv [memory_z@set.2byte@val], eax
push ebp
mov eax, [memory_z@set.2byte@val]
push eax
mov eax, [memory_z@set.2byte@addr]
push eax
call kernel_z_setMem_2byte

ret
memory_z@set.2byte$pass:
;============[fun end]set.2byte=============


;############[fun begin]set.4byte############
jmp memory_z@set.4byte$pass
memory_z@set.4byte:
pop ebp
;param: addr
memory_z@set.4byte@addr$pass
memory_z@set.4byte@addr: dd 0
memory_z@set.4byte@addr$pass:
pop eax
mv [memory_z@set.4byte@addr], eax
;param: val
memory_z@set.4byte@val$pass
memory_z@set.4byte@val: dd 0
memory_z@set.4byte@val$pass:
pop eax
mv [memory_z@set.4byte@val], eax
push ebp
mov eax, [memory_z@set.4byte@val]
push eax
mov eax, [memory_z@set.4byte@addr]
push eax
call kernel_z_setMem_4byte

ret
memory_z@set.4byte$pass:
;============[fun end]set.4byte=============



;############[fun begin]init############
jmp GDT_z@init$pass
GDT_z@init:
pop ebp
push ebp
mov eax, 0
push eax
jmp GDT_z@init@i$pass
GDT_z@init@i: dd 0
GDT_z@init@i$pass:
pop eax
mov [GDT_z@init@i], eax

;########## GDT_z@init@while#1@$start ##########
GDT_z@init@while#1@$start:
mov eax, [GDT_z@init@while#1@i]
push eax
mov eax, 8192
push eax
pop ebx
pop eax
cmp eax, ebx
jb GDT_z@init@while#1@les#1@true
mov eax, 0
jmp GDT_z@init@while#1@les#1@false
GDT_z@init@while#1@les#1@true:
mov eax, 1
GDT_z@init@while#1@les#1@false:
push eax
pop eax
cmp eax, 0
je GDT_z@init@while#1@$end
mov eax, [main_z_Addr]
push eax


;############[fun begin]pixel############
jmp draw_z@pixel$pass
draw_z@pixel:
pop ebp
;param: vramAddr
draw_z@pixel@vramAddr$pass
draw_z@pixel@vramAddr: dd 0
draw_z@pixel@vramAddr$pass:
pop eax
mv [draw_z@pixel@vramAddr], eax
;param: screenWidth
draw_z@pixel@screenWidth$pass
draw_z@pixel@screenWidth: dd 0
draw_z@pixel@screenWidth$pass:
pop eax
mv [draw_z@pixel@screenWidth], eax
;param: color
draw_z@pixel@color$pass
draw_z@pixel@color: dd 0
draw_z@pixel@color$pass:
pop eax
mv [draw_z@pixel@color], eax
;param: y
draw_z@pixel@y$pass
draw_z@pixel@y: dd 0
draw_z@pixel@y$pass:
pop eax
mv [draw_z@pixel@y], eax
;param: x
draw_z@pixel@x$pass
draw_z@pixel@x: dd 0
draw_z@pixel@x$pass:
pop eax
mv [draw_z@pixel@x], eax
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
draw_z@hLine@vramAddr$pass
draw_z@hLine@vramAddr: dd 0
draw_z@hLine@vramAddr$pass:
pop eax
mv [draw_z@hLine@vramAddr], eax
;param: screenWidth
draw_z@hLine@screenWidth$pass
draw_z@hLine@screenWidth: dd 0
draw_z@hLine@screenWidth$pass:
pop eax
mv [draw_z@hLine@screenWidth], eax
;param: color
draw_z@hLine@color$pass
draw_z@hLine@color: dd 0
draw_z@hLine@color$pass:
pop eax
mv [draw_z@hLine@color], eax
;param: ey
draw_z@hLine@ey$pass
draw_z@hLine@ey: dd 0
draw_z@hLine@ey$pass:
pop eax
mv [draw_z@hLine@ey], eax
;param: ex
draw_z@hLine@ex$pass
draw_z@hLine@ex: dd 0
draw_z@hLine@ex$pass:
pop eax
mv [draw_z@hLine@ex], eax
;param: by
draw_z@hLine@by$pass
draw_z@hLine@by: dd 0
draw_z@hLine@by$pass:
pop eax
mv [draw_z@hLine@by], eax
;param: bx
draw_z@hLine@bx$pass
draw_z@hLine@bx: dd 0
draw_z@hLine@bx$pass:
pop eax
mv [draw_z@hLine@bx], eax
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
draw_z@font@backColor$pass
draw_z@font@backColor: dd 0
draw_z@font@backColor$pass:
pop eax
mv [draw_z@font@backColor], eax
;param: foreColor
draw_z@font@foreColor$pass
draw_z@font@foreColor: dd 0
draw_z@font@foreColor$pass:
pop eax
mv [draw_z@font@foreColor], eax
;param: top
draw_z@font@top$pass
draw_z@font@top: dd 0
draw_z@font@top$pass:
pop eax
mv [draw_z@font@top], eax
;param: left
draw_z@font@left$pass
draw_z@font@left: dd 0
draw_z@font@left$pass:
pop eax
mv [draw_z@font@left], eax
;param: charAddr
draw_z@font@charAddr$pass
draw_z@font@charAddr: dd 0
draw_z@font@charAddr$pass:
pop eax
mv [draw_z@font@charAddr], eax
push ebp
ret
draw_z@font$pass:
;============[fun end]font=============


;############[fun begin]flush############
jmp draw_z@flush$pass
draw_z@flush:
pop ebp
;param: addrVram
draw_z@flush@addrVram$pass
draw_z@flush@addrVram: dd 0
draw_z@flush@addrVram$pass:
pop eax
mv [draw_z@flush@addrVram], eax
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
draw_z@char@addrVram$pass
draw_z@char@addrVram: dd 0
draw_z@char@addrVram$pass:
pop eax
mv [draw_z@char@addrVram], eax
;param: screenWidth
draw_z@char@screenWidth$pass
draw_z@char@screenWidth: dd 0
draw_z@char@screenWidth$pass:
pop eax
mv [draw_z@char@screenWidth], eax
;param: ascii
draw_z@char@ascii$pass
draw_z@char@ascii: dd 0
draw_z@char@ascii$pass:
pop eax
mv [draw_z@char@ascii], eax
;param: backColor
draw_z@char@backColor$pass
draw_z@char@backColor: dd 0
draw_z@char@backColor$pass:
pop eax
mv [draw_z@char@backColor], eax
;param: foreColor
draw_z@char@foreColor$pass
draw_z@char@foreColor: dd 0
draw_z@char@foreColor$pass:
pop eax
mv [draw_z@char@foreColor], eax
;param: top
draw_z@char@top$pass
draw_z@char@top: dd 0
draw_z@char@top$pass:
pop eax
mv [draw_z@char@top], eax
;param: left
draw_z@char@left$pass
draw_z@char@left: dd 0
draw_z@char@left$pass:
pop eax
mv [draw_z@char@left], eax
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
draw_z@string@addrVram$pass
draw_z@string@addrVram: dd 0
draw_z@string@addrVram$pass:
pop eax
mv [draw_z@string@addrVram], eax
;param: screenWidth
draw_z@string@screenWidth$pass
draw_z@string@screenWidth: dd 0
draw_z@string@screenWidth$pass:
pop eax
mv [draw_z@string@screenWidth], eax
;param: strAddr
draw_z@string@strAddr$pass
draw_z@string@strAddr: dd 0
draw_z@string@strAddr$pass:
pop eax
mv [draw_z@string@strAddr], eax
;param: top
draw_z@string@top$pass
draw_z@string@top: dd 0
draw_z@string@top$pass:
pop eax
mv [draw_z@string@top], eax
;param: left
draw_z@string@left$pass
draw_z@string@left: dd 0
draw_z@string@left$pass:
pop eax
mv [draw_z@string@left], eax
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


jmp font_z@A$pass
font_z@A: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@A$pass:
jmp font_z@B$pass
font_z@B: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@B$pass:
jmp font_z@C$pass
font_z@C: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@C$pass:
jmp font_z@D$pass
font_z@D: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@D$pass:
jmp font_z@E$pass
font_z@E: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@E$pass:
jmp font_z@F$pass
font_z@F: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@F$pass:
jmp font_z@G$pass
font_z@G: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@G$pass:
jmp font_z@H$pass
font_z@H: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@H$pass:
jmp font_z@I$pass
font_z@I: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@I$pass:
jmp font_z@J$pass
font_z@J: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@J$pass:
jmp font_z@K$pass
font_z@K: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@K$pass:
jmp font_z@L$pass
font_z@L: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@L$pass:
jmp font_z@M$pass
font_z@M: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@M$pass:
jmp font_z@N$pass
font_z@N: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@N$pass:
jmp font_z@O$pass
font_z@O: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@O$pass:
jmp font_z@P$pass
font_z@P: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@P$pass:
jmp font_z@Q$pass
font_z@Q: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@Q$pass:
jmp font_z@R$pass
font_z@R: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@R$pass:
jmp font_z@S$pass
font_z@S: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@S$pass:
jmp font_z@T$pass
font_z@T: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@T$pass:
jmp font_z@U$pass
font_z@U: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@U$pass:
jmp font_z@V$pass
font_z@V: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@V$pass:
jmp font_z@W$pass
font_z@W: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@W$pass:
jmp font_z@X$pass
font_z@X: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@X$pass:
jmp font_z@Y$pass
font_z@Y: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@Y$pass:
jmp font_z@Z$pass
font_z@Z: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@Z$pass:
jmp font_z@question$pass
font_z@question: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
font_z@question$pass:
jmp font_z@space$pass
font_z@space: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@space$pass:
jmp font_z@add$pass
font_z@add: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@add$pass:
jmp font_z@sub$pass
font_z@sub: dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
font_z@sub$pass:
jmp font_z@screen.buf$pass
font_z@screen.buf: dd 32, 32, 32, 32, 33, 34, 35, 36, 37, 38, 39, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 
font_z@screen.buf$pass:

;############[fun begin]getAddrByAscii############
jmp font_z@getAddrByAscii$pass
font_z@getAddrByAscii:
pop ebp
;param: ascii
font_z@getAddrByAscii@ascii$pass
font_z@getAddrByAscii@ascii: dd 0
font_z@getAddrByAscii@ascii$pass:
pop eax
mv [font_z@getAddrByAscii@ascii], eax
push ebp
;########## font_z@getAddrByAscii@if#1@$start ##########
mov eax, [font_z@getAddrByAscii@if#1@ascii]
push eax
mov eax, 32
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#1@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#1@equ#1@false
font_z@getAddrByAscii@if#1@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#1@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#1@$else
mov eax, [font_z@getAddrByAscii@if#1@space]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#1@$end
font_z@getAddrByAscii@if#1@$else:
font_z@getAddrByAscii@if#1@$end:
;========== font_z@getAddrByAscii@if#1@$end ==========

;########## font_z@getAddrByAscii@if#2@$start ##########
mov eax, [font_z@getAddrByAscii@if#2@ascii]
push eax
mov eax, 65
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#2@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#2@equ#1@false
font_z@getAddrByAscii@if#2@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#2@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#2@$else
mov eax, [font_z@getAddrByAscii@if#2@A]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#2@$end
font_z@getAddrByAscii@if#2@$else:
font_z@getAddrByAscii@if#2@$end:
;========== font_z@getAddrByAscii@if#2@$end ==========

;########## font_z@getAddrByAscii@if#3@$start ##########
mov eax, [font_z@getAddrByAscii@if#3@ascii]
push eax
mov eax, 66
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#3@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#3@equ#1@false
font_z@getAddrByAscii@if#3@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#3@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#3@$else
mov eax, [font_z@getAddrByAscii@if#3@B]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#3@$end
font_z@getAddrByAscii@if#3@$else:
font_z@getAddrByAscii@if#3@$end:
;========== font_z@getAddrByAscii@if#3@$end ==========

;########## font_z@getAddrByAscii@if#4@$start ##########
mov eax, [font_z@getAddrByAscii@if#4@ascii]
push eax
mov eax, 67
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#4@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#4@equ#1@false
font_z@getAddrByAscii@if#4@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#4@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#4@$else
mov eax, [font_z@getAddrByAscii@if#4@C]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#4@$end
font_z@getAddrByAscii@if#4@$else:
font_z@getAddrByAscii@if#4@$end:
;========== font_z@getAddrByAscii@if#4@$end ==========

;########## font_z@getAddrByAscii@if#5@$start ##########
mov eax, [font_z@getAddrByAscii@if#5@ascii]
push eax
mov eax, 68
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#5@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#5@equ#1@false
font_z@getAddrByAscii@if#5@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#5@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#5@$else
mov eax, [font_z@getAddrByAscii@if#5@D]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#5@$end
font_z@getAddrByAscii@if#5@$else:
font_z@getAddrByAscii@if#5@$end:
;========== font_z@getAddrByAscii@if#5@$end ==========

;########## font_z@getAddrByAscii@if#6@$start ##########
mov eax, [font_z@getAddrByAscii@if#6@ascii]
push eax
mov eax, 69
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#6@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#6@equ#1@false
font_z@getAddrByAscii@if#6@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#6@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#6@$else
mov eax, [font_z@getAddrByAscii@if#6@E]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#6@$end
font_z@getAddrByAscii@if#6@$else:
font_z@getAddrByAscii@if#6@$end:
;========== font_z@getAddrByAscii@if#6@$end ==========

;########## font_z@getAddrByAscii@if#7@$start ##########
mov eax, [font_z@getAddrByAscii@if#7@ascii]
push eax
mov eax, 70
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#7@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#7@equ#1@false
font_z@getAddrByAscii@if#7@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#7@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#7@$else
mov eax, [font_z@getAddrByAscii@if#7@F]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#7@$end
font_z@getAddrByAscii@if#7@$else:
font_z@getAddrByAscii@if#7@$end:
;========== font_z@getAddrByAscii@if#7@$end ==========

;########## font_z@getAddrByAscii@if#8@$start ##########
mov eax, [font_z@getAddrByAscii@if#8@ascii]
push eax
mov eax, 71
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#8@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#8@equ#1@false
font_z@getAddrByAscii@if#8@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#8@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#8@$else
mov eax, [font_z@getAddrByAscii@if#8@G]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#8@$end
font_z@getAddrByAscii@if#8@$else:
font_z@getAddrByAscii@if#8@$end:
;========== font_z@getAddrByAscii@if#8@$end ==========

;########## font_z@getAddrByAscii@if#9@$start ##########
mov eax, [font_z@getAddrByAscii@if#9@ascii]
push eax
mov eax, 72
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#9@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#9@equ#1@false
font_z@getAddrByAscii@if#9@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#9@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#9@$else
mov eax, [font_z@getAddrByAscii@if#9@H]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#9@$end
font_z@getAddrByAscii@if#9@$else:
font_z@getAddrByAscii@if#9@$end:
;========== font_z@getAddrByAscii@if#9@$end ==========

;########## font_z@getAddrByAscii@if#:@$start ##########
mov eax, [font_z@getAddrByAscii@if#:@ascii]
push eax
mov eax, 73
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#:@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#:@equ#1@false
font_z@getAddrByAscii@if#:@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#:@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#:@$else
mov eax, [font_z@getAddrByAscii@if#:@I]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#:@$end
font_z@getAddrByAscii@if#:@$else:
font_z@getAddrByAscii@if#:@$end:
;========== font_z@getAddrByAscii@if#:@$end ==========

;########## font_z@getAddrByAscii@if#;@$start ##########
mov eax, [font_z@getAddrByAscii@if#;@ascii]
push eax
mov eax, 74
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#;@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#;@equ#1@false
font_z@getAddrByAscii@if#;@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#;@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#;@$else
mov eax, [font_z@getAddrByAscii@if#;@G]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#;@$end
font_z@getAddrByAscii@if#;@$else:
font_z@getAddrByAscii@if#;@$end:
;========== font_z@getAddrByAscii@if#;@$end ==========

;########## font_z@getAddrByAscii@if#<@$start ##########
mov eax, [font_z@getAddrByAscii@if#<@ascii]
push eax
mov eax, 75
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#<@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#<@equ#1@false
font_z@getAddrByAscii@if#<@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#<@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#<@$else
mov eax, [font_z@getAddrByAscii@if#<@K]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#<@$end
font_z@getAddrByAscii@if#<@$else:
font_z@getAddrByAscii@if#<@$end:
;========== font_z@getAddrByAscii@if#<@$end ==========

;########## font_z@getAddrByAscii@if#=@$start ##########
mov eax, [font_z@getAddrByAscii@if#=@ascii]
push eax
mov eax, 76
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#=@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#=@equ#1@false
font_z@getAddrByAscii@if#=@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#=@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#=@$else
mov eax, [font_z@getAddrByAscii@if#=@L]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#=@$end
font_z@getAddrByAscii@if#=@$else:
font_z@getAddrByAscii@if#=@$end:
;========== font_z@getAddrByAscii@if#=@$end ==========

;########## font_z@getAddrByAscii@if#>@$start ##########
mov eax, [font_z@getAddrByAscii@if#>@ascii]
push eax
mov eax, 77
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#>@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#>@equ#1@false
font_z@getAddrByAscii@if#>@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#>@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#>@$else
mov eax, [font_z@getAddrByAscii@if#>@M]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#>@$end
font_z@getAddrByAscii@if#>@$else:
font_z@getAddrByAscii@if#>@$end:
;========== font_z@getAddrByAscii@if#>@$end ==========

;########## font_z@getAddrByAscii@if#?@$start ##########
mov eax, [font_z@getAddrByAscii@if#?@ascii]
push eax
mov eax, 78
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#?@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#?@equ#1@false
font_z@getAddrByAscii@if#?@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#?@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#?@$else
mov eax, [font_z@getAddrByAscii@if#?@N]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#?@$end
font_z@getAddrByAscii@if#?@$else:
font_z@getAddrByAscii@if#?@$end:
;========== font_z@getAddrByAscii@if#?@$end ==========

;########## font_z@getAddrByAscii@if#@@$start ##########
mov eax, [font_z@getAddrByAscii@if#@@ascii]
push eax
mov eax, 79
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#@@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#@@equ#1@false
font_z@getAddrByAscii@if#@@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#@@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#@@$else
mov eax, [font_z@getAddrByAscii@if#@@O]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#@@$end
font_z@getAddrByAscii@if#@@$else:
font_z@getAddrByAscii@if#@@$end:
;========== font_z@getAddrByAscii@if#@@$end ==========

;########## font_z@getAddrByAscii@if#A@$start ##########
mov eax, [font_z@getAddrByAscii@if#A@ascii]
push eax
mov eax, 80
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#A@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#A@equ#1@false
font_z@getAddrByAscii@if#A@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#A@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#A@$else
mov eax, [font_z@getAddrByAscii@if#A@P]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#A@$end
font_z@getAddrByAscii@if#A@$else:
font_z@getAddrByAscii@if#A@$end:
;========== font_z@getAddrByAscii@if#A@$end ==========

;########## font_z@getAddrByAscii@if#B@$start ##########
mov eax, [font_z@getAddrByAscii@if#B@ascii]
push eax
mov eax, 81
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#B@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#B@equ#1@false
font_z@getAddrByAscii@if#B@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#B@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#B@$else
mov eax, [font_z@getAddrByAscii@if#B@Q]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#B@$end
font_z@getAddrByAscii@if#B@$else:
font_z@getAddrByAscii@if#B@$end:
;========== font_z@getAddrByAscii@if#B@$end ==========

;########## font_z@getAddrByAscii@if#C@$start ##########
mov eax, [font_z@getAddrByAscii@if#C@ascii]
push eax
mov eax, 82
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#C@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#C@equ#1@false
font_z@getAddrByAscii@if#C@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#C@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#C@$else
mov eax, [font_z@getAddrByAscii@if#C@R]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#C@$end
font_z@getAddrByAscii@if#C@$else:
font_z@getAddrByAscii@if#C@$end:
;========== font_z@getAddrByAscii@if#C@$end ==========

;########## font_z@getAddrByAscii@if#D@$start ##########
mov eax, [font_z@getAddrByAscii@if#D@ascii]
push eax
mov eax, 83
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#D@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#D@equ#1@false
font_z@getAddrByAscii@if#D@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#D@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#D@$else
mov eax, [font_z@getAddrByAscii@if#D@S]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#D@$end
font_z@getAddrByAscii@if#D@$else:
font_z@getAddrByAscii@if#D@$end:
;========== font_z@getAddrByAscii@if#D@$end ==========

;########## font_z@getAddrByAscii@if#E@$start ##########
mov eax, [font_z@getAddrByAscii@if#E@ascii]
push eax
mov eax, 84
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#E@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#E@equ#1@false
font_z@getAddrByAscii@if#E@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#E@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#E@$else
mov eax, [font_z@getAddrByAscii@if#E@T]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#E@$end
font_z@getAddrByAscii@if#E@$else:
font_z@getAddrByAscii@if#E@$end:
;========== font_z@getAddrByAscii@if#E@$end ==========

;########## font_z@getAddrByAscii@if#F@$start ##########
mov eax, [font_z@getAddrByAscii@if#F@ascii]
push eax
mov eax, 85
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#F@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#F@equ#1@false
font_z@getAddrByAscii@if#F@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#F@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#F@$else
mov eax, [font_z@getAddrByAscii@if#F@U]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#F@$end
font_z@getAddrByAscii@if#F@$else:
font_z@getAddrByAscii@if#F@$end:
;========== font_z@getAddrByAscii@if#F@$end ==========

;########## font_z@getAddrByAscii@if#G@$start ##########
mov eax, [font_z@getAddrByAscii@if#G@ascii]
push eax
mov eax, 86
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#G@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#G@equ#1@false
font_z@getAddrByAscii@if#G@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#G@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#G@$else
mov eax, [font_z@getAddrByAscii@if#G@V]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#G@$end
font_z@getAddrByAscii@if#G@$else:
font_z@getAddrByAscii@if#G@$end:
;========== font_z@getAddrByAscii@if#G@$end ==========

;########## font_z@getAddrByAscii@if#H@$start ##########
mov eax, [font_z@getAddrByAscii@if#H@ascii]
push eax
mov eax, 87
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#H@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#H@equ#1@false
font_z@getAddrByAscii@if#H@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#H@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#H@$else
mov eax, [font_z@getAddrByAscii@if#H@W]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#H@$end
font_z@getAddrByAscii@if#H@$else:
font_z@getAddrByAscii@if#H@$end:
;========== font_z@getAddrByAscii@if#H@$end ==========

;########## font_z@getAddrByAscii@if#I@$start ##########
mov eax, [font_z@getAddrByAscii@if#I@ascii]
push eax
mov eax, 88
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#I@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#I@equ#1@false
font_z@getAddrByAscii@if#I@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#I@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#I@$else
mov eax, [font_z@getAddrByAscii@if#I@X]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#I@$end
font_z@getAddrByAscii@if#I@$else:
font_z@getAddrByAscii@if#I@$end:
;========== font_z@getAddrByAscii@if#I@$end ==========

;########## font_z@getAddrByAscii@if#J@$start ##########
mov eax, [font_z@getAddrByAscii@if#J@ascii]
push eax
mov eax, 89
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#J@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#J@equ#1@false
font_z@getAddrByAscii@if#J@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#J@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#J@$else
mov eax, [font_z@getAddrByAscii@if#J@Y]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#J@$end
font_z@getAddrByAscii@if#J@$else:
font_z@getAddrByAscii@if#J@$end:
;========== font_z@getAddrByAscii@if#J@$end ==========

;########## font_z@getAddrByAscii@if#K@$start ##########
mov eax, [font_z@getAddrByAscii@if#K@ascii]
push eax
mov eax, 90
push eax
pop ebx
pop eax
cmp eax, ebx
je font_z@getAddrByAscii@if#K@equ#1@true
mov eax, 0
jmp font_z@getAddrByAscii@if#K@equ#1@false
font_z@getAddrByAscii@if#K@equ#1@true:
mov eax, 1
font_z@getAddrByAscii@if#K@equ#1@false:
push eax
pop eax
cmp eax, 0
je font_z@getAddrByAscii@if#K@$else
mov eax, [font_z@getAddrByAscii@if#K@Z]
push eax
pop eax
pop ebp
push eax
push ebp
ret
jmp font_z@getAddrByAscii@if#K@$end
font_z@getAddrByAscii@if#K@$else:
font_z@getAddrByAscii@if#K@$end:
;========== font_z@getAddrByAscii@if#K@$end ==========

ret
font_z@getAddrByAscii$pass:
;============[fun end]getAddrByAscii=============



;############[fun begin]rect############
jmp test_z@rect$pass
test_z@rect:
pop ebp
;param: addrVram
test_z@rect@addrVram$pass
test_z@rect@addrVram: dd 0
test_z@rect@addrVram$pass:
pop eax
mv [test_z@rect@addrVram], eax
;param: top
test_z@rect@top$pass
test_z@rect@top: dd 0
test_z@rect@top$pass:
pop eax
mv [test_z@rect@top], eax
;param: left
test_z@rect@left$pass
test_z@rect@left: dd 0
test_z@rect@left$pass:
pop eax
mv [test_z@rect@left], eax
push ebp
mov eax, 0
push eax
jmp test_z@rect@x$pass
test_z@rect@x: dd 0
test_z@rect@x$pass:
pop eax
mov [test_z@rect@x], eax

mov eax, 0
push eax
jmp test_z@rect@y$pass
test_z@rect@y: dd 0
test_z@rect@y$pass:
pop eax
mov [test_z@rect@y], eax

;########## test_z@rect@while#1@$start ##########
test_z@rect@while#1@$start:
mov eax, [test_z@rect@while#1@y]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jbe test_z@rect@while#1@leq#1@true
mov eax, 0
jmp test_z@rect@while#1@leq#1@false
test_z@rect@while#1@leq#1@true:
mov eax, 1
test_z@rect@while#1@leq#1@false:
push eax
pop eax
cmp eax, 0
je test_z@rect@while#1@$end
;########## test_z@rect@while#1@while#1@$start ##########
test_z@rect@while#1@while#1@$start:
mov eax, [test_z@rect@while#1@while#1@x]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jbe test_z@rect@while#1@while#1@leq#1@true
mov eax, 0
jmp test_z@rect@while#1@while#1@leq#1@false
test_z@rect@while#1@while#1@leq#1@true:
mov eax, 1
test_z@rect@while#1@while#1@leq#1@false:
push eax
pop eax
cmp eax, 0
je test_z@rect@while#1@while#1@$end
mov eax, 3
push eax
jmp test_z@rect@while#1@while#1@color$pass
test_z@rect@while#1@while#1@color: dd 0
test_z@rect@while#1@while#1@color$pass:
pop eax
mov [test_z@rect@while#1@while#1@color], eax

mov eax, [test_z@rect@while#1@while#1@left]
push eax
mov eax, [test_z@rect@while#1@while#1@x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [test_z@rect@while#1@while#1@top]
push eax
mov eax, [test_z@rect@while#1@while#1@y]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [test_z@rect@while#1@while#1@color]
push eax
mov eax, 320
push eax
mov eax, [test_z@rect@while#1@while#1@addrVram]
push eax
call draw_z_pixel

mov eax, [test_z@rect@while#1@while#1@x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z@rect@while#1@while#1@x], eax
jmp test_z@rect@while#1@while#1@$start
test_z@rect@while#1@while#1@$end:
;========== test_z@rect@while#1@while#1@$end ==========

mov eax, [test_z@rect@while#1@y]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z@rect@while#1@y], eax
jmp test_z@rect@while#1@$start
test_z@rect@while#1@$end:
;========== test_z@rect@while#1@$end ==========

ret
test_z@rect$pass:
;============[fun end]rect=============


;############[fun begin]block############
jmp test_z@block$pass
test_z@block:
pop ebp
;param: addrVram
test_z@block@addrVram$pass
test_z@block@addrVram: dd 0
test_z@block@addrVram$pass:
pop eax
mv [test_z@block@addrVram], eax
push ebp
mov eax, 0
push eax
jmp test_z@block@i$pass
test_z@block@i: dd 0
test_z@block@i$pass:
pop eax
mov [test_z@block@i], eax

;########## test_z@block@while#1@$start ##########
test_z@block@while#1@$start:
mov eax, [test_z@block@while#1@i]
push eax
mov eax, 300
push eax
pop ebx
pop eax
cmp eax, ebx
jb test_z@block@while#1@les#1@true
mov eax, 0
jmp test_z@block@while#1@les#1@false
test_z@block@while#1@les#1@true:
mov eax, 1
test_z@block@while#1@les#1@false:
push eax
pop eax
cmp eax, 0
je test_z@block@while#1@$end
mov eax, [test_z@block@while#1@i]
push eax
mov eax, [test_z@block@while#1@i]
push eax
mov eax, [test_z@block@while#1@i]
push eax
mov eax, 320
push eax
mov eax, [test_z@block@while#1@addrVram]
push eax
call draw_z_pixel

mov eax, [test_z@block@while#1@i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z@block@while#1@i], eax
jmp test_z@block@while#1@$start
test_z@block@while#1@$end:
;========== test_z@block@while#1@$end ==========

ret
test_z@block$pass:
;============[fun end]block=============


;############[fun begin]draw############
jmp test_z@draw$pass
test_z@draw:
pop ebp
;param: addrVram
test_z@draw@addrVram$pass
test_z@draw@addrVram: dd 0
test_z@draw@addrVram$pass:
pop eax
mv [test_z@draw@addrVram], eax
push ebp
mov eax, [test_z@draw@addrVram]
push eax
call test_z@draw@block

jmp test_z@draw@tstr$pass
test_z@draw@tstr: dd "HELLO WORLD"
test_z@draw@tstr$pass:
ret
test_z@draw$pass:
;============[fun end]draw=============


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

