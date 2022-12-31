jmp e13_arr_z@a$pass
e13_arr_z@a: dd 0
1, 2, 3, 4, 5, 6, 
e13_arr_z@a$pass:
mov eax, e13_arr_z@a
mov eax, [e13_arr_z@a+4]

mov eax, 1
push eax
mov eax, 2
push eax
;zws 2942
pop edx
pop eax
mov ebx, 4
mul ebx
mov [e13_arr_z@a+eax], edx

mov eax, 0
push eax
jmp e13_arr_z@c$pass
e13_arr_z@c: dd 0
e13_arr_z@c$pass:
pop eax
mov [e13_arr_z@c], eax

mov eax, 1
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [mem_z_d+eax]
push ebx
pop eax
mov [e13_arr_z@c], eax

