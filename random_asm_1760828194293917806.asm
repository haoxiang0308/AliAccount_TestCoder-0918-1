; x86汇编程序：使用寄存器计算和并保存结果
section .data
    result_msg db 'Sum of registers: ', 0
    newline db 10, 0

section .bss
    sum resb 4

section .text
    global _start

_start:
    ; 初始化一些寄存器值用于演示
    mov eax, 10      ; 将10放入EAX寄存器
    mov ebx, 20      ; 将20放入EBX寄存器
    mov ecx, 30      ; 将30放入ECX寄存器
    mov edx, 40      ; 将40放入EDX寄存器
    
    ; 计算寄存器的和
    add eax, ebx     ; EAX = EAX + EBX = 10 + 20 = 30
    add eax, ecx     ; EAX = EAX + ECX = 30 + 30 = 60
    add eax, edx     ; EAX = EAX + EDX = 60 + 40 = 100
    
    ; 将结果保存到内存
    mov [sum], eax
    
    ; 退出程序
    mov eax, 1       ; sys_exit系统调用号
    mov ebx, 0       ; 退出状态
    int 0x80         ; 调用内核