.model tiny
.data
array1 db 91h, 02h, 083h, 0Ah, 075h, 0Ah, 047h, 012h, 076h, 61h
mychar db 'E'
.code
.startup
    lea si, array1
    mov bl, mychar
    mov cx, 0ah
x1: mov al, [si]
    cmp al, 0ah
    jne x2
    mov [si], bl
x2: inc si
    dec cx
    jnz x1
.exit
end