ORG 0x7c00 ; 程序的内存装载地址
; 内存map
; 0x7c00~0x7e00 IPL
; 0x7e00~0x8000 IPL运行时堆栈
; 0x8000~0x8200 boot
JMP entry
; 标准FAT12格式软盘专用的代码
DB		"MyOS_IPL"		; 启动扇区名称（8字节）
DW		512				; 每个扇区（sector）大小（必须512字节）
DB		1				; 簇（cluster）大小（必须为1个扇区）
DW		1				; FAT起始位置（一般为第一个扇区）
DB		2				; FAT个数（必须为2）
DW		224				; 根目录大小（一般为224项）
DW		2880			; 该磁盘大小（必须为2880扇区1440*1024/512）
DB		0xf0			; 磁盘类型（必须为0xf0）
DW		9				; FAT的长度（必须是9扇区）
DW		18				; 一个磁道（track）有几个扇区（必须为18）
DW		2				; 磁头数（必须是2）
DD		0				; 不使用分区，必须是0
DD		2880			; 重写一次磁盘大小
DB		0,0,0x29		; 意义不明（固定）
DD		0xffffffff		; （可能是）卷标号码
DB		"MyOS_disk  "	; 磁盘的名称（必须为11字节，不足填空格）
DB		"FAT12   "		; 磁盘格式名称（必须是8字节，不足填空格）
times	18	db 0			; 先空出18字节
; 程序主体
entry:
    MOV AX,  0     ; 初始化堆栈
    MOV SS, AX     ; 堆栈地址为0
    MOV SP, 0x7c00 ; 堆栈指针附了特定值
    MOV AX, 0x0800 ; 内存缓冲区
    MOV ES, AX 
    MOV CH, 0      ; 柱面0
    MOV DH, 0      ; 磁头0
    MOV CL, 2      ; 扇区2，加载下一个扇区
    MOV AH, 0x02   ; 读入磁盘
    MOV AL, 1      ; 一个扇区
    MOV BX, 0
    MOV DL, 0x00   ; A驱动器
    INT 0x13       ; 读入

	mov		al,0x13			; VGA显卡，320x200x8bit，这是显卡硬件固定的
	mov		ah,0x00			; 必须是0x00
	int		0x10    
	; 禁用一切中断，要是模式切换中中断进来那就糟了
	mov		al,0xff
	out		0x21,al ; 禁止主PIC全部中断
	nop				; 不断执行OUT指令
	out		0xa1,al ; 禁止从PIC的全部中断(外部中断)
	cli				; 进一步中断CPU(内部中断)
    ; 打开A20GATE,让CPU支持1M以上内存
	mov ax, 0x2401
	int 0x15
; 保护模式转换
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
; bootpack传递，代码实际上都是一样的
	MOV		ESI,Addr_Main_16	; 源，就是主要代码了，main代码，最下面有这个
	MOV		EDI,Addr_Main_32	; 目标，0x00280000，但已经可以存进去了，而且可以读取，完全正确
	MOV		ECX,512*1024/4 
	CALL	Memory_Copy ; 1024个扇面(512kb)可算仁至义尽

    JMP 0x8000     ; 跳转到boot执行

		ALIGNB	16
GDTR0: ; 临时GDTR
    DW		8*3-1 ; 最后一个字节的偏移
    DD		GDT0  ; 表的地址

		ALIGNB	16
GDT0: ; 临时GDT
		TIMES	8		db 0	             ; 第0段，全是0
		DW		0xffff,0x0000, 0x9200,0x00cf ; 第1段，数据段	
		DW		0xffff,0x0000, 0x9a00,0x00c7 ; 第2段，代码段，它们控制位是不同的，注意从后往前看	

times 510-($-$$) db 0 
db 0x55, 0xaa
