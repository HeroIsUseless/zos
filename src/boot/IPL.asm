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
 
    MOV AX, 0x0820 ; 读取磁盘
    MOV ES, AX 
    MOV CH, 0 ; 柱面0
    MOV DH, 0 ; 磁头0
    MOV CL, 2 ; 扇区2，加载下一个扇区
    ;
    MOV AH, 0x02 ; 读入磁盘
    MOV AL, 1 ; 一个扇区
    MOV BX, 0
    MOV DL, 0x00 ; A驱动器
    INT 0x13 ; 读入
    JMP 0x8200 ; 跳转到boot执行
    ;

error:
    MOV SI, msg
    putloop:
        MOV AL, [SI] ; 把si中的内容放到AL中
        ADD SI, 1
        CMP AL, 0
        JE halt
        MOV AH, 0x0e
        MOV BX, 15
        INT 0x10
    JMP putloop
 
halt:
    HLT 
    JMP halt
 
; 信息显示部分
msg:
DB		0x0a, 0x0a		; 换行两次
DB		"load error"
DB		0x0a			; 换行
DB		0
 
times    510-($-$$) db 0 
DB		0x55, 0xaa