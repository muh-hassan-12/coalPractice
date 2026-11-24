[org 0x0100]
jmp start

multiplicand: dd 0x01FF          ; 9-bit multiplicand (stored in 32-bit space)
multiplier: dw 0x01FF            ; 9-bit multiplier (stored in 16-bit space)
result: dd 0                     ; 18-bit result stored in 32-bit space

start:
    mov cl, 9                    ; initialize bit count to 9 (for 9-bit manipulation)
    mov dx, [multiplier]         ; load multiplier into dx

checkbit:
    shr dx, 1                    ; shift multiplier right, move LSB into carry
    jnc skip                     ; skip addition if carry flag is 0

    ; Add multiplicand to the result
    mov ax, word [multiplicand]  ; load lower 16 bits of multiplicand
    add word [result], ax        ; add lower 16 bits to result
    mov ax, word [multiplicand+2]; load upper bits of multiplicand
    adc word [result+2], ax      ; add with carry to result upper bits

skip:
    ; Shift multiplicand left for next bit
    shl word [multiplicand], 1         ; shift lower 16 bits of multiplicand left
    rcl word [multiplicand+2], 1       ; rotate carry into upper bits of multiplicand

    dec cl                     ; decrement bit count
    jnz checkbit               ; repeat until all 9 bits are processed

    ; Terminate program
    mov ax, 0x4c00
    int 0x21
