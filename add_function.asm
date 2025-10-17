section .text
    global add_numbers

; Function to add two numbers
; Takes two integer arguments in registers eax and ebx
; Returns the sum in eax
add_numbers:
    add eax, ebx      ; Add ebx to eax
    ret               ; Return with result in eax