; multi-segment executable file template.
;chap paiam dar (10,10), khandan harf, namaiesh harf dar makan 12,15
; 20 bar be range zard roie zamine sefid   


data segment
    ; add your data here!  
    str1 db 10,13,"please enter a character:$"
    harf db ?
    rang db 01111110b 
    
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
     ;goto(10,10)
     mov dh,10
     mov dl,10
     mov bh,0
     mov ah,2
     int 10h
     ;chap msg1
     lea dx,str1
     mov ah,9
     int 21h
    ;khandane harf
    mov ah,1
    int 21h
    mov harf,al
     ;goto(12,15)
     mov dh,12
     mov dl,15
     mov bh,0
     mov ah,2
     int 10h
     ;chap harf rangi 20 bar
     mov al,harf
     mov bl,rang
     mov bh,0
     mov cx,20
     mov ah,9
     int 10h 
     
            
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
