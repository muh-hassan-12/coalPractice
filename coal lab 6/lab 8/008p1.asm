
[org 0x0100]         ; Set origin for COM file

mov bx, 0            ; Initialize offset register BX to 0
mov ax, 0            ; Initialize accumulator AX to 0

l1:
add ax, [num1 + bx]  ; Add the current element in num1 to AX
add bx, 2            ; Move to the next element (each word is 2 bytes)
cmp bx, 20           ; Check if BX has reached the end (10 elements * 2 bytes)
jne l1               ; Repeat loop until BX reaches 20

mov [total], ax      ; Store the result from AX into 'total'
mov ax, 0x4c00       ; DOS interrupt exit code
int 0x21             ; Call interrupt to terminate program

num1: dw 10,20,30,40,50,10,20,30,40,50  ; Data array
total: dw 0                             ; Storage for result