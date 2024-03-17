[BITS 16]
[ORG 0x7C00]

mov ax, 0x0000
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0xFFFF

mov ah, 0x0E
mov al, 'B'
int 0x10

mov si, hello_string
call print_string

jmp $

hello_string db 'Hello, World!', 0

print_string:
    mov ah, 0x0E
.next_char:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .next_char
.done:
    ret

times 510-($-$$) db 0
dw 0xAA55
