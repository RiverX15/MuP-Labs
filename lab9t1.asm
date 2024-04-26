.model tiny
.386
.data
    inp1 db 'Shikhar Singh'
    colmstr db ?
    cnt db 0dh
.code
.startup
    mov ah, 00h
    mov al, 03h
    int 10h
    lea si, colmstr
    dec si
    mov ch, 00h
    mov cl, cnt
    mov colmstr, 0
    lea di, colmstr
write1: push cx
    mov ah, 02h
    mov dh, [di]
    mov dl, [di]
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, [si]
    mov bh, 00
    mov bl, 00001111b
    mov cx, 01
    int 10h
    pop cx
    dec si
    inc word ptr[di]
    dec cl
    ; inc dh
    jnz write1
end1:   mov ah, 07h
    int 21h
    cmp al, '%'
    jnz end1
term:   mov ah, 4ch
    int 21h

    int 3h
.exit
end