include 'emu8086.inc'
ORG 100h
input:   

; number A
mov ah, 1
int 21h
sub al, 30h
mov bl, 100
;mov ah, 0 
mul bl 
mov cx, ax ; hang tram   

mov ah, 1
int 21h
sub al, 30h
mov bl, 10
mov ah, 0 
mul bl 
add cx, ax ; hang chuc 


mov ah, 1
int 21h
sub al, 30h
mov ah, 0
add cx, ax 
; kiem tra dieu kien cua a  

cmp cx, 100 ; check a > 99
jl false
cmp cx, 999 ; check a < 999
jge false
mov bl, 2
mov al, cl
div bl 
cmp ah, 0 ; check odd A
je false  

; number B
mov ah, 1
int 21h
sub al, 30h
mov bl, 100
mov ah, 0 
mul bl 
mov dx, ax ; b 1xx
mov ah, 1
int 21h
sub al, 30h
mov bl, 10
mov ah, 0 
mul bl 
add dx, ax ; b x1x
mov ah, 1
int 21h
sub al, 30h
mov ah, 0 
add dx, ax ; b xx1

cmp dx, 100 ; check b > 99
jl false
cmp dx, 999 ; check b < 999
jge false ; a store in CX register, b store in DX register

false:
    mov ah, 2 
    mov dl, 46h
    int 21h
    mov cx, 0
    jmp input
; so  sanh 2 so A va B  
cmp cx, dx ; so sanh tim max    
Jl inramaxB:
jg inramaxA:

InramaxA:
    mov ax,cx
    mov bl,100
    div bl 
    mov dh, ah 
    mov bh, al
    mov dl, al 
    add dl, 30h
    mov ah, 2
    int 21h 
    mov al, dh  
    mov ah, 0  
    mov bl, 10
    div bl    
    mov dh, ah 
    add bh, al 
    mov dl, al
    add dl, 30h
    mov ah, 2 
    int 21h     
    mov dl, dh
    add bh, dh 
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
    
InramaxB:   
PRINTCX:
MOV BX, Dx
MOV bl, 100
DIV DL
MOV Dh, Ah
MOV bh,al
mov dl,al
MOV DL, 10 
DIV DL
MOV CL, AH
ADD CH, AL 
ADD AX, 3030H 
MOV BX, AX 
MOV AH, 2
MOV DL, BL 
INT 21H   
MOV DL, BH
INT 21H 
MOV AH, 0
MOV AL, DH 
MOV DH, 10 
DIV DH 
ADD CL, AL
ADD CL, AH
ADD AX, 3030H 
MOV BX, AX 
MOV AH, 2
MOV DL, BL 
INT 21H   
MOV DL, BH
INT 21H
MOV AX, 0000H
MOV AL, CL
MOV CL, 10
DIV CL

MOV BX, AX
ADD BX, 3030H
MOV DL, BL
MOV AH, 2
INT 21H
MOV DL, BH
MOV AH, 2
INT 21H
MOV AH, 2

  
