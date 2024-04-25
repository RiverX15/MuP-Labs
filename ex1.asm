.model tiny
.data
    fname db 'user.txt',0
    handle dw ?
    msg db 20 dup('$')
.code
.startup
    mov ah, 3dh
    mov al, 00h
    lea dx, fname
    int 21h
    mov handle, ax
    mov ah, 3fh
    mov bx, handle
    mov cx, 20
    lea dx, msg
    int 21h
    lea dx, msg
    mov ah, 09h
    int 21h
    mov ah, 3eh
    int 21h
.exit
end