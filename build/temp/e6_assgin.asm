jmp e6_assgin_z@a$next
e6_assgin_z@a: db 1234
e6_assgin_z@a$next:
mov eax, 5678
push eax
pop eax
mov [e6_assgin_z@a], eax
