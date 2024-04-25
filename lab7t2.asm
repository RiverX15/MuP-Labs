.model tiny
.data
    str1 db 'Enter your name: $'
    max1 db 32
    act1 db ?
    inp1 db 32 dup('$')
    fname1 db 'name.txt', 0
    handle dw ?
    str2 db 'Enter your ID: $'
    max2 db 13
    act2 db ?
    inp2 db 13 dup('$')
    fname1 db 'id.txt', 0
.code
.startup
    lea dx, str1
    mov ah, 09h
    int 21h
    lea dx, max1
    mov ah, 0ah
    int 21h
    mov ah, 3ch
    lea dx, fname1
    mov cl, 1h
    int 21h
    mov handle, ax
    mov ah, 3dh
    mov al, 1h
    lea dx, fname1
    int 21h
    mov handle, ax
    mov ah, 40h
    mov bx, handle
    mov cl, act1
    mov ch, 00h
    lea dx, inp1
    int 21h
    mov ah, 3eh
    int 21h
    
    lea dx, str2
    mov ah, 09h
    int 21h
    lea dx, max2
    mov ah, 0ah
    int 21h
    mov ah, 3ch
    lea dx, fname2
    mov cl, 1h
    int 21h
    mov handle, ax
    mov ah, 3dh
    mov al, 1h
    lea dx, fname2
    int 21h
    mov handle, ax
    mov ah, 40h
    mov bx, handle
    mov cl, act2
    mov ch, 00h
    lea dx, inp2
    int 21h
    mov ah, 3eh
    int 21h
.exit
end