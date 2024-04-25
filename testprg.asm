.model tiny
.data
warmessage db "defend attack at Kyiv"
len db 21
shifter db 5
encrypted_message db 21 dup(?)
.code
.startup
    lea si, warmessage
    mov cl, len
    lea di, encrypted_message
    cld
    mov ch, 00h
    mov bh, 00h
    mov bl, len
    add si, bx
    dec si
    std
    x1: movsb
        inc di
        inc di
        dec cl
        jnz x1
    lea di, encrypted_message
    mov cl, shifter
    mov bl, len
    x2: not byte ptr [di]
        ror byte ptr [di], cl
        inc di
        dec bl
        jnz x2
.exit
end