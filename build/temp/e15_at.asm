jmp e15_at_z_str$next
e15_at_z_str: dd \
65, 66, 67, 68, 0
e15_at_z_str$next:

;function
jmp e15_at_z_func$next
e15_at_z_func:
;param
jmp e15_at_z_func_strAddr$next
e15_at_z_func_strAddr: dd 0
e15_at_z_func_strAddr$next:
pop ebp
pop eax
mov [e15_at_z_func_strAddr], eax
push ebp
mov eax, 0
push eax
pop eax
mov [e15_at_z_func_strAddr], eax
ret
e15_at_z_func$next:
mov eax, e15_at_z_str
push eax
call e15_at_z_func
