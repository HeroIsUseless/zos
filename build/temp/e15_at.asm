jmp e15_at_z@str$pass
e15_at_z@str: dd 0 "ABCD"
e15_at_z@str$pass:
mov eax, e15_at_z@str+4
mov [e15_at_z@str], eax


;############[fun begin]func############
jmp e15_at_z@func$pass
e15_at_z@func:
pop ebp
;param: strAddr
jmp e15_at_z@func@strAddr$pass
e15_at_z@func@strAddr: dd 0
e15_at_z@func@strAddr$pass:
pop eax
mov [e15_at_z@func@strAddr], eax
push ebp
mov eax, 0
push eax
jmp e15_at_z@func@a$pass
e15_at_z@func@a: dd 0
e15_at_z@func@a$pass:
pop eax
mov [e15_at_z@func@a], eax

mov eax, 1
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [e15_at_z@func@strAddr+eax]
push ebx
pop eax
mov [e15_at_z@func@a], eax
mov eax, [e15_at_z@func@strAddr]
push eax
pop eax
mov [e15_at_z@func@a], eax
ret
e15_at_z@func$pass:
;============[fun end]func=============

mov eax, [e15_at_z@str]
push eax
call e15_at_z@func


