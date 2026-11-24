[org 0x0100]



start:
 
    mov al, 5      
    mov bl, 6      
    mov cl, 7      

   
    or al, 0x30    
    or bl, 0x30    
    or cl, 0x30    
    
  
    mov dl, al   
    mov ah, 2      
    int 0x21     

    mov dl, bl    
    mov ah, 2      
    int 0x21       

    mov dl, cl     
    mov ah, 2      
    int 0x21       

   
    mov ax, 0x4c00 
    int 0x21