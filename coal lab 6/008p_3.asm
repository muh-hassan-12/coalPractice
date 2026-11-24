[org 0x0100]

mov ax, 0        ; to 0 initialize 
mov bx, 0        ;to store the num1 value 
mov cx, 5        ; to iteration for loop

l1:
mov ax,[num1+bx]   ; triverse the num1 data in ax through bx offset
add bx,2           ;now instruction pointer jump 1 bute in memory
cmp cx,ax          ; stopping condition for the loop if we found 5 in the code then loop is terminate
jne l1            ; zero flag is on then loop is terminate

mov ax, 0x4c00     ; exit call
int 0x21           ; interept call


num1: dw 1,2,3,4,5,6,7






