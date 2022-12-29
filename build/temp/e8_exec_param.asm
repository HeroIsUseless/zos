mov eax, 1
push eax
jmp e8_exec_param_asm_a$next
e8_exec_param_asm_a: dd 0
e8_exec_param_asm_a$next:
pop eax
mov [e8_exec_param_asm_a], eax
mov eax, [e8_exec_param_asm_a]
push eax
mov eax, 12
push eax
call memory_z_set_8bit
#############新映射器效果############
mov eax, 1
push eax
jmp e8_exec_param_z@a$pass
e8_exec_param_z@a: dd 0
e8_exec_param_z@a$pass:
pop eax
mov [e8_exec_param_z@a], eax

mov eax, 12
push eax

