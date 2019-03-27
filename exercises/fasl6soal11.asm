; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db 10, 13, "press any key...$"
    
    message     db    10, 13, "Result : $"
    
    string      db    300 dup("$")
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
    
    
    mov cx,1
    mov si,0
    for1: 
    cmp cx, 300
    jg  endfor1
    
    mov ah, 1h
    int 21h
    
    cmp al, 13
    je  endfor1
    
    cmp al, 122
    jg  continue
    
    cmp al, 97
    jge writing
    
    cmp al, 90
    jg  continue
    
    cmp al, 65
    jge writing
    
    jmp continue
    
    writing:
    mov string[si], al
    inc si
    
    inc cx
    continue:
    jmp for1
    endfor1:
    
    lea dx, message
    mov ah, 9
    int 21h
    
    lea dx, string
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
