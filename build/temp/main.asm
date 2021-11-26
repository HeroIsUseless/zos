
;function
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

;function
jmp main_z_run_loop$next
main_z_run_loop:
pop ebp
push ebp
call kernel_z_halt
ret
main_z_run_loop$next:
