[org 0x0100]
jmp start                    ; this line is indiacate that jump unconditional 

data: dw  6, 4, 5, 2         ; define data with 2 byte      


start:                                ; now code strat from this line 
    mov  cx, 4                        ; make 4 passes, has to be outside the loop! to outer loop iteration

    outerloop: 
        mov  bx, 0                    ;now set bx as a use for instruction pointer 
        
        innerloop: 
            mov  ax, [data + bx]      ; now first value comparet the all data set 
            cmp  ax, [data + bx + 2]    ; why did we move the value to AX?Camparission in first iteration 6&4 then 6-4 =2 then it is not below and not equal 

            jbe  noswap                 ; if we don't have to swap, we just jump over the swap thing   
                                        ; think of this as the "if"  one flag in carry falg and zero is on then jump noswap label

                ; the swap potion 
                mov  dx, [data + bx + 2]  ; swap condition example a=b , b=c , a=c; now dx = 4  , ax = 6
                mov  [data + bx + 2], ax    ; again with the AX?       [data + bx +2]  = 6    ,   [data+bx] = 4  no swaping is perform 
                mov  [data + bx], dx

            noswap:                      
            add  bx, 2                   ; no swaping then instruction pointer move with two jump    
            cmp  bx, 6                   ; stopping condition for the inner loop       
            jne  innerloop               ; if bx pointer value and 6 is equal then terminate loop if it is not equalt then jump to inner loop 

        ; check outer loop termination 
        sub cx, 1                        ; outer loop is stopping condition  cx -1  =4-1 =3
        jnz outerloop                    ; if zero flag is zero then outer loop is terminate     


    ; exit system call 
    mov  ax, 0x4c00
    int  0x21



