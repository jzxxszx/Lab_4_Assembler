data segment
    S dw ? 
    N dw ? 
    A dw ?
    perenos db 13,10,"$"
    vvod_N db 13,10,"Vvedite N=$" 
    vivod_S db "S=$" 
ends
stack segment
    dw 128 dup(0) 
ends
code segment
start:
    mov ax, data 
    mov ds, ax   
    mov es, ax
     
    xor ax, ax 
    mov dx, offset vvod_N 
    mov ah, 9 
    int 21h
      
    mov ah, 1 
    int 21h 
    sub al, 30h 
    cbw 
    mov N, ax    
    
        mov cx, N
    mov ax, 3 
    mov bx, 5
    mov dx, 3 
@repeat:
    add ax, bx 
    add bx, dx
    add dx, 1
     
    loop @repeat  
    
        mov S, ax  
    
    mov dx, offset perenos
    mov ah, 9
    int 21h 
    
    mov dx, offset vivod_S
    mov ah, 9 
    int 21h
    
    mov ax, S 
    
Lower:
    push -1 
    mov cx, 10 
    
L1:
    mov dx, 0
    div cx
    push dx 
    cmp ax, 0 
    jne L1 
    mov ah, 2 
L2:
    pop dx
    cmp dx, -1
    je sled8
    add dl, 30h
    int 21h 
    jmp L2 
sled8:
    mov dx, offset perenos
    mov ah, 9
    int 21h
     
    mov ah, 1
    int 21h
     
    mov ax, 4c00h
    int 21h
ends
end start 
