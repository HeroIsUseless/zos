jmp e5_param_z_fun$next
e5_param_z_fun:
jmp e5_param_z_fun_a$next
e5_param_z_fun_a: dd 0
e5_param_z_fun_a$next:
jmp e5_param_z_fun_b$next
e5_param_z_fun_b: dd 0
e5_param_z_fun_b$next:
pop ebp
pop eax
mov [e5_param_z_fun_b], eax
pop eax
mov [e5_param_z_fun_a], eax
push ebp
ret
e5_param_z_fun$next:
