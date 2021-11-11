[bits 32]
ORG 0x280000
jmp main

; 读写内存
; kernel.z/set1byteMem(val:int, addr:int)
kernel_z_set1byteMem:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], al
ret

; kernel.z/set2byteMem(val:int, addr:int)
kernel_z_set2byteMem:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], ax
ret

; kernel.z/set4byteMem(val:int, addr:int)
kernel_z_set4byteMem:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], eax
ret

main:
  hlt 
  jmp main
jmp e1_var_z@a$next
e1_var_z@a: db 1
e1_var_z@a$next:
jmp e1_var_z@b$next
e1_var_z@b: db 2
e1_var_z@b$next:
jmp e2_var_z@c$next
e2_var_z@c: db 3
e2_var_z@c$next:
jmp e2_var_z@d$next
e2_var_z@d: db 4
e2_var_z@d$next:
