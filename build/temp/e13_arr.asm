jmp e13_arr_z_a$pass
e13_arr_z_a: dd 0\
1, 2, 3, 4, 5, 6, 
e13_arr_z_a$pass:
mov eax, e13_arr_z_a
mov eax, [e13_arr_z_a+4]

mov eax, 2
push eax
jmp e13_arr_z_e_f$pass
e13_arr_z_e_f: dd 0
e13_arr_z_e_f$pass:
pop eax
mov [e13_arr_z_e_f], eax

jmp e13_arr_z_b_c$pass
e13_arr_z_b_c: dd 0\
1, 2, 3, 4, 5, 6, 
e13_arr_z_b_c$pass:
mov eax, e13_arr_z_b_c
mov eax, [e13_arr_z_b_c+4]

mov eax, 1
push eax
mov eax, 2
push eax
;zws 2942
pop edx
pop eax
mov ebx, 4
mul ebx
mov [e13_arr_z_a+eax], edx

mov eax, 1
push eax
mov eax, 2
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, 2
push eax
;zws 2942
pop edx
pop eax
mov ebx, 4
mul ebx
mov [e13_arr_z_a+eax], edx

mov eax, 0
push eax
jmp e13_arr_z_c$pass
e13_arr_z_c: dd 0
e13_arr_z_c$pass:
pop eax
mov [e13_arr_z_c], eax

mov eax, 1
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [mem_z_d+eax]
push ebx
pop eax
mov [e13_arr_z_c], eax

