
;############[fun begin]fun############
jmp e5_param_z_fun$pass
e5_param_z_fun:
pop ebp
;param: b
jmp e5_param_z_fun_b$pass
e5_param_z_fun_b: dd 0
e5_param_z_fun_b$pass:
pop eax
mov [e5_param_z_fun_b], eax
;param: a
jmp e5_param_z_fun_a$pass
e5_param_z_fun_a: dd 0
e5_param_z_fun_a$pass:
pop eax
mov [e5_param_z_fun_a], eax
push ebp
ret
e5_param_z_fun$pass:
;============[fun end]fun=============


