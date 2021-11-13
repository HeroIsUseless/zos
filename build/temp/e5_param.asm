jmp e5_param_z@a$next
e5_param_z@a: db 0
e5_param_z@a$next:
pop eax
mov [e5_param_z@a], eax
jmp e5_param_z@b$next
e5_param_z@b: db 0
e5_param_z@b$next:
pop eax
mov [e5_param_z@b], eax
jmp e5_param_z@fun$next
e5_param_z@fun:
pop ebp
push ebp
ret
e5_param_z@fun$next:
