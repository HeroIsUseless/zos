jmp e14_str_z_a$pass
e14_str_z_a: dd 0 "ABCD"\
e14_str_z_a$pass:
mov eax, e14_str_z_a+4
mov [e14_str_z_a], eax


