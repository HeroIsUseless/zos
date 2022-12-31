jmp e14_str_z@a$pass
e14_str_z@a: dd 0 "ABCD"
e14_str_z@a$pass:
mov eax, e14_str_z@a+4
mov [e14_str_z@a], eax


