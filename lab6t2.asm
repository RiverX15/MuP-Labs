.model tiny
.486
.data
    max1 db 32
    act1 db ?
    inp1 db 32 dup(0)
.code
.startup
    lea dx, max1
    mov ah, 0ah
    int 21h
    lea si, inp1
    mov cl, act1
    mov ch, 00h
x1: mov al, [si]
    mov ah, 00h
    sub al, 20h
    mov [si], al
    inc si
    loop x1
.exit
end