; multi-segment executable file template.

data segment
    ; add your data here! 
    msg1 db "please enter a string:$"
    msg2 db 10,13,"to upper is:$"
    s1 label byte
        max1 db 40
        len1 db ?
    s1_1 db 40 dup('$')
    
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

    ; 1-chap msg1
    lea dx,msg1
    mov ah,9
    int 21h
    ;2- read s1
    lea dx,s1
    mov ah,0ah
    int 21h
    ;3-****** loop convert to upper case ************
    mov cl,len1
    mov ch,0
    mov si,0
    for2:jcxz efor2
         push cx
         cmp s1_1[si],'a'
         jb l1
         cmp s1_1[si],'z'
         ja l1
         sub s1_1[si],32
         
         l1: inc si
         pop cx
    loop for2
    efor2:
    ;4-chap msg2
    lea dx,msg2
    mov ah,9
    int 21h
    ;5- chap s1_1
    lea dx,s1_1
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
