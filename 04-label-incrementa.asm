; label.asm - a program using NASM

section .data
    myint db 1

section .text

global mystart

mywrite:
    mov eax, 0x4
    int 0x80
    ret

myexit:
    mov eax, 0x1
    int 0x80

mystart:
    push dword myint
    push dword 1
    call mywrite
    
    add esp, 12        ; clean up stack

    push dword 0
    call myexit
