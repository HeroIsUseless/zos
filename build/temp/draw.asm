jmp draw_z_pixel$next
draw_z_pixel:
jmp draw_z_pixel_vramAddr$next
draw_z_pixel_vramAddr: db 0
draw_z_pixel_vramAddr$next:
jmp draw_z_pixel_screenWidth$next
draw_z_pixel_screenWidth: db 0
draw_z_pixel_screenWidth$next:
jmp draw_z_pixel_color$next
draw_z_pixel_color: db 0
draw_z_pixel_color$next:
jmp draw_z_pixel_y$next
draw_z_pixel_y: db 0
draw_z_pixel_y$next:
jmp draw_z_pixel_x$next
draw_z_pixel_x: db 0
draw_z_pixel_x$next:
pop ebp
pop eax
mov [draw_z_pixel_x], eax
pop eax
mov [draw_z_pixel_y], eax
pop eax
mov [draw_z_pixel_color], eax
pop eax
mov [draw_z_pixel_screenWidth], eax
pop eax
mov [draw_z_pixel_vramAddr], eax
push ebp
mov eax, [draw_z_pixel_x]
push eax
mov eax, [draw_z_pixel_y]
push eax
mov eax, [draw_z_pixel_screenWidth]
push eax
pop eax
pop ebx
mul ebx
push eax
pop eax
pop ebx
add eax, ebx
push eax
mov eax, [draw_z_pixel_vramAddr]
push eax
pop eax
pop ebx
add eax, ebx
push eax
jmp draw_z_pixel_addr$next
draw_z_pixel_addr: db 0
draw_z_pixel_addr$next:
pop eax
mov [draw_z_pixel_addr], eax
mov eax, [draw_z_pixel_color]
push eax
mov eax, [draw_z_pixel_addr]
push eax
call memory_z_set_1byte
ret
draw_z_pixel$next:
