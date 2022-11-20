; This file is loaded onto the disk so we have a higher limit than 512 bytes
[org 0x7e00]

call GetSystemClock ; 

call GetKeyboardInput
call PrintString

jmp $

%include "Functions.asm"

times 2048-($-$$) db 0 