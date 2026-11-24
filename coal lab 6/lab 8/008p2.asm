
[org 0x0100]

jmp start ;  in this case we use the unconditional jump if i data define in first now excute fromstart label 
num1:  dw 10 ,20,30,40,50,10,20,30,40,50
result: dw 0

start:
mov ax, 0      ;initialize ax 0
mov bx, 0      ;initialize bx 0    

l1:                 ;jum label
add ax ,[num1+bx]   ; ax store the num1 data and add 
add bx  ,2          ; now bx store value multiple of 2
cmp  bx, 20         ;compre bx & 20 this is stopping condition when bx and 20 is equal then loop is terminate
jne l1              ; conditional jump according to loop conditional

mov [result],ax     ; ax total sum of num1 value store in result location
mov ax, 0x4c00      ; program exit program
int 0x21            ;interupt call





;mov bx, 0
;mov ax, 0;
;l1:
;add ax ,[num1+bx]
;add bx  ,2
;cmp  bx, 20
;jne l1

;mov [total],ax
;mov ax, 0x4c00
;int 0x21

;num1:  dw 10 ,20,30,40,50,10,20,30,40,50
;total: dw 0