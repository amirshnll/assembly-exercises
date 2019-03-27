; multi-segment executable file template.
 ;dariaft digit
 
data segment
    msg1 db 10,13,"please enter a digit:$"
    
    s1 label byte
       max db 6
       len db ?
    s1_1 db 6 dup('$')
    
    n dw 0
    
    ten dw 10
    msg2 db 10,13,"binary is:$"
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
    mov cx,16
    f2:    
       rol n,1
       jc l1
       mov dl,'0'
       mov ah,2
       int 21h
       jmp l2
       l1:  
         mov dl,'1'
         mov ah,2
         int 21h
       l2:
    loop f2
    
               
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
