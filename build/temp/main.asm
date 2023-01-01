mov eax, 320
push eax
jmp main_z_screenWidth$pass
main_z_screenWidth: dd 0
main_z_screenWidth$pass:
pop eax
mov [main_z_screenWidth], eax

mov eax, 200
push eax
jmp main_z_screenHeight$pass
main_z_screenHeight: dd 0
main_z_screenHeight$pass:
pop eax
mov [main_z_screenHeight], eax

mov eax, 0x000a0000
push eax
jmp main_z_addrVram$pass
main_z_addrVram: dd 0
main_z_addrVram$pass:
pop eax
mov [main_z_addrVram], eax

mov eax, 0x0024e000
push eax
jmp main_z_addrPM$pass
main_z_addrPM: dd 0
main_z_addrPM$pass:
pop eax
mov [main_z_addrPM], eax

mov eax, 0x0026e000
push eax
jmp main_z_addrPDT$pass
main_z_addrPDT: dd 0
main_z_addrPDT$pass:
pop eax
mov [main_z_addrPDT], eax

mov eax, 0x0026f800
push eax
jmp main_z_addrIDT$pass
main_z_addrIDT: dd 0
main_z_addrIDT$pass:
pop eax
mov [main_z_addrIDT], eax

mov eax, 0x00270000
push eax
jmp main_z_addrGDT$pass
main_z_addrGDT: dd 0
main_z_addrGDT$pass:
pop eax
mov [main_z_addrGDT], eax


;############[fun begin]run_once############
jmp main_z_run_once$pass
main_z_run_once:
pop ebp
push ebp
mov eax, [main_z_addrVram]
push eax
call test_z_draw

ret
main_z_run_once$pass:
;============[fun end]run_once=============


;############[fun begin]run_loop############
jmp main_z_run_loop$pass
main_z_run_loop:
pop ebp
push ebp
call kernel_z_halt

ret
main_z_run_loop$pass:
;============[fun end]run_loop=============


