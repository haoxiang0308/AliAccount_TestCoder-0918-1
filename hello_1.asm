section .data
    hello db 'Hello', 0

section .text
    global _start

_start:
    ; write syscall
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, hello      ; message
    mov edx, 5          ; length
    int 0x80            ; call kernel

    ; exit syscall
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit status
    int 0x80            ; call kernel