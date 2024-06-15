[bits 16]
[org 0x7c00]
PROGRAM_SPACE equ 0x7e00 ; macro PROGRAM_SPACE to 0x7e00

%include "Functions.asm"
%include "Sector 1/DiskRead.asm"

section .data
    TestingString:
    db "Test complete", 0

section .text
    global _start
    _start:

    mov [BOOT_DISK], dl

    mov bp, 0x7c00 ; selects what parts of the memory the program uses
    mov sp, bp

    call ClearScreen ; Calls ClearScreen from Functions
    call ReadDisk ; Calls ReadDisk function from the DiskRead.asm file

    mov bx, TestingString
    call PrintString

    jmp PROGRAM_SPACE ; jump to PROGRAM_SPACE = 0x7e00 -> ExtendedProgram

    times 510-($-$$) db 0
    dw 0xaa55 ; magic boot code