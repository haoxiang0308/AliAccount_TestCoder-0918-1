global _start

section .text
_start:
    ; write system call
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, msg        ; message address
    mov rdx, msg_len    ; message length
    syscall

    ; exit system call
    mov rax, 60         ; sys_exit
    mov rdi, 0          ; exit status
    syscall

section .data
    msg db 'Hello', 0xA ; message string with newline
    msg_len equ $ - msg ; length of the message string