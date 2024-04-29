.model tiny
.data
    fname db 'XDAC.txt', 0
    handle dw ?
    encrypted_pass db 7 dup('$')
    secretPass db 7 dup(?)
    accessGrantedMsg db 'Access Granted$'
    accessDeniedMsg db 'Access Denied$'
    msg1 db 'enter 7 character long password:$'
    max1 db 7
    act1 db ?
    inp1 db 7 dup('$')
    nline db 0ah, 0dh, '$'
.code
.startup
    mov ah, 3dh
    mov al, 0h
    lea dx, fname
    int 21h
    mov handle, ax
    mov ah, 3fh
    mov bx, handle
    mov cx, 7
    lea dx, encrypted_pass
    int 21h
    lea si, encrypted_pass
    lea di, secretPass
    mov cl, 07h
    repeatCopying:
        lodsb
        inc al
        stosb
        loop repeatCopying
    lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg1
    mov ah, 09h
    int 21h
    lea dx, nline
    mov ah, 09h
    int 21h
    mov cx, 7
    lea di, inp1
    l2:
    mov ah, 08h
    int 21h
    mov [di], al
    mov dl, '*'
    mov ah, 02h
    int 21h
    inc di
    dec cx
    jnz l2
    cld
    mov cx, 7
    lea di, inp1
    lea si, secretPass
    repe cmpsb
    je AccessGranted
AccessDenied:
    mov ah, 09h
    lea dx, accessDeniedMsg
    int 21h
    jmp EndProgram
AccessGranted:
    mov ah, 09h
    lea dx, accessGrantedMsg
    int 21h
EndProgram:
.exit
end