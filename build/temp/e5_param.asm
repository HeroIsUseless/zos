jmp e5_param_zfun_next
e5_param_zfun:
pop ebp
jmp e5_param_za_next
e5_param_za: db 0
e5_param_za_next:
pop eax
mov [a], eax
jmp e5_param_zb_next
e5_param_zb: db 0
e5_param_zb_next:
pop eax
mov [b], eax
push ebp
ret
e5_param_zfun_next:
