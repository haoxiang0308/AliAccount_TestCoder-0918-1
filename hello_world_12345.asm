global _start

section .text
_start:
    ; write system call
    mov rax, 1          ; system call number (sys_write)
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, msg        ; message to write
    mov rdx, msg_len    ; number of bytes
    syscall

    ; exit system call
    mov rax, 60         ; system call number (sys_exit)
    mov rdi, 0          ; exit status
    syscall

section .data
msg: db 'Hello', 0xA    ; message string with newline
msg_len: equ $ - msg    ; length of the message string