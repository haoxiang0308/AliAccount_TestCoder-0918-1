section .data
    hello_msg db 'Hello', 0

section .text
    global _start

_start:
    ; write syscall
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, hello_msg  ; message to write
    mov edx, 5          ; number of bytes to write
    int 0x80            ; call kernel

    ; exit syscall
    mov eax, 1          ; syscall number for sys_exit
    mov ebx, 0          ; exit status
    int 0x80            ; call kernel