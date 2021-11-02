jmp e5_param_z_a_next
e5_param_z_a: db 2
e5_param_z_a_next:
pop eax
mov eax, 2
mov [a], eax
