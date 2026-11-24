[org 0x0100]

jmp start

data: dw 40, 13 ,20,23,10
swap: db 0

bubbleSort:
  dec cx
  shl cx, 1

mainloop: 
mov si, 0                                  ; initialize array index to zero
 mov byte [swap], 0                        ; reset swap flag to no swaps
innerloop:
mov ax, [bx+si]                            ; load number in ax
 cmp ax, [bx+si+2]                         ; compare with next number
 jbe noswap                                ; no swap if already in order

 mov dx, [bx+si+2]                         ; load second element in dx
 mov [bx+si], dx                           ; store first number in second
 mov [bx+si+2], ax                         ; store second number in first
 mov byte [swap], 1  
                                           ; flag that a swap has been done
noswap: 
add si, 2                                  ; advance si to next index
 cmp si, cx                                ; are we at last index
 jne innerloop                             ; if not compare next two

 cmp byte [swap], 1                        ; check if a swap has been done
 je mainloop                               ; if yes make another pass
 ret


start:
mov cx , 5
mov bx , data

call bubbleSort

mov ax ,0x4c00
int 0x21
