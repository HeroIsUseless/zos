
;############[fun begin]set_1byte############
jmp memory_z@set_1byte$pass
memory_z@set_1byte:
pop ebp
;param: addr
jmp memory_z@set_1byte@addr$pass
memory_z@set_1byte@addr: dd 0
memory_z@set_1byte@addr$pass:
pop eax
mov [memory_z@set_1byte@addr], eax
;param: val
jmp memory_z@set_1byte@val$pass
memory_z@set_1byte@val: dd 0
memory_z@set_1byte@val$pass:
pop eax
mov [memory_z@set_1byte@val], eax
push ebp
mov eax, [memory_z@set_1byte@val]
push eax
mov eax, [memory_z@set_1byte@addr]
push eax
call kernel_z_setMem_1byte

ret
memory_z@set_1byte$pass:
;============[fun end]set_1byte=============


;############[fun begin]set_2byte############
jmp memory_z@set_2byte$pass
memory_z@set_2byte:
pop ebp
;param: addr
jmp memory_z@set_2byte@addr$pass
memory_z@set_2byte@addr: dd 0
memory_z@set_2byte@addr$pass:
pop eax
mov [memory_z@set_2byte@addr], eax
;param: val
jmp memory_z@set_2byte@val$pass
memory_z@set_2byte@val: dd 0
memory_z@set_2byte@val$pass:
pop eax
mov [memory_z@set_2byte@val], eax
push ebp
mov eax, [memory_z@set_2byte@val]
push eax
mov eax, [memory_z@set_2byte@addr]
push eax
call kernel_z_setMem_2byte

ret
memory_z@set_2byte$pass:
;============[fun end]set_2byte=============


;############[fun begin]set_4byte############
jmp memory_z@set_4byte$pass
memory_z@set_4byte:
pop ebp
;param: addr
jmp memory_z@set_4byte@addr$pass
memory_z@set_4byte@addr: dd 0
memory_z@set_4byte@addr$pass:
pop eax
mov [memory_z@set_4byte@addr], eax
;param: val
jmp memory_z@set_4byte@val$pass
memory_z@set_4byte@val: dd 0
memory_z@set_4byte@val$pass:
pop eax
mov [memory_z@set_4byte@val], eax
push ebp
mov eax, [memory_z@set_4byte@val]
push eax
mov eax, [memory_z@set_4byte@addr]
push eax
call kernel_z_setMem_4byte

ret
memory_z@set_4byte$pass:
;============[fun end]set_4byte=============


