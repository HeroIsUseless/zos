[bits 32]
ORG 0x280000
jmp main

; 读写内存
; kernel.z\setMem.1byte(val:dword, addr:dword)
kernel_z_setMem_1byte:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], al
ret

; kernel.z\setMem.2byte(val:dword, addr:dword)
kernel_z_setMem_2byte:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], ax
ret

; kernel.z\setMem.4byte(val:dword, addr:dword)
kernel_z_setMem_4byte:
  pop ebp
  pop ebx
  pop eax
  push ebp
  mov [ebx], eax
ret

; kernel.z\halt()
kernel_z_halt:
  hlt
ret

main:
  call main_z_run_once
  .loop:
    call main_z_run_loop
  jmp .loop

jmp main_z_run_once$next
main_z_run_once:
pop ebp
push ebp
mov eax, 320
push eax
jmp main_z_run_once_screenWidth$next
main_z_run_once_screenWidth: dd 0
main_z_run_once_screenWidth$next:
pop eax
mov [main_z_run_once_screenWidth], eax
mov eax, 200
push eax
jmp main_z_run_once_screenHeight$next
main_z_run_once_screenHeight: dd 0
main_z_run_once_screenHeight$next:
pop eax
mov [main_z_run_once_screenHeight], eax
mov eax, 0x000a0000
push eax
jmp main_z_run_once_addrVram$next
main_z_run_once_addrVram: dd 0
main_z_run_once_addrVram$next:
pop eax
mov [main_z_run_once_addrVram], eax
mov eax, 0x0024e000
push eax
jmp main_z_run_once_addrPM$next
main_z_run_once_addrPM: dd 0
main_z_run_once_addrPM$next:
pop eax
mov [main_z_run_once_addrPM], eax
mov eax, 0x0026e000
push eax
jmp main_z_run_once_addrPDT$next
main_z_run_once_addrPDT: dd 0
main_z_run_once_addrPDT$next:
pop eax
mov [main_z_run_once_addrPDT], eax
mov eax, 0x0026f800
push eax
jmp main_z_run_once_addrIDT$next
main_z_run_once_addrIDT: dd 0
main_z_run_once_addrIDT$next:
pop eax
mov [main_z_run_once_addrIDT], eax
mov eax, 0x00270000
push eax
jmp main_z_run_once_addrGDT$next
main_z_run_once_addrGDT: dd 0
main_z_run_once_addrGDT$next:
pop eax
mov [main_z_run_once_addrGDT], eax
mov eax, [main_z_run_once_addrVram]
push eax
call test_z_draw
ret
main_z_run_once$next:
jmp main_z_run_loop$next
main_z_run_loop:
pop ebp
push ebp
call kernel_z_halt
ret
main_z_run_loop$next:
jmp memory_z_set_1byte$next
memory_z_set_1byte:
jmp memory_z_set_1byte_val$next
memory_z_set_1byte_val: dd 0
memory_z_set_1byte_val$next:
jmp memory_z_set_1byte_addr$next
memory_z_set_1byte_addr: dd 0
memory_z_set_1byte_addr$next:
pop ebp
pop eax
mov [memory_z_set_1byte_addr], eax
pop eax
mov [memory_z_set_1byte_val], eax
push ebp
mov eax, [memory_z_set_1byte_val]
push eax
mov eax, [memory_z_set_1byte_addr]
push eax
call kernel_z_setMem_1byte
ret
memory_z_set_1byte$next:
jmp memory_z_set_2byte$next
memory_z_set_2byte:
jmp memory_z_set_2byte_val$next
memory_z_set_2byte_val: dd 0
memory_z_set_2byte_val$next:
jmp memory_z_set_2byte_addr$next
memory_z_set_2byte_addr: dd 0
memory_z_set_2byte_addr$next:
jmp memory_z_set_2byte_addr$next
memory_z_set_2byte_addr: dd 0
memory_z_set_2byte_addr$next:
pop ebp
pop eax
mov [memory_z_set_2byte_addr], eax
pop eax
mov [memory_z_set_2byte_addr], eax
pop eax
mov [memory_z_set_2byte_val], eax
push ebp
mov eax, [memory_z_set_2byte_val]
push eax
mov eax, [memory_z_set_2byte_addr]
push eax
call kernel_z_setMem_2byte
ret
memory_z_set_2byte$next:
jmp memory_z_set_4byte$next
memory_z_set_4byte:
jmp memory_z_set_4byte_val$next
memory_z_set_4byte_val: dd 0
memory_z_set_4byte_val$next:
jmp memory_z_set_4byte_addr$next
memory_z_set_4byte_addr: dd 0
memory_z_set_4byte_addr$next:
jmp memory_z_set_4byte_addr$next
memory_z_set_4byte_addr: dd 0
memory_z_set_4byte_addr$next:
jmp memory_z_set_4byte_addr$next
memory_z_set_4byte_addr: dd 0
memory_z_set_4byte_addr$next:
pop ebp
pop eax
mov [memory_z_set_4byte_addr], eax
pop eax
mov [memory_z_set_4byte_addr], eax
pop eax
mov [memory_z_set_4byte_addr], eax
pop eax
mov [memory_z_set_4byte_val], eax
push ebp
mov eax, [memory_z_set_4byte_val]
push eax
mov eax, [memory_z_set_4byte_addr]
push eax
call kernel_z_setMem_4byte
ret
memory_z_set_4byte$next:
jmp draw_z_pixel$next
draw_z_pixel:
jmp draw_z_pixel_x$next
draw_z_pixel_x: dd 0
draw_z_pixel_x$next:
jmp draw_z_pixel_y$next
draw_z_pixel_y: dd 0
draw_z_pixel_y$next:
jmp draw_z_pixel_color$next
draw_z_pixel_color: dd 0
draw_z_pixel_color$next:
jmp draw_z_pixel_screenWidth$next
draw_z_pixel_screenWidth: dd 0
draw_z_pixel_screenWidth$next:
jmp draw_z_pixel_vramAddr$next
draw_z_pixel_vramAddr: dd 0
draw_z_pixel_vramAddr$next:
pop ebp
pop eax
mov [draw_z_pixel_vramAddr], eax
pop eax
mov [draw_z_pixel_screenWidth], eax
pop eax
mov [draw_z_pixel_color], eax
pop eax
mov [draw_z_pixel_y], eax
pop eax
mov [draw_z_pixel_x], eax
push ebp
mov eax, [draw_z_pixel_y]
push eax
mov eax, [draw_z_pixel_screenWidth]
pop ebx
mul ebx
push eax
mov eax, [draw_z_pixel_x]
pop ebx
add eax, ebx
push eax
mov eax, [draw_z_pixel_vramAddr]
pop ebx
add eax, ebx
push eax
jmp draw_z_pixel_addr$next
draw_z_pixel_addr: dd 0
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
jmp draw_z_hLine$next
draw_z_hLine:
jmp draw_z_hLine_bx$next
draw_z_hLine_bx: dd 0
draw_z_hLine_bx$next:
jmp draw_z_hLine_y$next
draw_z_hLine_y: dd 0
draw_z_hLine_y$next:
jmp draw_z_hLine_color$next
draw_z_hLine_color: dd 0
draw_z_hLine_color$next:
jmp draw_z_hLine_screenWidth$next
draw_z_hLine_screenWidth: dd 0
draw_z_hLine_screenWidth$next:
jmp draw_z_hLine_vramAddr$next
draw_z_hLine_vramAddr: dd 0
draw_z_hLine_vramAddr$next:
jmp draw_z_hLine_by$next
draw_z_hLine_by: dd 0
draw_z_hLine_by$next:
jmp draw_z_hLine_ex$next
draw_z_hLine_ex: dd 0
draw_z_hLine_ex$next:
jmp draw_z_hLine_ey$next
draw_z_hLine_ey: dd 0
draw_z_hLine_ey$next:
jmp draw_z_hLine_color$next
draw_z_hLine_color: dd 0
draw_z_hLine_color$next:
jmp draw_z_hLine_screenWidth$next
draw_z_hLine_screenWidth: dd 0
draw_z_hLine_screenWidth$next:
jmp draw_z_hLine_vramAddr$next
draw_z_hLine_vramAddr: dd 0
draw_z_hLine_vramAddr$next:
pop ebp
pop eax
mov [draw_z_hLine_vramAddr], eax
pop eax
mov [draw_z_hLine_screenWidth], eax
pop eax
mov [draw_z_hLine_color], eax
pop eax
mov [draw_z_hLine_ey], eax
pop eax
mov [draw_z_hLine_ex], eax
pop eax
mov [draw_z_hLine_by], eax
pop eax
mov [draw_z_hLine_vramAddr], eax
pop eax
mov [draw_z_hLine_screenWidth], eax
pop eax
mov [draw_z_hLine_color], eax
pop eax
mov [draw_z_hLine_y], eax
pop eax
mov [draw_z_hLine_bx], eax
push ebp
mov eax, [draw_z_hLine_bx]
push eax
jmp draw_z_hLine_i$next
draw_z_hLine_i: dd 0
draw_z_hLine_i$next:
pop eax
mov [draw_z_hLine_i], eax
; while start
draw_z_hLine_while$1_start:
mov eax, [draw_z_hLine_while$1_i]
push eax
mov eax, [draw_z_hLine_while$1_ex]
push eax
pop ebx
pop eax
cmp eax, ebx
jbe draw_z_hLine_while$1_lessequal@true$1
mov eax, 0
jmp draw_z_hLine_while$1_lessequal@false$1
draw_z_hLine_while$1_lessequal@true$1:
mov eax, 1
draw_z_hLine_while$1_lessequal@false$1:
cmp eax, 0
je draw_z_hLine_while$1_end
mov eax, [draw_z_hLine_while$1_i]
push eax
mov eax, [draw_z_hLine_while$1_by]
push eax
mov eax, [draw_z_hLine_while$1_color]
push eax
mov eax, [draw_z_hLine_while$1_screenWidth]
push eax
mov eax, [draw_z_hLine_while$1_vramAddr]
push eax
call draw_z_pixel
mov eax, [draw_z_hLine_while$1_i]
push eax
mov eax, 1
pop ebx
add eax, ebx
mov [ !!! var is not defined !!! i], eax
jmp draw_z_hLine_while$1_start
draw_z_hLine_while$1_end:
;while end
ret
draw_z_hLine$next:
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
; while start
test_z_draw_while$1_start:
mov eax, [test_z_draw_while$1_i]
push eax
mov eax, 16
push eax
pop ebx
pop eax
cmp eax, ebx
jb test_z_draw_while$1_less@true$1
mov eax, 0
jmp test_z_draw_while$1_less@false$1
test_z_draw_while$1_less@true$1:
mov eax, 1
test_z_draw_while$1_less@false$1:
cmp eax, 0
je test_z_draw_while$1_end
mov eax, [test_z_draw_while$1_i]
push eax
mov eax, 0
push eax
mov eax, [test_z_draw_while$1_i]
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_while$1_addrVram]
push eax
call draw_z_pixel
mov eax, [test_z_draw_while$1_i]
push eax
mov eax, 1
pop ebx
add eax, ebx
mov [ !!! var is not defined !!! i], eax
jmp test_z_draw_while$1_start
test_z_draw_while$1_end:
;while end
mov eax, 0
push eax
jmp test_z_draw_x$next
test_z_draw_x: dd 0
test_z_draw_x$next:
pop eax
mov [test_z_draw_x], eax
mov eax, 0
push eax
jmp test_z_draw_y$next
test_z_draw_y: dd 0
test_z_draw_y$next:
pop eax
mov [test_z_draw_y], eax
; while start
test_z_draw_while$2_start:
mov eax, [test_z_draw_while$2_y]
push eax
mov eax, 200
push eax
pop ebx
pop eax
cmp eax, ebx
jbe test_z_draw_while$2_lessequal@true$2
mov eax, 0
jmp test_z_draw_while$2_lessequal@false$2
test_z_draw_while$2_lessequal@true$2:
mov eax, 1
test_z_draw_while$2_lessequal@false$2:
cmp eax, 0
je test_z_draw_while$2_end
; while start
test_z_draw_while$2_while$1_start:
mov eax, [test_z_draw_while$2_while$1_x]
push eax
mov eax, 320
push eax
pop ebx
pop eax
cmp eax, ebx
jbe test_z_draw_while$2_while$1_lessequal@true$3
mov eax, 0
jmp test_z_draw_while$2_while$1_lessequal@false$3
test_z_draw_while$2_while$1_lessequal@true$3:
mov eax, 1
test_z_draw_while$2_while$1_lessequal@false$3:
cmp eax, 0
je test_z_draw_while$2_while$1_end
mov eax, [test_z_draw_while$2_while$1_x]
push eax
mov eax, [test_z_draw_while$2_while$1_y]
push eax
mov eax, [test_z_draw_while$2_while$1_y]
push eax
mov eax, 320
push eax
mov eax, [test_z_draw_while$2_while$1_addrVram]
push eax
call draw_z_pixel
mov eax, [test_z_draw_while$2_while$1_x]
push eax
mov eax, 1
pop ebx
add eax, ebx
mov [ !!! var is not defined !!! x], eax
jmp test_z_draw_while$2_while$1_start
test_z_draw_while$2_while$1_end:
;while end
mov eax, [test_z_draw_while$2_y]
push eax
mov eax, 1
pop ebx
add eax, ebx
mov [ !!! var is not defined !!! y], eax
jmp test_z_draw_while$2_start
test_z_draw_while$2_end:
;while end
ret
test_z_draw$next:
