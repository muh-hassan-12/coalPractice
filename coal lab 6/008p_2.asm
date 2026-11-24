[org 0x0100]

mov ax, 0xffff          ; Initialize ax to 0xFFFF
mov bx,0
l1:
mov dx, [num1+bx]        ; Move the first word of num1 into DX
add bx, 2
cmp dx, ax              ; Compare AX with DX
jnc l1                   ; Jump if carry (AX < DX) to terminate the loop

mov ax, 0x4c00          ; Exit with code 0
int 0x21                ; Call DOS interrupt to terminate program

section .data           ; Define data section
num1 dw 0xffff, 0xfffe  ; Define num1 as two 16-bit words