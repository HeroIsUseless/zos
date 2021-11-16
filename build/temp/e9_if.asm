mov eax, 1
push eax
e9_if_z@if$1:
pop eax
cmp eax, 0
je e9_if_z@if@else$1
e9_if_z@if@then$1:
jmp e9_if_z@if@end$1
e9_if_z@if@else$1:
e9_if_z@if@end$1:
