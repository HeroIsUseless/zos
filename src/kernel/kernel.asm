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

ALIGNB	16
IDTR:
		DW 8*256-1       ; 后16位是IDT的大小，limit
		DD 0x26f800      ; 前32位是IDT在内存中的位置

; esi是将要填入的地址，就是GDT表的地址，例如Addr_GDT+1*8, Addr_GDT+2*8
; eax是基地址，是代码的
; ebx是控制参数和限制 24+8 4位扩展(自动填上)20位限长8位参数
;     高4位参数 高4位限制 低16位限制 8位参数 = 32位ebx
; 实际上高4位参数被自己固定掉了
; 因此用一个常量代替比较好
; 设置GDT内容
; kernel.z\setGDT(addr: dword, param1: dword, param2: dword)
kernel_z_setGDT:
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
kernel_z_loadGDT:
  lgdt [GDTR] ; 不加dword会警告，因为现在的标签的确从0开始的
ret

kernel_z_loadIDT:
	lidt [IDTR];装载IDT
ret

offset_low equ 0
selector equ 2
dw_count equ 4
access_right equ 5
offset_high equ 6
	
; esi是将要填入的地址
; eax偏移地址4字节,也就是中断函数地址了
kernel_z_setIDT:
	pop ebp
	pop eax 
	pop esi 
	push ebp 
	mov [esi+offset_low], ax 
	shr eax, 16
	mov [esi+offset_high], ax
	mov [esi+selector], word 2<<3 ; 第二段 
	mov ax, 1000111000000000B ; 参数都在这里，中断门
	mov [esi+dw_count], ax 
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
TESTA: DD 0x11111111
; 主进程入口
main:

  ; 测试用
	; 每当执行一个新的浮点程序时，第一条指令都应该是初始化FPU的指令finit。
	; 该指令清除浮点数据寄存器栈和异常，为程序提供一个“干净”的初始状态。
	; 否则，遗留在浮点寄存器栈中的数据可能会产生堆栈溢出。
	; 另一方面，浮点指令程序段结束，也最好清空浮点数据寄存器。
  finit
	; fld src	;将浮点数src压入ST（0）
  ; fild src  ;将整数src压入ST（0）
  ;fild DWORD [TESTA]
  ;fild DWORD [eax]
	mov ebx, [TESTA]
  fild DWORD [TESTA]
  fild DWORD [TESTA]
	fadd
	fist DWORD [eax]
	mov eax, [eax]
  ;fadd to st1
	tt:
		hlt
	jmp tt

  call main_z_run_once
  .loop:
    call main_z_run_loop
  jmp .loop

