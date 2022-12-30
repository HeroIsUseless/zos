
;############[fun begin]fun############
jmp e5_param_z@fun$pass
e5_param_z@fun:
pop ebp
;param: b
e5_param_z@fun@b$pass
e5_param_z@fun@b: dd 0
e5_param_z@fun@b$pass:
pop eax
mv [e5_param_z@fun@b], eax
;param: a
e5_param_z@fun@a$pass
e5_param_z@fun@a: dd 0
e5_param_z@fun@a$pass:
pop eax
mv [e5_param_z@fun@a], eax
push ebp
ret
e5_param_z@fun$pass:
;============[fun end]fun=============


