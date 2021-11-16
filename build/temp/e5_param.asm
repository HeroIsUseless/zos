jmp e5_param_z@fun$next
e5_param_z@fun:
jmp e5_param_z@fun@a$next
e5_param_z@fun@a: db 0
e5_param_z@fun@a$next:
jmp e5_param_z@fun@b$next
e5_param_z@fun@b: db 0
e5_param_z@fun@b$next:
pop ebp
pop eax
mov [e5_param_z@fun@a], eax
pop eax
mov [e5_param_z@fun@b], eax
push ebp
ret
e5_param_z@fun$next:
