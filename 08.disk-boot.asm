; Load a sector from the disk and print it out
[org 0x7c00]

mov [BOOT_DRIVE], dl    ; BIOS stores our boot drive in DL, so best to remember this for later

mov bp, 0x8000          ; Here we set the stack safely out of the way
mov sp, bp

mov bx, 0x9000          ; Load 2 sectors to 0x0000(ES):0x9000(BX) from the boot disk
mov dh, 2
mov dl, [BOOT_DRIVE]
call disk_load

mov dx, [0x9000]        ; Print the first loaded word
call print_hex

mov dx, [0x9000 + 512]  ; Also print the first word from the 2nd sector
call print_hex

jmp $

%include "includes/print_string.asm"
%include "includes/disk_load.asm"

; Global variabls
BOOT_DRIVE: db 0

times 510-($-$$) db 0
dw 0xaa55

; We know that BIOS only loads the first 512 bytes from the disk, so we purposely add 2 more sectors
; so we can prove the words were actually loaded from disk

times 256 dw 0xdada
times 256 dw 0xface
