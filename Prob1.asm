Input:
    
    mov ah, 1
    int 21h 
    sub al, 30h 
    mov cl, 10 
    mul cl 
    mov bl, al 
    mov ah, 1
    int 21h 
    sub al, 30h 
    add bl, al 
    mov ch,bl
    
KiemTra: 
     cmp ch,8h    
     jLe false   
     cmp ch,16h  
     jge false
     jmp true  
 
false:  
     mov ah,2
     mov dl,46h
     int 21h   
     jmp Input 
     
True:   
     mov ah,1
     int 21h    
     sub al,30h
     mov cl,al  
     inc bh 
     ;mov dl,01h 
     cmp bh ,ch   
     JL countinc 
     JE exit
     

countinc: 
     ;mov dl,01h 
     ;inc bh 
     jmp True
     mov ah,2
     mov dl,cl
     int 21h               
     
;Y cau display the x value in decimal form  

Decimal:  
    mov bx,000100001b
    shr bx,1
    add dl, 30h
    int 21h   
    mov al, bh
    mov ah, 0 
    mov bl, 10
    div bl
    mov ch, ah 
    mov dl, al
    add dl, 30h
    mov ah, 2
    int 21h
    mov dl, ch 
    add dl, 30h
    int 21h  
     
exit: 
ret
