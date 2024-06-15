; This file is loaded onto the disk so we have a higher limit than 512 bytes
[org 0x7e00]

%include "Functions.asm"
section .text

    call GetKeyboardInput
    call PrintString

    jmp $

    times 2048-($-$$) db 0 