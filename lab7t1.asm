.model tiny
.data
    str1 db 'Enter your name: $'
    max1 db 32
    act1 db ?
    inp1 db 32 dup('$')
    fname db 'testing.txt', 0
    handle dw ?
.code
.startup
    lea dx, str1
    mov ah, 09h
    int 21h
    lea dx, max1
    mov ah, 0ah
    int 21h
    mov ah, 3ch
    lea dx, fname
    mov cl, 1h
    int 21h
    mov handle, ax
    mov ah, 3dh
    mov al, 1h
    lea dx, fname
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
.exit
end