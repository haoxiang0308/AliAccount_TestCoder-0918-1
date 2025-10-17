; x86汇编程序 - 使用寄存器计算和
section .data
    ; 数据段（如果需要的话）

section .text
    global _start

_start:
    ; 将两个值加载到寄存器中并计算和
    mov eax, 15      ; 将15加载到EAX寄存器
    mov ebx, 25      ; 将25加载到EBX寄存器
    add eax, ebx     ; EAX = EAX + EBX (15 + 25 = 40)
    
    ; 结果现在在EAX寄存器中 (40)
    
    ; 程序退出
    mov eax, 1       ; 系统调用号 (sys_exit)
    mov ebx, 0       ; 退出状态
    int 0x80         ; 调用内核