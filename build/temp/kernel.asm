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
jmp e1_var_za_next
e1_var_za: db 1
e1_var_za_next:
jmp e1_var_zb_next
e1_var_zb: db 2
e1_var_zb_next:
jmp e2_var_zc_next
e2_var_zc: db 3
e2_var_zc_next:
jmp e2_var_zd_next
e2_var_zd: db 4
e2_var_zd_next:
