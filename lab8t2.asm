.model tiny
.data
    msg1 db 'Enter username: $'
    max1 db 32
    act1 db ?
    inp1 db 32 dup('$')
    fname1 db 'user.txt', 0
    usn1 db 32 dup('$')
    handle1 dw ?
    msg2 db 'Incorrect username. $'
    nline db 0ah, 0dh, '$'
    msg3 db 'Enter password: $'
    max2 db 32
    act2 db ?
    inp2 db 32 dup('$')
    fname2 db 'pswd.txt', 0
    pwd1 db 32 dup('$')
    msg4 db 'Incorrect password. $'
    msg5 db 'Welcome $'
.code
.startup
    ; print msg1
    lea dx, msg1
    mov ah, 09h
    int 21h

    lea dx, nline
    mov ah, 09h
    int 21h
    
    ; read username into inp1
    lea dx, max1
    mov ah, 0ah
    int 21h
    
    ; open file fname1
    mov ah, 3dh
    mov al, 0h
    lea dx, fname1
    int 21h
    mov handle1, ax

    ; read content into usn1
    mov ah, 3fh
    mov bx, handle1
    mov cx, 32
    lea dx, usn1
    int 21h

    ; close fname1
    mov ah, 3eh
    int 21h

    ; compare inp1 and usn1
    lea si, inp1
    lea di, usn1
    mov cl, act1
    mov ch, 00h
    cld
    repe cmpsb
    jz l1

    ; username no match, display msg2 and exit
    lea dx, nline
    mov ah, 09h
    int 21h

    lea dx, msg2
    mov ah, 09h
    int 21h
    jmp E

    ; username correct
    ; print msg3
l1: lea dx, nline
    mov ah, 09h
    int 21h

    lea dx, msg3
    mov ah, 09h
    int 21h

    lea dx, nline
    mov ah, 09h
    int 21h

    ; password input, masking chars
    mov cl, max2
    mov ch, 00h
    lea di, inp2
    mov act2, 00h
l2: mov ah, 08h
    int 21h
    cmp al, 0dh
    je l3
    mov [di], al
    mov dl, '*'
    mov ah, 02h
    int 21h
    inc act2
    inc di
    loop l2
    ; mov act2, bl

    ; open file fname2
l3: mov ah, 3dh
    mov al, 0h
    lea dx, fname2
    int 21h
    mov handle1, ax

    ; read content into pwd1
    mov ah, 3fh
    mov bx, handle1
    mov cx, 32
    lea dx, pwd1
    int 21h

    ; close fname2
    mov ah, 3eh
    int 21h

    ; compare inp2 and pwd1
    lea si, inp2
    lea di, pwd1
    mov cl, act2
    mov ch, 00h
    cld
    repe cmpsb
    jz l4

    ; pwd no match, display msg4 and exit
    lea dx, nline
    mov ah, 09h
    int 21h

    lea dx, msg4
    mov ah, 09h
    int 21h
    jmp E

l4: lea dx, nline
    mov ah, 09h
    int 21h

    lea dx, msg5
    mov ah, 09h
    int 21h

    lea dx, usn1
    mov ah,09h
    int 21h

    lea dx, nline
    mov ah, 09h
    int 21h

E:  int 3h
.exit
end