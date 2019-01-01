; A boot sector program that prints string using our own function


[org 0x7c00]    ; Tell the assembler where this code will be loaded

mov bx, HELLO_MSG
call print_string

mov bx, GOODBY_MSG
call print_string

jmp $

%include "includes/print_string.asm"

HELLO_MSG:
    db 'Hello World!', 0 

GOODBY_MSG:
    db 'Goodbye!', 0

; Padding and stuff

times 510-($-$$) db 0
dw 0xaa55
