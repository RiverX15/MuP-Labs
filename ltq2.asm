.model tiny
.data
    string db 'I HATE MUP'
    space db '         '
    substring db 'HATE'
    replacestring db 'LOVE'
    stringLength db 10
    substringLength db 04h
.code
.startup
    lea bx, string
    mov dl, stringLength
CompareSubstring:
    mov si, bx
    lea di, substring
    mov cl, substringLength
    repe cmpsb
    je SubstringFound
    inc bx
    dec dl
    jnz CompareSubstring
    jmp end_prog
SubstringFound:
    lea si, replacestring
    mov di, bx
    mov cl, substringLength
    repeatCopying:
        cld
        movsb
        loop repeatCopying
end_prog:
    nop
    int 3h
.exit
end