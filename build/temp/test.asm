
;############[fun begin]rect############
jmp test_z@rect$pass
test_z@rect:
pop ebp
;param: addrVram
jmp test_z@rect@addrVram$pass
test_z@rect@addrVram: dd 0
test_z@rect@addrVram$pass:
pop eax
mov [test_z@rect@addrVram], eax
;param: top
jmp test_z@rect@top$pass
test_z@rect@top: dd 0
test_z@rect@top$pass:
pop eax
mov [test_z@rect@top], eax
;param: left
jmp test_z@rect@left$pass
test_z@rect@left: dd 0
test_z@rect@left$pass:
pop eax
mov [test_z@rect@left], eax
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

;########## test_z@rect@while#r1@$start ##########
test_z@rect@while#r1@$start:
mov eax, [test_z@rect@y]
push eax
mov eax, 8
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
je test_z@rect@while#r1@$end
;########## test_z@rect@while#r1@while#r3@$start ##########
test_z@rect@while#r1@while#r3@$start:
mov eax, [test_z@rect@x]
push eax
mov eax, 8
push eax
pop ebx
pop eax
cmp eax, ebx
jbe leq#r4@true
mov eax, 0
jmp leq#r4@false
leq#r4@true:
mov eax, 1
leq#r4@false:
push eax
pop eax
cmp eax, 0
je test_z@rect@while#r1@while#r3@$end
mov eax, 3
push eax
jmp test_z@rect@while#r1@while#r3@color$pass
test_z@rect@while#r1@while#r3@color: dd 0
test_z@rect@while#r1@while#r3@color$pass:
pop eax
mov [test_z@rect@while#r1@while#r3@color], eax

mov eax, [test_z@rect@left]
push eax
mov eax, [test_z@rect@x]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [test_z@rect@top]
push eax
mov eax, [test_z@rect@y]
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [test_z@rect@while#r1@while#r3@color]
push eax
mov eax, 320
push eax
mov eax, [test_z@rect@addrVram]
push eax
call draw_z_pixel

mov eax, [test_z@rect@x]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z@rect@x], eax
jmp test_z@rect@while#r1@while#r3@$start
test_z@rect@while#r1@while#r3@$end:
;========== test_z@rect@while#r1@while#r3@$end ==========

mov eax, [test_z@rect@y]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z@rect@y], eax
jmp test_z@rect@while#r1@$start
test_z@rect@while#r1@$end:
;========== test_z@rect@while#r1@$end ==========

ret
test_z@rect$pass:
;============[fun end]rect=============


;############[fun begin]block############
jmp test_z@block$pass
test_z@block:
pop ebp
;param: addrVram
jmp test_z@block@addrVram$pass
test_z@block@addrVram: dd 0
test_z@block@addrVram$pass:
pop eax
mov [test_z@block@addrVram], eax
push ebp
mov eax, 0
push eax
jmp test_z@block@i$pass
test_z@block@i: dd 0
test_z@block@i$pass:
pop eax
mov [test_z@block@i], eax

;########## test_z@block@while#r5@$start ##########
test_z@block@while#r5@$start:
mov eax, [test_z@block@i]
push eax
mov eax, 300
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
je test_z@block@while#r5@$end
mov eax, [test_z@block@i]
push eax
mov eax, [test_z@block@i]
push eax
mov eax, [test_z@block@i]
push eax
mov eax, 320
push eax
mov eax, [test_z@block@addrVram]
push eax
call draw_z_pixel

mov eax, [test_z@block@i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [test_z@block@i], eax
jmp test_z@block@while#r5@$start
test_z@block@while#r5@$end:
;========== test_z@block@while#r5@$end ==========

ret
test_z@block$pass:
;============[fun end]block=============


;############[fun begin]draw############
jmp test_z@draw$pass
test_z@draw:
pop ebp
;param: addrVram
jmp test_z@draw@addrVram$pass
test_z@draw@addrVram: dd 0
test_z@draw@addrVram$pass:
pop eax
mov [test_z@draw@addrVram], eax
push ebp
mov eax, [test_z@draw@addrVram]
push eax
call test_z@block

jmp test_z@draw@tstr$pass
test_z@draw@tstr: dd 0 "HELLO WORLD"
test_z@draw@tstr$pass:
mov eax, test_z@draw@tstr+4
mov [test_z@draw@tstr], eax

ret
test_z@draw$pass:
;============[fun end]draw=============


