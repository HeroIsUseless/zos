
;function
jmp memory_z_set_1byte$next
memory_z_set_1byte:
;param
jmp memory_z_set_1byte_val$next
memory_z_set_1byte_val: dd 0
memory_z_set_1byte_val$next:
;param
jmp memory_z_set_1byte_addr$next
memory_z_set_1byte_addr: dd 0
memory_z_set_1byte_addr$next:
pop ebp
pop eax
mov [memory_z_set_1byte_addr], eax
pop eax
mov [memory_z_set_1byte_val], eax
push ebp
mov eax, [memory_z_set_1byte_val]
push eax
mov eax, [memory_z_set_1byte_addr]
push eax
call kernel_z_setMem_1byte
ret
memory_z_set_1byte$next:

;function
jmp memory_z_set_2byte$next
memory_z_set_2byte:
;param
jmp memory_z_set_2byte_val$next
memory_z_set_2byte_val: dd 0
memory_z_set_2byte_val$next:
;param
jmp memory_z_set_2byte_addr$next
memory_z_set_2byte_addr: dd 0
memory_z_set_2byte_addr$next:
pop ebp
pop eax
mov [memory_z_set_2byte_addr], eax
pop eax
mov [memory_z_set_2byte_val], eax
push ebp
mov eax, [memory_z_set_2byte_val]
push eax
mov eax, [memory_z_set_2byte_addr]
push eax
call kernel_z_setMem_2byte
ret
memory_z_set_2byte$next:

;function
jmp memory_z_set_4byte$next
memory_z_set_4byte:
;param
jmp memory_z_set_4byte_val$next
memory_z_set_4byte_val: dd 0
memory_z_set_4byte_val$next:
;param
jmp memory_z_set_4byte_addr$next
memory_z_set_4byte_addr: dd 0
memory_z_set_4byte_addr$next:
pop ebp
pop eax
mov [memory_z_set_4byte_addr], eax
pop eax
mov [memory_z_set_4byte_val], eax
push ebp
mov eax, [memory_z_set_4byte_val]
push eax
mov eax, [memory_z_set_4byte_addr]
push eax
call kernel_z_setMem_4byte
ret
memory_z_set_4byte$next:
