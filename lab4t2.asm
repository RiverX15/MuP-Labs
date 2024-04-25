.model tiny
.data
array1 db 0ffh, 0ffh
count db 2
neg1 db ?
.code
.startup
    lea si, array1
    mov cl, count
    mov ch, 00h
    mov ax, 00h
    mov bl, 00h
x1: cmp [si], bl
    jge x2
    inc ax
x2: inc si
    dec cx
    jnz x1
    lea di, neg1
    mov [di], ax
.exit
end