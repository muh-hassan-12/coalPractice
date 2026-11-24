[org 0x0100]

jmp start       

data: dw   2, 4, 6, 5
swap: db   0    ; use this as a flag 

start: 
    

    outerloop: 
        mov  bx, 0                        ; instruction pointer to point the data
        mov  byte [swap], 0             ; why the "byte"? This will be used as a flag to indicate whether any swap happened during a sorting pass.
                                         ;  now we create this flag for swapping is perform or not through is zero and 1
        innerloop: 
            mov  ax, [data + bx]         ; in this line data move in ax throug bx 
            cmp  ax, [data + bx + 2]    ; why did we move the value to AX?  campare the data value and next value  
            
            jae  noswap                 ; if we don't have to swap, we just jump over the swap thing 
                                        ; if there is no equal and not below then  jump to noswap  if no equal and below then execute next line  
                ; the swap potion 
                mov  dx, [data + bx + 2]  ;  ; swap condition example a=b , b=c , a=c; now dx = 4  , ax = 2
                mov  [data + bx + 2], ax    ; again with the AX? [data + bx +2]  = 2    ,   [data+bx] = 4  now swaping is perform
                mov  [data + bx], dx         ;
                mov  byte [swap], 1 

            noswap:
            add  bx, 2                        ; if no need to swap or swap the data then instruction pointer jump to next data then comparission to all ramain data
            cmp  bx, 6                        ; stopp9ng condition for the inner loop
            jne  innerloop                    ; if bx =6 then it inner loop is terminate 

        ; if we didn't swap even once, we should be done 
        cmp  byte [swap], 1     ; don't need to load this in register?   
        je   outerloop 

        ; check outer loop termination 
        ; sub cx, 1            ;this compares the swap flag with 1. If no swaps occurred during the inner loop, the array is sorted, and the outer loop terminates.

        ; jnz outerloop       if zero flag is on then outer loop is terminate 


    ; exit system call 
    mov  ax, 0x4c00
    int  0x21



