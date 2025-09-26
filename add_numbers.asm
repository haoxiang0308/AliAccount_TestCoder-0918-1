section .text
    global _start

; Функция для сложения двух чисел
; Принимает два аргумента в регистрах eax и ebx
; Результат сохраняется в регистре eax
add_func:
    add eax, ebx
    ret

_start:
    ; Загружаем числа для сложения в регистры
    mov eax, 5
    mov ebx, 10

    ; Вызываем функцию сложения
    call add_func

    ; Результат (15) теперь находится в регистре eax

    ; Выход из программы
    mov ebx, 0     ; Exit status
    mov eax, 1     ; Exit syscall number
    int 0x80       ; Вызов системной функции