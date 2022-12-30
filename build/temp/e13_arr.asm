jmp e13_arr_asm_a$next
e13_arr_asm_a: dd \
1,2,3,4,5,6,
e13_arr_asm_a$next:
mov eax, 1
push eax
mov eax, 2
push eax
pop eax
pop ebx
mov [e13_arr_asm_a+ebx], eax
mov eax, 0
push eax
jmp e13_arr_asm_c$next
e13_arr_asm_c: dd 0
e13_arr_asm_c$next:
pop eax
mov [e13_arr_asm_c], eax
mov eax, 1
push eax
pop eax
mov ebx, 4
mul ebx
mov ebx, [mem_z_d+eax]
push ebx
pop eax
mov [e13_arr_asm_c], eax
;#############新映射器效果############
jmp e13_arr_z@a$pass
e13_arr_z@a: dd 1, 2, 3, 4, 5, 6, 
e13_arr_z@a$pass:
mov eax, 1
push eax
mov eax, 2
push eax
pop eax
pop ebx
mov [e13_arr_z@a+ebx], eax
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
mov ebx, [mem.z\d+eax]
push ebx
pop eax
mov [e13_arr_z@c], eax

