.model tiny
.386
.data
    char1 db ?
    fname1 db 'lab10.txt', 0
    str1 db 32 dup('$')
    handle1 dw ?
    rowstr dw ?
    rowend dw ?
    colmstr dw ?
    colmend dw ?
    cnt db ?
.code
.startup
    ; read from user
    mov ah, 08h
    int 21h
    mov char1, al

    ; open file fname1
    mov ah, 3dh
    mov al, 0h
    lea dx, fname1
    int 21h
    mov handle1, ax

    ; read content into str1
    mov ah, 3fh
    mov bx, handle1
    mov cx, 32
    lea dx, str1
    int 21h

    ; close fname1
    mov ah, 3eh
    int 21h

    ; move 12th char of str1 into al
    lea si, str1
    mov cl, 11
    mov ch, 00
    cld
    rep lodsb
    ; dec si
    ; lodsb

    ; compare
    cmp char1, al
    je x1
    
    ; unequal case
    ; Set display mode to 640x480 16 colors
    MOV AH, 00H
    MOV AL, 12H
    INT 10H

    ; Set cursor position to (0, 0)
    MOV AH, 02H
    MOV DH, 0
    MOV DL, 0
    MOV BH, 00
    INT 10H

    ; Initialize parameters for box drawing
    MOV rowstr, 0
    MOV rowend, 425
    MOV colmstr, 0
    MOV colmend, 410
    MOV cnt, 00

    ; paint first row green
paintu1: mov si, rowstr
colmu1:  mov cx, colmend
rowu1:   dec cx
    mov di, cx
    push cx
    mov ah, 0Ch
    mov al, 00001101b
    mov cx, di
    mov dx, si
    int 10H
    pop cx
    cmp cx, colmstr
    jnz rowu1
    inc si
    mov ax, rowend
    cmp si, ax
    jnz colmu1

    lea si, rowstr
    add word ptr[si], 17
    lea si, cnt
    inc byte ptr[si]

    mov al, 25
    mov bl, cnt
    cmp bl, al
    jge q

    mov si, rowstr
colmu2:  mov cx, colmend
rowu2:   dec cx
    mov di, cx
    push cx
    mov ah, 0ch
    mov al, 00001010b
    mov cx, di
    mov dx, si
    int 10h
    pop cx
    cmp cx, colmstr
    jnz rowu2
    inc si
    mov ax, rowend
    cmp si, ax
    jnz colmu2

    lea si, rowstr
    add word ptr[si], 17
    lea si, cnt
    inc byte ptr[si]

    jmp paintu1


x1: ; equal case
    ; Set display mode to 640x480 16 colors
    MOV AH, 00H
    MOV AL, 12H
    INT 10H

    ; Set cursor position to (0, 0)
    MOV AH, 02H
    MOV DH, 0
    MOV DL, 0
    MOV BH, 00
    INT 10H

    ; Initialize parameters for box drawing
    MOV rowstr, 0
    MOV rowend, 425
    MOV colmstr, 0
    MOV colmend, 410
    MOV cnt, 00

    ; paint first row green
paint1: mov si, rowstr
colm1:  mov cx, colmend
row1:   dec cx
    mov di, cx
    push cx
    mov ah, 0Ch
    mov al, 00001010b
    mov cx, di
    mov dx, si
    int 10H
    pop cx
    cmp cx, colmstr
    jnz row1
    inc si
    mov ax, rowend
    cmp si, ax
    jnz colm1

    lea si, rowstr
    add word ptr[si], 17
    lea si, cnt
    inc byte ptr[si]

    mov al, 25
    mov bl, cnt
    cmp bl, al
    jge q

    mov si, rowstr
colm2:  mov cx, colmend
row2:   dec cx
    mov di, cx
    push cx
    mov ah, 0ch
    mov al, 00001101b
    mov cx, di
    mov dx, si
    int 10h
    pop cx
    cmp cx, colmstr
    jnz row2
    inc si
    mov ax, rowend
    cmp si, ax
    jnz colm2

    lea si, rowstr
    add word ptr[si], 17
    lea si, cnt
    inc byte ptr[si]

    jmp paint1

q:  mov ah, 07h
    int 21h
    cmp al, '%'
    jnz q

E:  
.exit
end