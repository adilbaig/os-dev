mov bx, 30
cmp bx, 4
jl  print_a
jmp print_b

cmp ax, 4         ; compare  the  value  in ax to 4
je  then_block    ; jump to  then_block  if they  were  equal
mov bx, 45       ; otherwise , execute  this  code
jmp  the_end      ; important: jump  over  the ’then’ block ,
; so we don’t also  execute  that  code.
then_block:
mov bx, 23
the_end:
    mov ah, 0x0e      ; int =10/ah=0x0e  -> BIOS tele -type  output
    int 0x10          ; print  the  character  in al
    jmp $

; Padding  and  magic  number.
times  510-($-$$) db 0
dw 0xaa55

print_a:
    mov al, 'A'
    mov ah, 0x0e      ; int =10/ah=0x0e  -> BIOS tele -type  output
    int 0x10
    jmp end

print_b:
    mov al, 'B'
    mov ah, 0x0e      ; int =10/ah=0x0e  -> BIOS tele -type  output
    int 0x10          ; print  the  character  in al
    jmp end