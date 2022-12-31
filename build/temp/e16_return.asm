
;############[fun begin]func############
jmp e15_return_z@func$pass
e15_return_z@func:
pop ebp
push ebp
mov eax, 0
push eax
jmp e15_return_z@func@a$pass
e15_return_z@func@a: dd 0
e15_return_z@func@a$pass:
pop eax
mov [e15_return_z@func@a], eax

mov eax, [e15_return_z@func@a]
push eax
pop eax
pop ebp
push eax
push ebp
ret
mov eax, 1
push eax
jmp e15_return_z@func@b$pass
e15_return_z@func@b: dd 0
e15_return_z@func@b$pass:
pop eax
mov [e15_return_z@func@b], eax

ret
e15_return_z@func$pass:
;============[fun end]func=============

call e15_return_z@func

jmp e15_return_z@b$pass
e15_return_z@b: dd 0
e15_return_z@b$pass:
pop eax
mov [e15_return_z@b], eax


