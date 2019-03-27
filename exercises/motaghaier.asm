; multi-segment executable file template.

data segment
    ; add your data here!
    
    a1 db 10  ;define byte=0-255 or -128 to 127  
    a2 db 1eh
    a3 db 11010001b
    a4 db 'A'  ;a4=65
    a5 db 20,25,30,35
    str1 db "hello"
    
    ;define word=2byte=16 bit,0-65535 or -32768 to 32767
    w1 dw 500
    w2 dw 1a5bh
    ;define double word=32bit, 0 to 2^32-1; -2^31 to 2^31-1 
    d1 dd 200000
    d2 dd 5a001b6eh 

     
     
     
    pkey db 10,13,"press 66 ",10,13,65,66,67,68,"any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax  ;mov ds,data
    mov es, ax ;es=ds=data
    ;*********************************************************
     push w1
     push w2 
     push word ptr d2
     push word ptr d2+2
     pop w1
     pop w2
     
     
    
    ;*********************************************************        
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
