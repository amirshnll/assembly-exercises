; multi-segment executable file template.

data segment
    ; add your data here!  
    x db 10
    y db 100
    z dw 12efh
    k dd 12005e32h
   ; q dq 0    
    
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
   
    mov al,byte ptr z
    mov bl,byte ptr z+1
    mov cx, word ptr k
    
    mov dx, word ptr k+1 ;dx=005e
   
    mov word ptr k+2,5a00h
           
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
