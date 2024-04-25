.model tiny
.486
.data
    str1 db 'The character entered is a.$'
    str2 db 'The character entered is not a.$'
.code
.startup
    mov ah, 08h
    int 21h
    cmp al, 'a'
    je x1
    lea dx, str2
    jmp x2
x1: lea dx, str1
x2: mov ah, 09h
    int 21h
.exit
end