include atajos.asm
.model small
.stack
.data

; variables 
;almacenar datos claculadora 
_chainCal db 0ah , 0dh, "MODO CALCULADORA", "$"
_int1   dw 0        ; numero almacenamiento en inte 
_int2   dw 0        ; numero almacenamiento int 2 
_calres dw 0 ; alamacenamiento res previo al res total 


; menu 
_space db 0ah,0dh, "$"
_option db 0ah,0dh, "> INGRESAR DECISION: $"
_return db 0ah,0dh, "1. REGRESAR$"
_num db  ">", "$"
_result db 0ah,0dh, "> RESULTADO es ", "$"
_chain8 db 0ah,0dh, "1. CALCULADORA$"
_chain9 db 0ah,0dh, "2. ARCHIVO$"
_chain10 db 0ah,0dh, "3. EXIT$"
; mensaje de inicio variables 
_chain1 db 0ah,0dh, "UNIVERSIDAD DE SAN CARLOS DE GUATEMALA$"
_chain2 db 0ah,0dh, "FACULTAD DE INGENIERIA$"
_chain3 db 0ah,0dh, "ESCUELA DE CIENCIAS Y SISTEMAS$"
_chain4 db 0ah,0dh, "ARQUITECTURA DE COPMILADORES Y ENSAMBLADORES$"
_chain5 db 0ah,0dh, "SECCION <A>$"
_chain6 db 0ah,0dh, "<BYRON RUBEN HERNANDEZ DE LEON>$"
_chain7 db 0ah,0dh, "<201806840>$"
; PROCS 
functionMenu proc far 
    getPrint _space
    getPrint _chain8
    getPrint _chain9
    getPrint _chain10
    getPrint _option
    ret 
functionMenu endp

funcIdentificar proc far 
    getPrint _chain1
    getPrint _chain2
    getPrint _chain3
    getPrint _chain4
    getPrint _chain5
    getPrint _chain6
    getPrint _chain7
    ret 
funcIdentificar endp
; code 
.code 
main proc

    Lstart:
    call funcIdentificar
    getInput
    cmp al,0Dh 
    je Lmenu 
    jmp Lstart

    Lmenu: 
        call functionMenu
        getInput
        cmp al,31H ; 1 en hexa decimal 
        cmp al,32H ; 2 en hexa 
        cmp al,33H ; 3 en hexa 
        je Lexit
        jmp Lmenu

    Lexit:
    mov ax,4c00h
    int 21h

    Lsum:; suma 
        mov dx , _int1
        add dx , _int2
        mov _calres , dx 
        mov ax , _calres

main endp
end main