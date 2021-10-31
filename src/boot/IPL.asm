ORG		0x7c00	
; 内存map
; 0x7c00~0x7e00 ipl
; 0x7e00~0x8000 ipl, boot stack
; 0x8000~0x8200 boot		
JMP		entry
; 标准FAT12格式软盘专用的代码 Stand FAT12 format floppy code
DB		0x90
DB		"HARIBOTE"		; 启动扇区名称（8字节）
DW		512						; 每个扇区（sector）大小（必须512字节）
DB		1							; 簇（cluster）大小（必须为1个扇区）
DW		1							; FAT起始位置（一般为第一个扇区）
DB		2							; FAT个数（必须为2）
DW		224						; 根目录大小（一般为224项）
DW		2880					; 该磁盘大小（必须为2880扇区1440*1024/512）
DB		0xf0					; 磁盘类型（必须为0xf0）
DW		9							; FAT的长度（必??9扇区）
DW		18						; 一个磁道（track）有几个扇区（必须为18）
DW		2							; 磁头数（必??2）
DD		0							; 不使用分区，必须是0
DD		2880					; 重写一次磁盘大小
DB		0,0,0x29			; 意义不明（固定）
DD		0xffffffff		; （可能是）卷标号码
DB		"HARIBOTEOS "	; 磁盘的名称（必须为11字?，不足填空格）
DB		"FAT12   "		; 磁盘格式名称（必??8字?，不足填空格）
TIMES 18 db 0				; 先空出18字节

entry:
		; 初始化
		MOV		AX,0			
		MOV		SS,ax			
		MOV		SP,0x7c00       
		MOV		DS,ax		    
		; 设置参数
		MOV		AX,0x0800
		MOV		ES,AX			; 内存基址
		MOV		CH,0			; 柱面0
		MOV		DH,0			; 磁头0
		MOV		CL,2			; 扇区2

readloop:
		MOV		SI,0			; 记录失败次数寄存器
retry:
		MOV		AH,0x02		; 读入磁盘
		MOV		AL,1			; 1个扇区
		MOV		BX,0
		MOV		DL,0x00		; A驱动器，一般就1个驱动器
		INT		0x13			; 调用磁盘BIOS，进行复制
		JNC		next			; 没出错则跳转到next，进行剩下的复制
		ADD		SI,1			; 出错了，往SI加1
		CMP		SI,5			; 比较SI与5
		JAE		error			; SI >= 5 跳转到error
		MOV		AH,0x00   ; 否则继续重新尝试，重置寄存器
		MOV		DL,0x00		; A驱动器
		INT		0x13			; 重置驱动器
		JMP		retry     ; 从头开始尝试
next:
		MOV		AX,ES
		ADD		AX,0x20
		MOV		ES,AX			; 把内存地址后移0x200（512/16十六进制转换）
		ADD		CL,1			; 往CL里面加1
		CMP		CL,18			; 比较CL与18，18个扇面
		JBE		readloop	; CL <= 18 跳转到readloop，继续装载，扇区
		MOV		CL,1
		ADD		DH,1
		CMP		DH,2
		JB		readloop	; DH < 2 跳转到readloop，DH是磁头数，2个
		MOV		DH,0
		ADD		CH,1
		CMP		CH,39 		; 读80个柱面会出错，因为16位系统只能支配1MB的内存
		JB		readloop

		; 读取完毕，跳转到boot执行
		JMP		0x8000

; 出错显示部分
error:
		MOV		SI,error_msg
		JMP putloop
		
success: 
		mov si, success_msg
		jmp putloop

putloop:
		MOV		AL,[SI]
		ADD		SI,1			; 给SI加1
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e		; 显示一个文字
		MOV		BX,15			; 指定字符颜色
		INT		0x10			; 调用显卡BIOS
		JMP		putloop

fin:
		HLT						  ; 让CPU停止，等待指令
		JMP		fin				; 无限循环

error_msg:
		DB		0x0a, 0x0a		; 换行两次
		DB		"load error"
		DB		0x0a			    ; 换行
		DB		0
		
success_msg:
		DB		0x0a, 0x0a		; 换行两次
		DB		"load success"
		DB		0x0a			    ; 换行
		DB		0
		
times    510-($-$$) db 0 
DB		0x55, 0xaa
