
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


