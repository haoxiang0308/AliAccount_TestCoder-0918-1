section .text
    global add_numbers

; Function: add_numbers
; Takes two integer arguments and returns their sum
; Parameters: rdi (first number), rsi (second number)
; Returns: rax (sum)
add_numbers:
    mov rax, rdi    ; Move first argument to rax
    add rax, rsi    ; Add second argument to rax
    ret             ; Return with sum in rax