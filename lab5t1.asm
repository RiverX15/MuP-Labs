.model tiny
.data
    dat1 db 'wasitcatisaw'
    dat1length db 0ch
    res dw 00h
.code
.startup
    lea si, dat1
    lea di, dat1
    mov cl, dat1length
    mov ch, 00h
x1: inc di
    loop x1
    dec di
    cld
    mov cl, dat1length
    mov ch, 00h
x2: cmpsb
    jne x4
    dec di
    dec di
    loop x2
    mov res, 01h
x4: 
.exit
end