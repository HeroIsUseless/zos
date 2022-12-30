mov eax, 320
push eax
jmp main_z@screenWidth$pass
main_z@screenWidth: dd 0
main_z@screenWidth$pass:
pop eax
mov [main_z@screenWidth], eax

mov eax, 200
push eax
jmp main_z@screenHeight$pass
main_z@screenHeight: dd 0
main_z@screenHeight$pass:
pop eax
mov [main_z@screenHeight], eax

mov eax, 0x000a0000
push eax
jmp main_z@addrVram$pass
main_z@addrVram: dd 0
main_z@addrVram$pass:
pop eax
mov [main_z@addrVram], eax

mov eax, 0x0024e000
push eax
jmp main_z@addrPM$pass
main_z@addrPM: dd 0
main_z@addrPM$pass:
pop eax
mov [main_z@addrPM], eax

mov eax, 0x0026e000
push eax
jmp main_z@addrPDT$pass
main_z@addrPDT: dd 0
main_z@addrPDT$pass:
pop eax
mov [main_z@addrPDT], eax

mov eax, 0x0026f800
push eax
jmp main_z@addrIDT$pass
main_z@addrIDT: dd 0
main_z@addrIDT$pass:
pop eax
mov [main_z@addrIDT], eax

mov eax, 0x00270000
push eax
jmp main_z@addrGDT$pass
main_z@addrGDT: dd 0
main_z@addrGDT$pass:
pop eax
mov [main_z@addrGDT], eax


;############[fun begin]run_once############
jmp main_z@run_once$pass
main_z@run_once:
pop ebp
push ebp
ret
main_z@run_once$pass:
;============[fun end]run_once=============


;############[fun begin]run_loop############
jmp main_z@run_loop$pass
main_z@run_loop:
pop ebp
push ebp
call kernel_z_halt

ret
main_z@run_loop$pass:
;============[fun end]run_loop=============


