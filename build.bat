nasm -f bin bootloader.asm -o bootloader.bin
copy /b bootloader.bin+main.js os-image
