jmp e5_param_z@fun$next
e5_param_z@fun:
pop ebp
jmp e5_param_z@fun@a$next
e5_param_z@fun@a: db 0
e5_param_z@fun@a$next:
pop eax
mov [e5_param_z@fun@a], eax
jmp e5_param_z@fun@b$next
e5_param_z@fun@b: db 0
e5_param_z@fun@b$next:
pop eax
mov [e5_param_z@fun@b], eax
push ebp
ret
e5_param_z@fun$next:
