[bits 32]
ORG 0x280000
jmp main

main:
  hlt 
  jmp main
