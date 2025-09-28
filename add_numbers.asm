section .text
    global add_numbers

add_numbers:
    ; Функция принимает два 32-битных целых числа в eax и edx, возвращает сумму в eax
    add eax, edx
    ret