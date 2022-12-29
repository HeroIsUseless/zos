
;function
jmp e3_fun_asm_fun$next
e3_fun_asm_fun:
pop ebp
push ebp
ret
e3_fun_asm_fun$next:

#############新映射器效果############

;############[fun begin]fun############
jmp _fun_pass
_fun:
pop ebp
push ebp
ret
;========[fun end]fun========
_fun_pass:

