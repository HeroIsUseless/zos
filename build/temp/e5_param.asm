jmp e5_param_z_fun$next
e5_param_z_fun:
jmp e5_param_z_fun_b$next
e5_param_z_fun_b: db 0
e5_param_z_fun_b$next:
jmp e5_param_z_fun_a$next
e5_param_z_fun_a: db 0
e5_param_z_fun_a$next:
pop ebp
pop eax
mov [e5_param_z_fun_a], eax
pop eax
mov [e5_param_z_fun_b], eax
push ebp
ret
e5_param_z_fun$next:
