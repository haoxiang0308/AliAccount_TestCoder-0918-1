section .data
    result db 0          ; 存储结果的变量

section .text
    global _start

_start:
    ; 使用寄存器进行加法运算
    mov eax, 10         ; 将10加载到EAX寄存器
    mov ebx, 20         ; 将20加载到EBX寄存器
    add eax, ebx        ; EAX = EAX + EBX (10 + 20 = 30)
    
    ; 将结果存储到内存中
    mov [result], eax   ; 将EAX的值存储到result变量中
    
    ; 程序退出
    mov eax, 1          ; sys_exit系统调用号
    mov ebx, 0          ; 退出状态码
    int 0x80            ; 调用内核