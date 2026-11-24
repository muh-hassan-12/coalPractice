;"Miss, I submitted this task late because initially, I was not registered for this course due to a degree transfer. Then I had clashes in my schedule, and because of sessional exams, they couldn’t be resolved."



[org 0x0100]                     

day db 15                     
month db 8                      
year_part1 db 20               
year_part2 db 23              

total db 0                       
count db 0                       

hassan:                    
    
    mov al, [day]               
    add al, [month]             
    add al, [year_part1]        
    add al, [year_part2]        

    mov [total], al             

    cmp al, 0                  
    je zero_flag_set           

    jmp hassan               

zero_flag_set:                  ; 
 
    

    mov ax, 0x4C00             
    int 0x21                   


; 1. Instruction Display:
;    - Shows the current assembly instructions being executed (e.g., ADD, INC).

; 2. CPU Registers:
;    - Displays the values of registers like AX, BX, CX, and SP.

; 3. CPU Flags:
;    - Shows the status of flags like Zero Flag (ZF), Carry Flag (CF), and Sign Flag (SF).

; 4. Memory Dump:
;    - Hexadecimal view of memory contents at specific addresses.

; 5. Instruction Pointer:
;    - Indicates the next instruction to be executed, shown by the IP register.
