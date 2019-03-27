; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    
    message     db      "Please Enter A Number $"
    message2    db      10, 13, "Result $"
    
    reverse     db      50 dup("$")
    
    inputstring     label   byte
    max             db      50
    len             db      ?
    mystring        db      50 dup("$")
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
    
    lea dx, message
    mov ah, 9
    int 21h  
    
    lea dx, inputstring
    mov ah,0Ah
    int 21h
    
    mov cl,len
    mov ch,0
    mov si,0
    mov di,50
    for1:jcxz endfor1
         push cx
         cmp mystring[si],'$'
         je  endfor1
         
         mov al, mystring[si] 
         mov reverse[di],al 
         
         inc si
         dec di
         pop cx
    loop for1
    endfor1:
    
    lea dx, message2
    mov ah, 9
    int 21h
    
    mov cl,len
    mov ch,0
    mov si,0
    for2:jcxz endfor2
         push cx
         cmp si,50
         jg  endfor1
         
         inc si
         cmp reverse[si-1],'$'
         je  for2
         
         mov dl, reverse[si-1]
         mov ah, 2h
         int 21h
         
         pop cx
    loop for2
    endfor2:
    
    lea dx, reverse
    mov ah, 9
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
