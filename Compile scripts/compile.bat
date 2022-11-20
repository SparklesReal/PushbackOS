cd ..
nasm "Sector 1\bootloader.asm" -f bin -o "flp\bootloader.bin"

nasm "Sector 2+\ExtendedProgram.asm" -f bin -o "flp\ExtendedProgram.bin"

copy /b "flp\bootloader.bin"+"flp\ExtendedProgram.bin" "flp\bootloader.flp"

qemu-system-x86_64 "flp\bootloader.flp"
pause