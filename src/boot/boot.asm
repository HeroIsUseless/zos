ORG 0x8200

main:
  jmp showSuccess 

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
db		0x0a, 0x0a		; 换行两次
db		"load success!"
db		0x0a			; 换行
db		0

times    512-($-$$) db 0 