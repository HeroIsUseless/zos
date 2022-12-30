
;############[fun begin]set.1byte############
jmp memory_z@set.1byte$pass
memory_z@set.1byte:
pop ebp
;param: addr
memory_z@set.1byte@addr$pass
memory_z@set.1byte@addr: dd 0
memory_z@set.1byte@addr$pass:
pop eax
mv [memory_z@set.1byte@addr], eax
;param: val
memory_z@set.1byte@val$pass
memory_z@set.1byte@val: dd 0
memory_z@set.1byte@val$pass:
pop eax
mv [memory_z@set.1byte@val], eax
push ebp
mov eax, [memory_z@set.1byte@val]
push eax
mov eax, [memory_z@set.1byte@addr]
push eax
call kernel_z_setMem_1byte

ret
memory_z@set.1byte$pass:
;============[fun end]set.1byte=============


;############[fun begin]set.2byte############
jmp memory_z@set.2byte$pass
memory_z@set.2byte:
pop ebp
;param: addr
memory_z@set.2byte@addr$pass
memory_z@set.2byte@addr: dd 0
memory_z@set.2byte@addr$pass:
pop eax
mv [memory_z@set.2byte@addr], eax
;param: val
memory_z@set.2byte@val$pass
memory_z@set.2byte@val: dd 0
memory_z@set.2byte@val$pass:
pop eax
mv [memory_z@set.2byte@val], eax
push ebp
mov eax, [memory_z@set.2byte@val]
push eax
mov eax, [memory_z@set.2byte@addr]
push eax
call kernel_z_setMem_2byte

ret
memory_z@set.2byte$pass:
;============[fun end]set.2byte=============


;############[fun begin]set.4byte############
jmp memory_z@set.4byte$pass
memory_z@set.4byte:
pop ebp
;param: addr
memory_z@set.4byte@addr$pass
memory_z@set.4byte@addr: dd 0
memory_z@set.4byte@addr$pass:
pop eax
mv [memory_z@set.4byte@addr], eax
;param: val
memory_z@set.4byte@val$pass
memory_z@set.4byte@val: dd 0
memory_z@set.4byte@val$pass:
pop eax
mv [memory_z@set.4byte@val], eax
push ebp
mov eax, [memory_z@set.4byte@val]
push eax
mov eax, [memory_z@set.4byte@addr]
push eax
call kernel_z_setMem_4byte

ret
memory_z@set.4byte$pass:
;============[fun end]set.4byte=============


