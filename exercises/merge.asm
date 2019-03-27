; multi-segment executable file template.
 include emu8086.inc
data segment
    ; add your data here!
    msg1 db 10,13,"please enter a string:$"
    s1 label byte
    max1 db 80 
    len1 db ?
    s1_1 db 80 dup('$')
     
    s2 label byte
    max2 db 80 
    len2 db ?
    s2_2 db 80 dup('$')  
    msg2 db 10,13,"merge is:$"
    
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
    print_string msg1
    read_string s1
    
    print_string msg1
    read_string s2
    lea si,s2_2
    lea di,s1_1
    mov cl,len1
    mov ch,0
    add di,cx  
    mov [di],' '
    inc di
    mov cl,len2
    rep movsb
    
    print_string msg2
    print_string s1_1
            
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
