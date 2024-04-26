.model tiny
.data
    str1 db 'Enter your name: $'
    max1 db 32
    act1 db ?
    inp1 db 32 dup('$')
    fname1 db 'name.txt', 0
    str2 db 'Enter your ID: $'
    max2 db 14
    act2 db ?
    inp2 db 14 dup('$')
    fname2 db 'id.txt', 0
    fname3 db 'splice.txt', 0
    name1 db 32 dup('$')
    id1 db 14 dup('$')
    handle1 dw ?
    handle2 dw ?
.code
.startup
    ; print str1
    lea dx, str1
    mov ah, 09h
    int 21h
    
    ; read name
    lea dx, max1
    mov ah, 0ah
    int 21h

    ; create file with name fname1
    mov ah, 3ch
    lea dx, fname1
    mov cl, 1h
    int 21h
    mov handle1, ax

    ; open file
    mov ah, 3dh
    mov al, 1h
    lea dx, fname1
    int 21h
    mov handle1, ax

    ; write inp1 to file
    mov ah, 40h
    mov bx, handle1
    mov cl, act1
    mov ch, 00h
    lea dx, inp1
    int 21h
    
    ; close file fname1
    mov ah, 3eh
    int 21h
    
    ;------------------------------------------
    
    ; print str2
    lea dx, str2
    mov ah, 09h
    int 21h
    
    ; read name
    lea dx, max2
    mov ah, 0ah
    int 21h

    ; create file with name fname2
    mov ah, 3ch
    lea dx, fname2
    mov cl, 1h
    int 21h
    mov handle1, ax

    ; open file
    mov ah, 3dh
    mov al, 1h
    lea dx, fname2
    int 21h
    mov handle2, ax

    ; write inp2 to file
    mov ah, 40h
    mov bx, handle2
    mov cl, act2
    mov ch, 00h
    lea dx, inp2
    int 21h
    
    ; close file fname2
    mov ah, 3eh
    int 21h

    ;-------------------------------------------------

    ; create file with name fname3
    mov ah, 3ch
    lea dx, fname3
    mov cl, 1h
    int 21h
    mov handle2, ax

    ; open file
    mov ah, 3dh
    mov al, 1h
    lea dx, fname3
    int 21h
    mov handle2, ax

    ;-----------------------------------------------

    ; open file fname2
    mov ah, 3dh
    mov al, 0h
    lea dx, fname2
    int 21h
    mov handle1, ax

    ; read content into id1
    mov ah, 3fh
    mov bx, handle1
    mov cx, 14
    lea dx, id1
    int 21h

    ; write id1 into fname3
    mov ah, 40h
    mov bx, handle2
    mov cl, act2
    mov ch, 00h
    lea dx, id1
    int 21h

    ; close file fname2
    mov bx, handle1
    mov ah, 3eh
    int 21h

    ;-----------------------------------------
    
    ; open file fname1
    mov ah, 3dh
    mov al, 0h
    lea dx, fname1
    int 21h
    mov handle1, ax

    ; read content into name1
    mov ah, 3fh
    mov bx, handle1
    mov cx, 14
    lea dx, name1
    int 21h

    ; write id1 into fname3
    mov ah, 40h
    mov bx, handle2
    mov cl, act1
    mov ch, 00h
    lea dx, name1
    int 21h

    ; close file fname1
    mov bx, handle1
    mov ah, 3eh
    int 21h

    ;-----------------------------------------

    ; close file fname3
    mov bx, handle2
    mov ah, 3eh
    int 21h

    int 3h
.exit
end