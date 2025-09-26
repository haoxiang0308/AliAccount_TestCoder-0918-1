section .text
    global add_numbers

; Функция: add_numbers
; Описание: Складывает два 32-битных целых числа
; Параметры: 
;   - eax: первое число
;   - ebx: второе число
; Результат:
;   - eax: сумма
add_numbers:
    add eax, ebx    ; Складываем содержимое ebx к eax
    ret             ; Возвращаемся из функции, результат в eax