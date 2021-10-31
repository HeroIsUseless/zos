ORG 0x8000

jmp main

; aligb 16
; gdtr_tmp:
;     dw 8*3-1
;     dd gdt_tmp

; aligb 16
; gdt_tmp:
;     times 8 db 0
;     dw 0xffff,0x0000, 0x9200,0x00cf
;     dw 0xffff,0x0000, 0x9a00,0x00c7

main:
    ; ; VGA显卡
    ; mov al, 0x13
    ; mov ah, 0x00
    ; int 0x10
    ; ; 禁用中断
    ; mov al, 0xff
    ; out 0x21, al ; 禁止主PIC全部中断
    ; cli          ; 禁止中断CPU(内部中断)
    ; ; 打开A20GATE,让CPU支持1M以上内存
	; mov ax, 0x2401
	; int 0x15
    ; ; 保护模式切换

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
db		"load success!"
db		0x0a			; 换行
db		0

times    512-($-$$) db 0 