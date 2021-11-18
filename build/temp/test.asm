jmp test_z_draw$next
test_z_draw:
jmp test_z_draw_addrVram$next
test_z_draw_addrVram: dd 0
test_z_draw_addrVram$next:
pop ebp
pop eax
mov [test_z_draw_addrVram], eax
push ebp
mov eax, 0
push eax
mov eax, 0
push eax
mov eax, 0
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 1
push eax
mov eax, 1
push eax
mov eax, 1
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 2
push eax
mov eax, 2
push eax
mov eax, 2
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 3
push eax
mov eax, 3
push eax
mov eax, 3
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 4
push eax
mov eax, 4
push eax
mov eax, 4
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 5
push eax
mov eax, 5
push eax
mov eax, 5
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 6
push eax
mov eax, 6
push eax
mov eax, 6
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 7
push eax
mov eax, 7
push eax
mov eax, 7
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 8
push eax
mov eax, 8
push eax
mov eax, 8
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 9
push eax
mov eax, 9
push eax
mov eax, 9
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 10
push eax
mov eax, 10
push eax
mov eax, 10
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 11
push eax
mov eax, 11
push eax
mov eax, 11
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 12
push eax
mov eax, 12
push eax
mov eax, 12
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 13
push eax
mov eax, 13
push eax
mov eax, 13
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 14
push eax
mov eax, 14
push eax
mov eax, 14
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
mov eax, 15
push eax
mov eax, 15
push eax
mov eax, 15
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_addrVram]
push eax
call draw_z_pixel
ret
test_z_draw$next:
