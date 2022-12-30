[bits 32]
ORG 0x280000
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


jmp main

limit_low equ 0
base_low equ 2 
base_mid equ 4 
access_right equ 5
limit_high equ 6 
base_high equ 7 
	
ALIGNB	16
GDTR:
		DW 8*8192-1 ; 最后一个字节的偏移
		DD 0x270000 ; 表的地址

; esi是将要填入的地址，就是GDT表的地址，例如Addr_GDT+1*8, Addr_GDT+2*8
; eax是基地址，是代码的
; ebx是控制参数和限制 24+8 4位扩展(自动填上)20位限长8位参数
;     高4位参数 高4位限制 低16位限制 8位参数 = 32位ebx
; 实际上高4位参数被自己固定掉了
; 因此用一个常量代替比较好
; 设置GDT内容
; kernel.z\setGDT(addr: dword, param1: dword, param2: dword)
setGDT:
  pop ebp
  pop ebx
  pop eax
  pop esi
  push ebp
	mov [esi+base_low],  ax ; 基地址的低16位
	shr eax, 16
	mov [esi+base_mid], al ; 8位，1个字节
	mov [esi+base_high], ah
	; 下面是限制与权限设置
	mov [esi+access_right], bl;8位参数
	; 0x00 未使用的记录表
	; 0x92 系统模式，可读写不可执行
	; 0x9a 系统模式，可执行可读不可写
	; 0xf2 应用模式，可读写不可执行
	; 0xfa 应用模式，可执行可读不可写
	shr ebx, 8
	mov [esi+limit_low], bx ; 限制的低16位
	shr ebx, 16
	or  bl, 0xc0 ; 0xc0=11000000
	and bl, 0xcf ; 规定好前4位为1100，0x11001111
	mov [esi+limit_high], bl ; 4位参数+4位段限长，高4位被称为扩展访问权，参数固定为
	; G=1(开启4K),D/B=1(32位段),0(固定),AVL=0(也是默认的)这4位在386前是没有的
	; 因此注意limit在这里被规定为24位长，其中高四位是扩展访问权，是固定的
ret 

; 加载GDT
; kernel.z\loadGDT()
loadGDT:
  lgdt [GDTR] ; 不加dword会警告，因为现在的标签的确从0开始的
ret

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
TESTA: DW 0x1234
; 主进程入口
main:
  finit
  fld DWORD [TESTA]
  fld DWORD [eax]
  fadd to st1
  call main_z@run_once
  .loop:
    call main_z@run_loop
  jmp .loop

