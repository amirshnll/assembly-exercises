; multi-segment executable file template.
 ;dariaft digit
 
data segment
    msg1 db 10,13,"please enter a digit:$"
    
    s1 label byte
       max db 6
       len db ?
    s1_1 db 6 dup('$')
    
    n dw 0
    s2 db 20 dup('$')
    ten dw 10  
    mabna dw 16
    msg2 db 10,13,"mabna is:$"
    pkey db 10,13,"press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; 1- chap msg1
    lea dx,msg1
    mov ah,9
    int 21h
    ;2- darift digit as string
    lea dx,s1
    mov ah,0ah
    int 21h   
    ;3- convert string to digit
    mov si,0  
    mov ax,0
    mov cl,len
    mov ch,0   ; cx=len
    f1:jcxz ef1
       mov bl,s1_1[si]
       sub bl,48
       mov bh,0
       mul ten  ; ax=ax*ten 
       add ax,bx;ax=ax*10+bx
       inc si
    loop f1
    ef1:  
    mov n,ax 
    lea dx,msg2
    mov ah,9
    int 21h
    ;convert digit to string
    mov ax,n
    mov cx,0
    w1: cmp ax,0
        je ew1
        mov dx,0
        div mabna
        add dx,48
        cmp dx,58 
        jl l3
        add dx,7
        l3:push dx
        inc cx
        
    jmp w1
    ew1:
    mov si,0
    f2: jcxz ef2
        pop dx 
        
        mov s2[si],dl
        inc si
    loop f2
    ef2: 
    
    lea dx,s2
    mov ah,9
    int 21h
               
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
