; x86汇编程序 - 使用寄存器计算和
; 文件名: calc_sum_12345.asm

section .data
    ; 定义要相加的数字
    num1 dd 10
    num2 dd 20
    num3 dd 30
    num4 dd 40

section .bss
    ; 未初始化数据段
    result resd 1

section .text
    global _start

_start:
    ; 将数字加载到寄存器中并计算和
    mov eax, [num1]   ; 将num1加载到eax寄存器
    add eax, [num2]   ; 将num2加到eax寄存器
    add eax, [num3]   ; 将num3加到eax寄存器
    add eax, [num4]   ; 将num4加到eax寄存器
    
    ; 将结果保存到内存中
    mov [result], eax ; 将结果保存到result变量
    
    ; 程序退出
    mov ebx, 0        ; 退出状态码
    mov eax, 1        ; sys_exit系统调用号
    int 0x80          ; 调用内核