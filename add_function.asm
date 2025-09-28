section .text
global add_numbers

; Function: add_numbers
; Description: Adds two 32-bit integers passed as arguments.
; Arguments (cdecl calling convention):
;   - First integer at [esp + 4]
;   - Second integer at [esp + 8]
; Returns:
;   - Sum of the two integers in the EAX register

add_numbers:
    push    ebp         ; Save the old base pointer
    mov     ebp, esp    ; Set up new base pointer

    mov     eax, [ebp + 8]  ; Load the second argument into EAX
    add     eax, [ebp + 4]  ; Add the first argument to EAX

    pop     ebp         ; Restore the old base pointer
    ret                 ; Return, sum is in EAX