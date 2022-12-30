jmp e15_at_z@str$pass
e15_at_z@str: dd "ABCD"
e15_at_z@str$pass:

;############[fun begin]func############
jmp e15_at_z@func$pass
e15_at_z@func:
pop ebp
;param: strAddr
e15_at_z@func@strAddr$pass
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
mov ebx, 4
pop eax
mul ebx
mov ebx, eax
mov eax, [e15_at_z@func@strAddr]
add eax, ebx
mov ebx, [eax]
push eax
pop eax
mov [e15_at_z@func@a], eax
mov eax, 1
push eax
mov eax, 123
push eax
pop eax
pop ebx
mov [e15_at_z@func@strAddr+ebx], eax
ret
e15_at_z@func$pass:
;============[fun end]func=============

mov eax, [e15_at_z@str]
push eax
call e15_at_z@func


