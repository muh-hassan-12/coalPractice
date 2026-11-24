; "Miss, I submitted this task late because initially, I was not registered for this course due to a degree transfer. Then I had clashes in my schedule
;, and because of sessional exams, they couldn’t be resolved."


[org 0x0100]

                 ; start of code 

mov  ax, [num1]              
mov  bx, [num1 + 2] 
add  ax, bx
add  bx, [num1 + 4]
add  ax, bx
mov  ax, [num1 + 6]  

mov ax, 0x4c00
int 0x21


num1 : dw 5, 10, 15, 0
       
               




; watch the listing carefully 