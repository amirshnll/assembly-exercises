; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"           
    msg        db      "Enter A String...  $"
     
    inputstring     label   byte
    max             db      20
    len             db      ?
    st1             db      20 dup(?)  
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
            
        lea dx, msg
        mov ah, 9h
        int 21h
           
        lea dx, inputstring
        mov ah,0Ah
        int 21h

        mov dh, 10
        mov dl, 10
        mov bh, 0
        mov ah, 2h
        int 10h
        mov al, byte ptr st1
        mov ah, 9h
        mov cx, 20
        mov bl, 01110100b
        mov bh, 0
        int 10h
          
        mov dh, 20
        mov dl, 20
        mov bh, 0
        mov ah, 2h
        int 10h
        mov bl, len
        mov bh, 0
        mov al, byte ptr st1[bx-1]
        mov ah, 9h
        mov cx, 30
        mov bl, 01110001b
        mov bh, 0
        int 10h
        
        ; Go To New Line     
            lea dx, newline
            mov ah, 9h
            int 21h         
    
    ; End My Code
            
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
