section .text
    global _start

; Функция для сложения двух чисел
; Вход: EAX = первое число, EBX = второе число
; Выход: EAX = результат сложения
add_numbers:
    add eax, ebx
    ret

; Точка входа в программу
_start:
    ; Загружаем числа в регистры EAX и EBX
    mov eax, 5
    mov ebx, 10

    ; Вызываем функцию сложения
    call add_numbers

    ; Сохраняем результат в EAX в регистр ECX
    mov ecx, eax

    ; Простой выход из программы
    mov eax, 1      ; системный вызов sys_exit
    xor ebx, ebx    ; код возврата 0
    int 0x80        ; вызов ядра