[org 0x0100]

jmp start
myName: db 'h' ,'a','s','a','n';
mask  : db 207 ,223,223,223,215
upper : db 0
start:
mov bx,0
mov cx ,5

l1:

mov dl,byte[mask+bx]
mov al,byte[myName+bx]
AND al, dl
mov byte[upper+bx],al

add bx,1
sub cx,1
jnz l1



mov ax, 0x4c00
int 0x21

