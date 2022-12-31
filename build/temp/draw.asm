
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

;########## draw_z@hLine@while#r1@$start ##########
draw_z@hLine@while#r1@$start:
mov eax, [draw_z@hLine@i]
push eax
mov eax, [draw_z@hLine@ex]
push eax
pop ebx
pop eax
cmp eax, ebx
jbe leq#r2@true
mov eax, 0
jmp leq#r2@false
leq#r2@true:
mov eax, 1
leq#r2@false:
push eax
pop eax
cmp eax, 0
je draw_z@hLine@while#r1@$end
mov eax, [draw_z@hLine@i]
push eax
mov eax, [draw_z@hLine@by]
push eax
mov eax, [draw_z@hLine@color]
push eax
mov eax, [draw_z@hLine@screenWidth]
push eax
mov eax, [draw_z@hLine@vramAddr]
push eax
call draw_z@pixel

mov eax, [draw_z@hLine@i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@hLine@i], eax
jmp draw_z@hLine@while#r1@$start
draw_z@hLine@while#r1@$end:
;========== draw_z@hLine@while#r1@$end ==========

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

;########## draw_z@flush@while#r3@$start ##########
draw_z@flush@while#r3@$start:
mov eax, [draw_z@flush@top]
push eax
mov eax, 25
push eax
pop ebx
pop eax
cmp eax, ebx
jb les#r4@true
mov eax, 0
jmp les#r4@false
les#r4@true:
mov eax, 1
les#r4@false:
push eax
pop eax
cmp eax, 0
je draw_z@flush@while#r3@$end
mov eax, 0
push eax
pop eax
mov [draw_z@flush@left], eax
;########## draw_z@flush@while#r3@while#r5@$start ##########
draw_z@flush@while#r3@while#r5@$start:
mov eax, [draw_z@flush@left]
push eax
mov eax, 40
push eax
pop ebx
pop eax
cmp eax, ebx
jb les#r6@true
mov eax, 0
jmp les#r6@false
les#r6@true:
mov eax, 1
les#r6@false:
push eax
pop eax
cmp eax, 0
je draw_z@flush@while#r3@while#r5@$end
mov eax, 15
push eax
jmp draw_z@flush@while#r3@while#r5@color$pass
draw_z@flush@while#r3@while#r5@color: dd 0
draw_z@flush@while#r3@while#r5@color$pass:
pop eax
mov [draw_z@flush@while#r3@while#r5@color], eax

mov eax, [draw_z@flush@left]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z@flush@top]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z@flush@while#r3@while#r5@color]
push eax
mov eax, 320
push eax
mov eax, [draw_z@flush@addrVram]
push eax
call draw_z_pixel

mov eax, [draw_z@flush@left]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@flush@left], eax
jmp draw_z@flush@while#r3@while#r5@$start
draw_z@flush@while#r3@while#r5@$end:
;========== draw_z@flush@while#r3@while#r5@$end ==========

mov eax, [draw_z@flush@top]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@flush@top], eax
jmp draw_z@flush@while#r3@$start
draw_z@flush@while#r3@$end:
;========== draw_z@flush@while#r3@$end ==========

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

;########## draw_z@char@while#r7@$start ##########
draw_z@char@while#r7@$start:
mov eax, [draw_z@char@y]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jb les#r8@true
mov eax, 0
jmp les#r8@false
les#r8@true:
mov eax, 1
les#r8@false:
push eax
pop eax
cmp eax, 0
je draw_z@char@while#r7@$end
mov eax, 0
push eax
pop eax
mov [draw_z@char@x], eax
;########## draw_z@char@while#r7@while#r9@$start ##########
draw_z@char@while#r7@while#r9@$start:
mov eax, [draw_z@char@x]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jb les#r01@true
mov eax, 0
jmp les#r01@false
les#r01@true:
mov eax, 1
les#r01@false:
push eax
pop eax
cmp eax, 0
je draw_z@char@while#r7@while#r9@$end
mov eax, [draw_z@char@y]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z@char@x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [draw_z@char@fontAddr+eax]
push ebx
jmp draw_z@char@while#r7@while#r9@color$pass
draw_z@char@while#r7@while#r9@color: dd 0
draw_z@char@while#r7@while#r9@color$pass:
pop eax
mov [draw_z@char@while#r7@while#r9@color], eax

;########## draw_z@char@while#r7@while#r9@if#r11@$start ##########
mov eax, [draw_z@char@y]
push eax
mov eax, 8
push eax
pop eax
pop ebx
mul ebx
push eax
mov eax, [draw_z@char@x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [draw_z@char@fontAddr+eax]
push ebx
mov eax, 0
push eax
pop ebx
pop eax
cmp eax, ebx
jne neq#r21@true
mov eax, 0
jmp neq#r21@false
neq#r21@true:
mov eax, 1
neq#r21@false:
push eax
pop eax
cmp eax, 0
je draw_z@char@while#r7@while#r9@if#r11@$else
mov eax, 15
push eax
pop eax
mov [draw_z@char@while#r7@while#r9@color], eax
jmp draw_z@char@while#r7@while#r9@if#r11@$end
draw_z@char@while#r7@while#r9@if#r11@$else:
mov eax, 0
push eax
pop eax
mov [draw_z@char@while#r7@while#r9@color], eax
draw_z@char@while#r7@while#r9@if#r11@$end:
;========== draw_z@char@while#r7@while#r9@if#r11@$end ==========

mov eax, [draw_z@char@left]
push eax
mov eax, [draw_z@char@x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [draw_z@char@top]
push eax
mov eax, [draw_z@char@y]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [draw_z@char@while#r7@while#r9@color]
push eax
mov eax, 320
push eax
mov eax, [draw_z@char@addrVram]
push eax
call draw_z_pixel

mov eax, [draw_z@char@x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@char@x], eax
jmp draw_z@char@while#r7@while#r9@$start
draw_z@char@while#r7@while#r9@$end:
;========== draw_z@char@while#r7@while#r9@$end ==========

mov eax, [draw_z@char@y]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@char@y], eax
jmp draw_z@char@while#r7@$start
draw_z@char@while#r7@$end:
;========== draw_z@char@while#r7@$end ==========

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

;########## draw_z@string@while#r31@$start ##########
draw_z@string@while#r31@$start:
mov eax, [draw_z@string@i]
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [draw_z@string@strAddr+eax]
push ebx
mov eax, 0
push eax
pop ebx
pop eax
cmp eax, ebx
jne neq#r41@true
mov eax, 0
jmp neq#r41@false
neq#r41@true:
mov eax, 1
neq#r41@false:
push eax
pop eax
cmp eax, 0
je draw_z@string@while#r31@$end
mov eax, [draw_z@string@left]
push eax
mov eax, [draw_z@string@i]
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
mov eax, [draw_z@string@top]
push eax
mov eax, 1
push eax
mov eax, 2
push eax
mov eax, [draw_z@string@i]
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [draw_z@string@strAddr+eax]
push ebx
mov eax, [draw_z@string@screenWidth]
push eax
mov eax, [draw_z@string@addrVram]
push eax
call draw_z@char

mov eax, [draw_z@string@i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [draw_z@string@i], eax
jmp draw_z@string@while#r31@$start
draw_z@string@while#r31@$end:
;========== draw_z@string@while#r31@$end ==========

ret
draw_z@string$pass:
;============[fun end]string=============


