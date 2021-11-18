jmp test_z_draw$next
test_z_draw:
jmp test_z_draw_addrVram$next
test_z_draw_addrVram: db 0
test_z_draw_addrVram$next:
pop ebp
pop eax
mov [test_z_draw_addrVram], eax
push ebp
mov eax, 10
push eax
mov eax, 10
push eax
mov eax, 5
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
ret
test_z_draw$next:
