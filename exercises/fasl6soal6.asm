; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$" 
    
    message     db      "Please Enter Char : $"
    
    res1        db      "Ahmad $"
    res2        db      "Bahman $"
    res3        db      "Computer $"
    res4        db      "General $"
    
    inputstring label   byte
    max         db      1
    len         db      ?
    string      db      2 dup('$')
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
    mov ah, 9h
    int 21h
    
    mov ah, 1h
    int 21h
    
    cmp al, 'A'
    je  if
    cmp al, 'B'
    je  elseif1
    cmp al, 'C'
    je  elseif2
    jmp else
    
    if:
    lea dx, res1
    mov ah, 9h
    int 21h
    jmp endif
    
    elseif1:
    lea dx, res2
    mov ah, 9h
    int 21h 
    jmp endif
    
    elseif2:
    lea dx, res3
    mov ah, 9h
    int 21h
    jmp endif
    
    else:
    lea dx, res4
    mov ah, 9h
    int 21h
    
    endif:
            
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
