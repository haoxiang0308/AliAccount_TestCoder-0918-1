section .text
    global add_numbers

; Function to add two numbers
; Receives two integers in EAX and EBX, returns sum in EAX
add_numbers:
    add eax, ebx      ; Add EBX to EAX, result in EAX
    ret               ; Return to caller