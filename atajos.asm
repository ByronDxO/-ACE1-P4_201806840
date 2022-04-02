;atajos 
;mensajes 

;print 

getPrint macro buffer 
    MOV AX,@data
    MOV DS,AX
    MOV AH,09H
    MOV DX, OFFSET buffer
    INT 21h
endm

;capturar teclado 
getInput macro 
    MOV AH,01H
    int 21h
endm
; operaciones 
INT_to_STRINg macro intNum
    local divTen, signoN ,Digito,getStack
    push ax 
    push bx 
    push cx 
    push dx 
    push si 
    xor si,si
    xor cx,cx 
    xor bx,bx
    xor dx,dx
    mov bx, 0ah 
    test ax , 1000000000000000
    jnz signoN
    Digito:
        cmp ax, 0009h
        ja divTen
        mov intNum[si],30h
        inc si 
        jmp divTen
    signoN:
        neg ax 
        ja divTen
        mov intNum[si], 30h
        inc si 
        jmp divTen
    divTen: 
        xor dx,dx 
        div bx 
        inc cx 
        push cx 
        cmp ax,0h 
        je getStack
            jmp divTen
    getStack:
        pop dx 
        add dl,30h
        mov intNum[si],dl
        inc si 
        loop getStack
        mov ah,'$'
        mov intNum[si],ah

        pop si 
        pop dx 
        pop cx 
        pop bx 
        pop ax 
    endm 