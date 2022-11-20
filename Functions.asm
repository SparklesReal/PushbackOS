PrintString:
    push ax
    push bx ; puts stuff that we will use into the stack so we don't ruin our main file
    mov ah, 0x0e ; selects tele-type mode
    Loop: 
    cmp [bx], byte 0 ;  checks if bx aka the string is at EOS / ions  zero
    je Exit
        mov al, [bx] ; moves current char of bx / the string to al / char to type
        int 0x10 ; bios call to print
        inc bx ; goes to next char in string 
        jmp Loop ; jumps back to check if the next char is a EOS
    Exit:
    pop ax
    pop bx
ret

ClearScreen:
    pusha
    mov ax, 0003h  ; set mode 
    mov bh, 0x07   ;00010111b ;0x07   ; set mode: white on black
    mov cx, 0x000  ; row 0, column 0
    mov dx, 0x184f ; row 24 (0x18), col 79 (0x4f)
    int 0x10       ; call BIOS video interupt
    popa
ret

GetKeyboardInput:
Loop1:
    mov ah, 00h ; sets keyboard mode to get keystroke
    int 0x16 ; bios call to take input

    cmp al, 0x1C0D ; if al/input is 1C0D/enter
    je Exit1 ; then jump to exit

    mov ah, 0x0e ; selects tele-type mode
    int 0x10 ; does the interupt and prints the input
    mov [bx], al
    inc bx
jmp Loop1 ; loops
Exit1:
ret

WriteToDisk:
    pusha
    mov ah, 03h
    ; AL = Amount of sectors to write to
    ; CH = cylinder to write
    ; CL = What sector to start at
    ; DH = head number
    ; DL = driver number
    ; ES = what to write
    int 13
ret

  