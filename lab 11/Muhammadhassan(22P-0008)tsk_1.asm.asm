[org 0x100]
jmp start

multiplicand: dd 0x01FF          ; 9-bit multiplicand (stored in 32-bit space)
multiplier: db 3                 ; 9-bit multiplier (stored in a single byte, value 3)
result: dd 0                     ; 18-bit result stored in 32-bit space

start:
    mov cl, 9                    ; Initialize bit count to 9 (for 9-bit manipulation)
    mov al, [multiplier]         ; Load multiplier into al (8-bit register)

checkbit:
    shr al, 1                    ; Shift multiplier right, move LSB into carry
    jnc skip                     ; Skip addition if carry flag is 0

    ; Add multiplicand to the result
    mov ax, word [multiplicand]  ; Load lower 16 bits of multiplicand
    add word [result], ax        ; Add lower 16 bits to result
    mov ax, word [multiplicand+2]; Load upper bits of multiplicand
    adc word [result+2], ax      ; Add with carry to result upper bits

skip:
    ; Shift multiplicand left for next bit
    shl word [multiplicand], 1         ; Shift lower 16 bits of multiplicand left
    rcl word [multiplicand+2], 1       ; Rotate carry into upper bits of multiplicand

    dec cl                     ; Decrement bit count
    jnz checkbit               ; Repeat until all 9 bits are processed

    ; Terminate program
    mov ax, 0x4c00
    int 0x21
