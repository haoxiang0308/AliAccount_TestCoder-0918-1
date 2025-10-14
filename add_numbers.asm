section .text
    global _start

_start:
    ; Складываем два числа, хранящиеся в регистрах eax и ebx
    ; Результат сохраняем в eax
    mov eax, 5      ; Загружаем первое число в eax
    mov ebx, 3      ; Загружаем второе число в ebx
    add eax, ebx    ; Складываем ebx с eax, результат в eax

    ; Выход из программы
    ; На Linux системах вызов системной функции exit
    mov ebx, 0      ; Код возврата
    mov eax, 1      ; Номер системного вызова (sys_exit)
    int 0x80        ; Вызов ядра