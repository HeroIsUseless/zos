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

;############[fun begin]init############
jmp e13_arr_z@init$pass
e13_arr_z@init:
pop ebp
push ebp
mov eax, 0
push eax
jmp e13_arr_z@init@i$pass
e13_arr_z@init@i: dd 0
e13_arr_z@init@i$pass:
pop eax
mov [e13_arr_z@init@i], eax

;########## e13_arr_z@init@while#r1@$start ##########
e13_arr_z@init@while#r1@$start:
mov eax, [e13_arr_z@init@i]
push eax
mov eax, 8192
push eax
pop ebx
pop eax
cmp eax, ebx
jb les#r2@true
mov eax, 0
jmp les#r2@false
les#r2@true:
mov eax, 1
les#r2@false:
push eax
pop eax
cmp eax, 0
je e13_arr_z@init@while#r1@$end
mov eax, 1
push eax
mov eax, 0
push eax
pop eax
pop ebx
mov [main_z_addr_GDT+ebx], eax
mov eax, [e13_arr_z@init@i]
push eax
mov eax, 1
push eax
pop eax
pop ebx
add eax, ebx
push eax
pop eax
mov [e13_arr_z@init@i], eax
jmp e13_arr_z@init@while#r1@$start
e13_arr_z@init@while#r1@$end:
;========== e13_arr_z@init@while#r1@$end ==========

ret
e13_arr_z@init$pass:
;============[fun end]init=============


