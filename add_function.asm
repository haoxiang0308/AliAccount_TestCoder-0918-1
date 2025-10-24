section .text
    global add_numbers

; Function: add_numbers
; Parameters: two integers passed in eax and ebx registers
; Returns: sum in eax register
add_numbers:
    add eax, ebx      ; Add ebx to eax
    ret               ; Return with result in eax