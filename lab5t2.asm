; @Author: Aditya Agrawal

.model TINY
.data
    S db "BITSIOTLAB"
    COUNT dw 000ah
    S1 db "IOT"
    COUNT1 dw 0003h
.code
.startup
    lea DI, S
    lea SI, S1
    mov cx, COUNT
    mov al, [si]
FIND:   repne scasb
    cmp cx, 0000h
    je E
    dec di
    inc cx
    push cx
    mov cx, COUNT1
    repe cmpsb
    cmp cx, 0000h
    je REPLACE
    lea SI, S1
    add DI, cx
    sub DI, COUNT1
    inc DI
    pop cx
    inc cx
    jmp FIND
REPLACE:    pop cx
    sub cx, COUNT1
    mov SI, DI
    sub DI, COUNT1
    mov byte ptr[DI], "*"
    inc DI
    rep movsb
E:
.exit
end