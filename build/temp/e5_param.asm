jmp e5_param_z_a_next
e5_param_z_a: db 0
e5_param_z_a_next:
pop eax
mov [a], eax
jmp e5_param_z_fun_next
e5_param_z_fun:
pop ebp
push ebp
ret
e5_param_z_fun_next:
