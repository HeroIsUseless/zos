
;############[fun begin]set_1byte############
jmp memory_z_set_1byte$pass
memory_z_set_1byte:
pop ebp
;param: addr
jmp memory_z_set_1byte_addr$pass
memory_z_set_1byte_addr: dd 0
memory_z_set_1byte_addr$pass:
pop eax
mov [memory_z_set_1byte_addr], eax
;param: val
jmp memory_z_set_1byte_val$pass
memory_z_set_1byte_val: dd 0
memory_z_set_1byte_val$pass:
pop eax
mov [memory_z_set_1byte_val], eax
push ebp
mov eax, [memory_z_set_1byte_val]
push eax
mov eax, [memory_z_set_1byte_addr]
push eax
call kernel_z_setMem_1byte

ret
memory_z_set_1byte$pass:
;============[fun end]set_1byte=============


;############[fun begin]set_2byte############
jmp memory_z_set_2byte$pass
memory_z_set_2byte:
pop ebp
;param: addr
jmp memory_z_set_2byte_addr$pass
memory_z_set_2byte_addr: dd 0
memory_z_set_2byte_addr$pass:
pop eax
mov [memory_z_set_2byte_addr], eax
;param: val
jmp memory_z_set_2byte_val$pass
memory_z_set_2byte_val: dd 0
memory_z_set_2byte_val$pass:
pop eax
mov [memory_z_set_2byte_val], eax
push ebp
mov eax, [memory_z_set_2byte_val]
push eax
mov eax, [memory_z_set_2byte_addr]
push eax
call kernel_z_setMem_2byte

ret
memory_z_set_2byte$pass:
;============[fun end]set_2byte=============


;############[fun begin]set_4byte############
jmp memory_z_set_4byte$pass
memory_z_set_4byte:
pop ebp
;param: addr
jmp memory_z_set_4byte_addr$pass
memory_z_set_4byte_addr: dd 0
memory_z_set_4byte_addr$pass:
pop eax
mov [memory_z_set_4byte_addr], eax
;param: val
jmp memory_z_set_4byte_val$pass
memory_z_set_4byte_val: dd 0
memory_z_set_4byte_val$pass:
pop eax
mov [memory_z_set_4byte_val], eax
push ebp
mov eax, [memory_z_set_4byte_val]
push eax
mov eax, [memory_z_set_4byte_addr]
push eax
call kernel_z_setMem_4byte

ret
memory_z_set_4byte$pass:
;============[fun end]set_4byte=============


