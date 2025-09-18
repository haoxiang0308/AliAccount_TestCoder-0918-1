section .data
    hello db 'Hello', 0xA, 0  ; 'Hello' followed by newline and null terminator

section .text
    global _start

_start:
    ; write system call
    mov eax, 4        ; sys_write
    mov ebx, 1        ; stdout
    mov ecx, hello    ; message to write
    mov edx, 6        ; message length
    int 0x80          ; call kernel

    ; exit system call
    mov eax, 1        ; sys_exit
    mov ebx, 0        ; exit status
    int 0x80          ; call kernel