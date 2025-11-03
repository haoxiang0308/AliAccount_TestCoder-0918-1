section .text
    global add_numbers

; Function to add two numbers
; Takes two integer arguments in EAX and EBX registers
; Returns sum in EAX register
add_numbers:
    add eax, ebx    ; Add EBX to EAX, result in EAX
    ret             ; Return to caller