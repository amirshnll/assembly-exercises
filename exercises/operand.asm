; multi-segment executable file template.

data segment
    ; add your data here!  
    a1 db 10,15,-20,200
    a2 db 5,17,12,1
    
    pkey db "press any key...$"
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

    ; add your code here  
    mov al,10  ;10=immediate
    mov al,bl   ;register
    ; access to array
    mov al,a1   ;dircet access to memory=mostaghim hafeze  ;al=10
   ;
    mov al,[a1+1]; mostaghim+offset; al=15
    mov al,[a1+2]    ;al=-20
    mov al,[a1+3]     ;al=200
                     
    ;indirect register access
    lea bx,a1   ;bx=offset a1
    mov cl,[bx] ;cl=10
    inc bx
    mov cl,[bx] ; cl=15
    ;direct+base or index; bx,bp,si,di
    mov si,1
    mov dl,[a1+si] ; mov dl,a1[si] dl=15
                      
    ;base+index
    lea bx,a1
    mov si,1
    mov dl,[bx+si]; dl=15
    ;base+index+offset
    lea bx,a1
    mov si,1
    mov dl,[bx+si+1] ;dl=-20 
    ;
    lea si,a1
    lea di,a2
    ;mov [si],[di] ;mov a1,a2
    mov al,[di]
    mov [si],al
    
            
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
