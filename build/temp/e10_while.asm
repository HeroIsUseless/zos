e10_while_z@while$1:
mov eax, 1
push eax
pop eax
cmp eax, 0
je e10_while_z@while@end$1
jmp e10_while_z@while$1
e10_while_z@while@end$1:
