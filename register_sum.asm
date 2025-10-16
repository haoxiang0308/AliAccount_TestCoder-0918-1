; x86汇编程序：使用寄存器计算和
section .data
    val1 dd 15          ; 第一个操作数
    val2 dd 25          ; 第二个操作数
    sum_result dd 0     ; 存储结果

section .bss

section .text
    global _start

_start:
    ; 从内存加载值到寄存器
    mov eax, [val1]     ; 加载第一个值到eax
    mov ebx, [val2]     ; 加载第二个值到ebx
    
    ; 执行加法运算
    add eax, ebx        ; eax = eax + ebx (计算和)
    
    ; 将结果存储到内存
    mov [sum_result], eax   ; 保存结果
    
    ; 退出程序
    mov eax, 1          ; 系统调用号 (sys_exit)
    xor ebx, ebx        ; 退出状态
    int 0x80            ; 调用内核