



                                                         ; for the xor masking 
[org 0x0100]
mov al, 0x05      ; AL = 0000 0101 (binary)
xor al, 0x08      ; AL = AL ^ 0x08 (0000 0101 ^ 0000 1000)
                 
mov ax,0x4c00
int 0x21









                                                          ; for the or masking 

;[org 0x0100]


;mov al, 0x05     
;or al, 0x08      
                  
;mov ax 0x4c00
;int 0x21



                                                                ; for the test masking







;[org 0x0100]                                                    ; Specify the origin

;start:                                                          ; now code start


;mov ax, 1                                                       ; Initialize ax to 1
;mov bx, 0                                                       ; Initialize bx (sum) to 0 use for sum variable
;loop_start:                                                     ; Start of the loop
;test ax, 1                                                      ; if ax is odd by testing the least significant bit
;jnz skip_sum                                                    ; If ax is odd, jump to skip_sum to this label

                                                                 ;If ax is even
;add bx, 2                                                       ; Add 2 to bx (sum)
;skip_sum:
;add ax, 1                                                       ; Increment ax by 1
;cmp ax, 10                                                      ; Compare ax with 10
;jna loop_start                                                  ;  If ax is not above to 10, repeat the loop

mov ax, 0x4c00                                                   ; Prepare for exit (INT 21h function 4Ch)
int 0x21






                                                                  ;for the and masking



;[org 0x0100]

;jmp start

;start:

;mov dl,00000001b
;mov al,8

;and dl,al ;  to check the last bit is on or not 

;mov ax,0x4c00
;int 0x21





