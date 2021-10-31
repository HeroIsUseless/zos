ORG 0x8000
Addr_Main_16 equ 0x8200   ; 实模式下的操作系统入口
Addr_Main_32 equ 0x00280000 ; 保护模式下的操作系统入口

jmp main

		ALIGNB	16
GDTR0: ; 临时GDTR
		DW		8*3-1 ; 最后一个字节的偏移
		DD		GDT0  ; 表的地址

		ALIGNB	16
GDT0: ; 临时GDT
		TIMES	8		db 0	             ; 第0段，全是0
		DW		0xffff,0x0000, 0x9200,0x00cf ; 第1段，数据段	
		DW		0xffff,0x0000, 0x9a00,0x00c7 ; 第2段，代码段，它们控制位是不同的，注意从后往前看	

main:
    ; VGA显卡
    mov al, 0x13
    mov ah, 0x00
    int 0x10
    ; 禁用中断
    mov al, 0xff
    out 0x21, al ; 禁止主PIC全部中断
    cli          ; 禁止中断CPU(内部中断)
    ; 打开A20GATE,让CPU支持1M以上内存
	mov ax, 0x2401
	int 0x15
    ; 保护模式切换
	LGDT	[GDTR0]			; 设置临时GDT
	MOV		EAX,CR0
	AND		EAX,0x7fffffff	; 使用bit31（禁用分页）
	OR		EAX,0x00000001	; bit0到1转换（保护模式过渡）
	MOV		CR0,EAX         ; 设置好CR0寄存器，cr0的第一位就是切换模式的
	JMP		pipelineflush   ; 转换的时候就是这里用了一下jump
pipelineflush:
	MOV		EAX,1<<3			;  这里用的是第1段
	MOV		DS,AX
	MOV		ES,AX
	MOV		FS,AX
	MOV		GS,AX
	MOV		SS,AX

    ; 内存代码拷贝出内存前1MB之外
	MOV		ESI,Addr_Main_16	; 源
	MOV		EDI,Addr_Main_32	; 目标
	MOV		ECX,512*1024/4 
	CALL	Memory_Copy ; 1024个扇面(512kb)

    ; 跳转到main执行
fin:
    hlt
    jmp fin 

; 参数：esi，源地址，edi，目标地址，ecx，数据个数(双字单位，一般普通字节除以4)
Memory_Copy:
		pushad
	.loop:
		MOV		EAX,[ESI]
		ADD		ESI,4
		MOV		[EDI],EAX
		ADD		EDI,4
		SUB		ECX,1
		JNZ		.loop			; 运算结果不为0跳转到memcpy
		popad
ret

showSuccess:
    mov si, msg
    putloop:
        mov al, [si] ; 把si中的内容放到al中
        add si, 1
        cmp al, 0
        je halt
        mov ah, 0x0e
        mov bx, 15
        int 0x10
    jmp putloop
 
halt:
    hlt 
    jmp halt
 
; 信息显示部分
msg:
db		"boot success"
db		0x0a			; 换行
db		0

times    512-($-$$) db 0 