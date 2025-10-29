; x86 Assembly program to calculate sum using registers
; This program adds values in registers and stores the result

section .data
    result_msg db 'The sum is: ', 0
    newline db 10, 0

section .bss
    result resb 4

section .text
    global _start

_start:
    ; Load values into registers
    mov eax, 10      ; First number in EAX
    mov ebx, 20      ; Second number in EBX
    mov ecx, 30      ; Third number in ECX
    mov edx, 40      ; Fourth number in EDX

    ; Calculate sum using registers
    add eax, ebx     ; EAX = EAX + EBX (10 + 20 = 30)
    add eax, ecx     ; EAX = EAX + ECX (30 + 30 = 60)
    add eax, edx     ; EAX = EAX + EDX (60 + 40 = 100)

    ; Store the result
    mov [result], eax

    ; Print result message
    mov eax, 4          ; sys_write system call
    mov ebx, 1          ; stdout
    mov ecx, result_msg ; message to write
    mov edx, 12         ; length of message
    int 0x80            ; call kernel

    ; Exit program
    mov eax, 1          ; sys_exit system call
    xor ebx, ebx        ; exit status 0
    int 0x80            ; call kernel