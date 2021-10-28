org 0x7c00  ; 程序的内存装载地址
jmp entry
; 标准FAT12格式软盘专用的代码
db		"MyOS_IPL"		; 启动扇区名称（8字节）
dw		512				; 每个扇区（sector）大小（必须512字节）
db		1				; 簇（cluster）大小（必须为1个扇区）
dw		1				; FAT起始位置（一般为第一个扇区）
db		2				; FAT个数（必须为2）
dw		224				; 根目录大小（一般为224项）
dw		2880			; 该磁盘大小（必须为2880扇区1440*1024/512）
db		0xf0			; 磁盘类型（必须为0xf0）
dw		9				; FAT的长度（必须是9扇区）
dw		18				; 一个磁道（track）有几个扇区（必须为18）
dw		2				; 磁头数（必须是2）
dd		0				; 不使用分区，必须是0
dd		2880			; 重写一次磁盘大小
db		0,0,0x29		; 意义不明（固定）
dd		0xffffffff		; （可能是）卷标号码
db		"MyOS_disk  "	; 磁盘的名称（必须为11字节，不足填空格）
db		"FAT12   "		; 磁盘格式名称（必须是8字节，不足填空格）
times	18 db 0			; 先空出18字节
;  加载磁盘内容到内存
entry:
    mov ah, 0x00
    int 0x13       ; 重置驱动器
    mov ax, 0x7e00
    mov ss, ax     ; 堆栈地址为0x7e00
    mov sp, 0      ; 堆栈指针
    mov ax, 0x8000 
    mov es, ax     ; 内存基址
    mov bx, 0      ; 内存偏移量始终为0
    mov ch, 0      ; 柱面0
    mov dh, 0      ; 磁头0
    mov cl, 1      ; 扇区0
    mov dl, 0      ; A驱动器
    mov ah, 0x02   ; 读入磁盘功能号
    mov al, 1      ; 一个扇区
    int 0x13
    jmp showError
 
readloop:  
    int 0x13     ; 读入
    mov di, es
    add di, 0x200
    mov es, di   ; 把内存地址后移512
    add cl, 1    ; cl的加1
    cmp cl, 18   ; 读完18个扇区
    jb readloop
    mov cl, 0
    add ch, 1
    cmp ch, 80  ; 读完80个柱面
    jb readloop 
    mov ch, 0
    add dh, 1
    cmp dh, 2
    jb readloop ; 两个正反面

    jmp showError
    ;jmp 0x8200 ; 跳转到系统执行
 
showError:
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
db		0x0a, 0x0a		; 换行两次
db		"load error"
db		0x0a			; 换行
db		0
 
times    510-($-$$) db 0 
db		0x55, 0xaa