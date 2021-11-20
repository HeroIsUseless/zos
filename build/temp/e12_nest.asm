; if start
e12_nest_z_if$1_start:
mov eax, 1
cmp eax, 0
je e12_nest_z_if$1_else
e12_nest_z_if$1_then:
; if start
e12_nest_z_if$1_if$1_start:
mov eax, 1
cmp eax, 0
je e12_nest_z_if$1_if$1_else
e12_nest_z_if$1_if$1_then:
jmp e12_nest_z_if$1_if$1_end
e12_nest_z_if$1_if$1_else:
mov eax, 1
push eax
jmp e12_nest_z_if$1_if$1_a$next
e12_nest_z_if$1_if$1_a: dd 0
e12_nest_z_if$1_if$1_a$next:
pop eax
mov [e12_nest_z_if$1_if$1_a], eax
e12_nest_z_if$1_if$1_end:
;if end
jmp e12_nest_z_if$1_end
e12_nest_z_if$1_else:
e12_nest_z_if$1_end:
;if end
; if start
e12_nest_z_if$2_start:
mov eax, 1
cmp eax, 0
je e12_nest_z_if$2_else
e12_nest_z_if$2_then:
jmp e12_nest_z_if$2_end
e12_nest_z_if$2_else:
e12_nest_z_if$2_end:
;if end
; while start
e12_nest_z_while$1_start:
mov eax, 1
cmp eax, 0
je e12_nest_z_while$1_end
; while start
e12_nest_z_while$1_while$1_start:
mov eax, 1
cmp eax, 0
je e12_nest_z_while$1_while$1_end
jmp e12_nest_z_while$1_while$1_start
e12_nest_z_while$1_while$1_end:
;while end
jmp e12_nest_z_while$1_start
e12_nest_z_while$1_end:
;while end
; while start
e12_nest_z_while$2_start:
mov eax, 1
cmp eax, 0
je e12_nest_z_while$2_end
jmp e12_nest_z_while$2_start
e12_nest_z_while$2_end:
;while end
; while start
e12_nest_z_while$3_start:
mov eax, [e12_nest_z_while$3_y]
push eax
mov eax, 200
push eax
pop ebx
pop eax
cmp eax, ebx
jbe e12_nest_z_while$3_lessequal@true$1
mov eax, 0
jmp e12_nest_z_while$3_lessequal@false$1
e12_nest_z_while$3_lessequal@true$1:
mov eax, 1
e12_nest_z_while$3_lessequal@false$1:
cmp eax, 0
je e12_nest_z_while$3_end
; while start
e12_nest_z_while$3_while$1_start:
mov eax, [e12_nest_z_while$3_while$1_x]
push eax
mov eax, 320
push eax
pop ebx
pop eax
cmp eax, ebx
jbe e12_nest_z_while$3_while$1_lessequal@true$2
mov eax, 0
jmp e12_nest_z_while$3_while$1_lessequal@false$2
e12_nest_z_while$3_while$1_lessequal@true$2:
mov eax, 1
e12_nest_z_while$3_while$1_lessequal@false$2:
cmp eax, 0
je e12_nest_z_while$3_while$1_end
mov eax, [e12_nest_z_while$3_while$1_x]
push eax
mov eax, [e12_nest_z_while$3_while$1_y]
push eax
mov eax, [e12_nest_z_while$3_while$1_y]
push eax
mov eax, 320
push eax
mov eax, [e12_nest_z_while$3_while$1_addrVram]
push eax
call draw_z_pixel
mov eax, [e12_nest_z_while$3_while$1_x]
push eax
mov eax, 1
pop ebx
add eax, ebx
mov [e12_nest_z_while$3_while$1_x], eax
jmp e12_nest_z_while$3_while$1_start
e12_nest_z_while$3_while$1_end:
;while end
mov eax, [e12_nest_z_while$3_y]
push eax
mov eax, 1
pop ebx
add eax, ebx
mov [e12_nest_z_while$3_y], eax
jmp e12_nest_z_while$3_start
e12_nest_z_while$3_end:
;while end
