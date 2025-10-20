; x86汇编程序：使用寄存器计算和

section .data
    result_msg db 'Sum of registers: ', 0
    newline db 10, 0

section .bss
    sum resb 4

section .text
    global _start

_start:
    ; 初始化一些寄存器值
    mov eax, 10      ; 将10放入EAX
    mov ebx, 20      ; 将20放入EBX
    mov ecx, 30      ; 将30放入ECX
    mov edx, 40      ; 将40放入EDX

    ; 计算所有寄存器的和
    add eax, ebx     ; EAX = EAX + EBX = 10 + 20 = 30
    add eax, ecx     ; EAX = EAX + ECX = 30 + 30 = 60
    add eax, edx     ; EAX = EAX + EDX = 60 + 40 = 100

    ; 将结果保存到内存
    mov [sum], eax

    ; 退出程序
    mov eax, 1       ; sys_exit系统调用号
    mov ebx, 0       ; 退出状态
    int 0x80         ; 调用内核