
;function
jmp e5_param_asm_fun$next
e5_param_asm_fun:
;param
jmp e5_param_asm_fun_a$next
e5_param_asm_fun_a: dd 0
e5_param_asm_fun_a$next:
;param
jmp e5_param_asm_fun_b$next
e5_param_asm_fun_b: dd 0
e5_param_asm_fun_b$next:
pop ebp
pop eax
mov [e5_param_asm_fun_b], eax
pop eax
mov [e5_param_asm_fun_a], eax
push ebp
ret
e5_param_asm_fun$next:
;#############新映射器效果############

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


