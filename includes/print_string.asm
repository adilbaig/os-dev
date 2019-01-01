print_string:
    ; Prints a zero terminated string
    
    pusha                   ; Push all registers to the stack
    mov ah, 0x0e            ; int =10/ah=0x0e  -> BIOS tele -type  output
    
    _LOOP_START:
    mov al, [bx]            ; 
    int 0x10                ; print  the  character in al
    
    inc bx                  ; Increment bx, so it's not at the next character 
    cmp al, 0               ; Check if the character is zero '\0'. If not, go back and print it
    jne _LOOP_START         

    popa                    ; Restore the original register values
    ret