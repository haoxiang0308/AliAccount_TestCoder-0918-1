section .text
    global _start

; Функция сложения двух чисел
; Вход: EAX = первое число, EBX = второе число
; Выход: EAX = результат сложения
add_func:
    add eax, ebx
    ret

_start:
    ; Загружаем числа в регистры EAX и EBX
    mov eax, 5
    mov ebx, 3

    ; Вызываем функцию сложения
    call add_func

    ; Результат теперь в EAX (в данном случае, 8)

    ; Завершаем программу (Linux syscall)
    mov ebx, 0    ; статус выхода
    mov eax, 1    ; номер системного вызова (sys_exit)
    int 0x80      ; вызываем ядро