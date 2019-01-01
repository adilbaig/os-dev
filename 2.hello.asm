; A simple boot sector that prints Hello on the screen

mov ah, 0x0e

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10

jmp $	; Jump to the current address, i.e: loop forver

; Padding and magic bios number

times 510 -($-$$)	db 0
dw 0xaa55

