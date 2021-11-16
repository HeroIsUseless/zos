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
