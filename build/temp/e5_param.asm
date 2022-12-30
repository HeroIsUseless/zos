
;############[fun begin]fun############
jmp e5_param_z@fun$pass
e5_param_z@fun:
pop ebp
;param: b
jmp e5_param_z@fun@b$pass
e5_param_z@fun@b: dd 0
e5_param_z@fun@b$pass:
pop eax
mov [e5_param_z@fun@b], eax
;param: a
jmp e5_param_z@fun@a$pass
e5_param_z@fun@a: dd 0
e5_param_z@fun@a$pass:
pop eax
mov [e5_param_z@fun@a], eax
push ebp
ret
e5_param_z@fun$pass:
;============[fun end]fun=============


