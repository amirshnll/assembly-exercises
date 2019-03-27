; multi-segment executable file template.

data segment
    ; add your data here!  
    
    ary1 db 20,40,60,70
    
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

    ; operand types
    ;1-emmediate operand
    mov al,10 ;10=emmidiate
    ;2-register
    mov al,bl
    ;3-direct memory access
    mov al,ary1
    ;4-direct+offset
    mov bl,[ary1+1]   ;bl=40 
    mov cl,[ary1+2]
    mov dl,[ary1+3]
    ;5-indirect register access
    lea bx,ary1
    mov al,[bx]; al=20
    inc bx
    mov cl,[bx] ;cl=40
    ;6- index+base =base=bx,bp, index=si,di
    lea bx,ary1
    mov si,2
    mov al,[bx+si]  
    ;7-direct+base or index
    mov si,2
    mov al,ary1[si]
    ;8-base+index+offset
    lea bx,ary1
    mov si,1
    mov al,[bx+si+1]   
    ; bejoz in 8 ravesh az chize digari estefade nakonid.
            
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
