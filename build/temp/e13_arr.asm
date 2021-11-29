jmp e13_arr_z_a$next
e13_arr_z_a: db \
1,2,3,4,5,6,
e13_arr_z_a$next:
mov eax, 1
push eax
jmp e13_arr_z_b$next
e13_arr_z_b: dd 0
e13_arr_z_b$next:
pop eax
mov [e13_arr_z_b], eax
mov eax, [e13_arr_z_b]
push eax
jmp e13_arr_z_c$next
e13_arr_z_c: dd 0
e13_arr_z_c$next:
pop eax
mov [e13_arr_z_c], eax
mov eax, [e13_arr_z_c]
push eax
mov eax, 2
push eax
