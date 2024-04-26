.model tiny
.386
.data
    char1 db 'A'
    rowstr db ?
    cnt db 08h
    p1 db ?
    p2 db ?
.code
.startup
    mov ah, 00h
    mov al, 03h
    int 10h

    lea si, char1
    mov ch, 00h
    mov cl, cnt
    mov rowstr, 0
    lea di, rowstr

    ; a1=1
    push cx
    mov ah, 02h 
    mov dh, [di]
    mov dl, 0
    mov bh, 00
    int 10h

    mov ah, 09h
    mov al, [si]
    mov bh, 00h
    mov bl, 00001111b
    mov cx, 01
    int 10h
    pop cx

    inc word ptr[di]
    dec cl
    mov p2, 01h
    mov p1, 00h

x1: push cx
    mov ah, 02h
    mov dh, [di]
    mov dl, 0
    mov bh, 0
    int 10h

    mov ah, 09h
    mov al, [si]
    mov bh, 00
    mov bl, 00001111b
    mov cl, p1
    add cl, p2
    add al, cl
    dec al
    int 10h
    mov al, p2
    mov p1, al
    mov p2, cl
    mov al, [si]
    pop cx

    inc word ptr[di]
    dec cl
    jnz x1

end1:   mov ah, 07h
    int 21h
    cmp al, '%'
    jnz end1

term:   mov ah, 4ch
    int 21h
.exit
end