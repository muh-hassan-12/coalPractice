;"Miss, I submitted this task late because initially, I was not registered for this course due to a degree transfer. Then I had clashes in my schedule
;, and because of sessional exams, they couldn’t be resolved."

[org 0x0100]

mov al, [num1]
mov [num1 + 1], al

mov ah, [num1 + 1]
add [num1 + 1], al

mov ah, [num1 + 1]
add [num1+1], ah

mov ax, 0x4c00
int 0x21

num1: db 5, 10, 15, 0


