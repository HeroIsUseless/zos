[bits 32]
ORG 0x280000
jmp main

; 读写内存
; kernel.z/setMem.1byte(val:int, addr:int)
kernel_z_setMem_1byte:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], al
ret

; kernel.z/setMem.2byte(val:int, addr:int)
kernel_z_setMem_2byte:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], ax
ret

; kernel.z/setMem.4byte(val:int, addr:int)
kernel_z_setMem_4byte:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], eax
ret

main:
  hlt 
  jmp main
jmp memory_z@set_1byte$next
memory_z@set_1byte:
jmp memory_z@set_1byte@val$next
memory_z@set_1byte@val: db 0
memory_z@set_1byte@val$next:
jmp memory_z@set_1byte@addr$next
memory_z@set_1byte@addr: db 0
memory_z@set_1byte@addr$next:
pop ebp
pop eax
mov [memory_z@set_1byte@val], eax
pop eax
mov [memory_z@set_1byte@addr], eax
mov eax, [memory_z@set_1byte@val]
push eax
mov eax, [memory_z@set_1byte@addr]
push eax
call kernel_z_setMem_1byte
push ebp
ret
set_1byte$next:
