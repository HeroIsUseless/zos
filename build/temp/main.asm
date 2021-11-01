[bits 32]
ORG 0x280000
jmp main

main:
  hlt 
  jmp main

jmp e1_var_z_a_next
e1_var_z_a: db 9527
e1_var_z_a_next:
jmp e1_var_z_b_next
e1_var_z_b: db 1234
e1_var_z_b_next:
jmp e2_var_z_c_next
e2_var_z_c: db 9527
e2_var_z_c_next:
jmp e2_var_z_d_next
e2_var_z_d: db 1234
e2_var_z_d_next:
