; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db 10, 13, "press any key...$"
    
    msginput        db      "Enter A String... ", 10, 13, "$"
    msgoutput       db      10, 13, "String Length : $"
    count           db      0 
    outstring       dw      50 dup(?)
    
    inputstring     label   byte
    max             db      50
    len             db      ?
    mystring        db      50 dup(?) 
                    
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
    
    
    lea dx, msginput
    mov ah, 9
    int 21h    
        
    lea dx, inputstring
    mov ah,0Ah
    int 21h
    
    mov cl,len
    mov ch,0
    mov si,0
    for1:jcxz endfor1
         push cx
         cmp mystring[si],'$'
         je endfor1
         inc count
         inc si
         pop cx
    loop for1
    endfor1:  
    
    lea dx, msgoutput
    mov ah, 9
    int 21h
    
    mov dl, count
    mov ah, 2h
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
