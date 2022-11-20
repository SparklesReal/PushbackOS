; This file is loaded onto the disk so we have a higher limit than 512 bytes
[org 0x7e00]

mov bx, ExtendedSpaceSuccess
call PrintString ; call printstring to print the data stored in ExtendedSpaceSuccess

call GetKeyboardInput
call PrintString

jmp $

%include "Functions.asm"

ExtendedSpaceSuccess:
    db "l+ratio",0

times 2048-($-$$) db 0 