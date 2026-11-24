[org 0x0100]

mov ax, 0              ;to triverse num1 data
mov bx, 0              ;to instruction pionter
mov cx, 0              ;to triverse num2 data

l1:
mov ax, [num1+bx]      ; now store the data line by line for num1 
mov cx, [num2+bx]      ; now to store the data of num2 to line by line 
add bx, 2
cmp ax,cx              ; to check the num1 data and num2 are same if the data is not then loop is terminate
je l1

mov ax, 0x4c00         ; exit call
int 0x21               ; interapt call


num1: dw 1,2,3,4,5,8,7
num2: dw 1,2,3,4,6,8,7



; for the logic of this code num1 and num2 data is not same order and element 





