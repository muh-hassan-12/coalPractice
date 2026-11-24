[org 0x0100]

jmp start

flag: db 0

start:
mov ax,1


l1:
mov byte [flag],0      ; on when even number of ax
test ax ,1
jnz odd
mov byte [flag],1
odd:
add ax,1
cmp ax,10
jne l1

mov ax,0x4c00
int 0x21











