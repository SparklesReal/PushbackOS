[bits 16]
[org 0x7c00]

section .data
    TestingString:
    db "Burr ",0

section .text
    global _start
    _start:

    mov eax, cr0
    and eax, 0x7FFFFFFe
    mov cr0, eax

    mov [BOOT_DISK], dl

    mov bp, 0x7c00 ; selects what parts of the memory the program uses
    mov sp, bp

    call ReadDisk ; Calls ReadDisk function from the DiskRead.asm file
    call ClearScreen ; Calls ClearScreen from Sector 1\Functions

    call GetSpecs

    mov bx, TestingString
    call PrintString

    jmp PROGRAM_SPACE ; jump to PROGRAM_SPACE = 0x7e00 -> ExtendedProgram

    %include "Functions.asm" 
    %include "Sector 1\DiskRead.asm"

    times 510-($-$$) db 0
    dw 0xaa55 ; magic boot code