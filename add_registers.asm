section .data
    num1 dd 10          ; 定义第一个数
    num2 dd 20          ; 定义第二个数
    result dd 0         ; 存储结果

section .text
    global _start

_start:
    ; 将两个数加载到寄存器中
    mov eax, [num1]     ; 将num1的值加载到eax寄存器
    mov ebx, [num2]     ; 将num2的值加载到ebx寄存器
    
    ; 计算和
    add eax, ebx        ; eax = eax + ebx
    
    ; 将结果存储到内存
    mov [result], eax   ; 将eax的值存储到result位置
    
    ; 程序退出
    mov eax, 1          ; sys_exit系统调用号
    xor ebx, ebx        ; 退出状态码
    int 0x80            ; 调用内核