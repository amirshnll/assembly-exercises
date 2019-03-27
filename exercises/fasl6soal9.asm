; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db 10, 13, "press any key...$"
    
    
    message1    db    "Adade 3 raghami : $"
    message2    db    10, 13, "Result : $"
    number      dw    0
    multip      db    100
    temp        dw    0
    
    string      db    4 dup("$")
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
    
    lea dx, message1
    mov ah, 9
    int 21h
    
    mov cx,1
    for1: 
    cmp cx, 3
    jg  endfor1
    
    mov ah, 1h
    int 21h
    
    mov bl, multip
    mul bl
    add number, ax
    
    mov al, multip
    mov ah, 0
    mov bl, 10
    div bl
    mov multip, al
    
    inc cx
    jmp for1
    endfor1:
    
    lea dx, message2
    mov ah, 9
    int 21h
    
    for2:
    cmp cx,number
    jg  endfor2
    
    mov temp,cx
    mov ax, temp
    mov bl, 2
    div bl
    
    cmp ah, 0
    jne continue1
    mov dx, temp
    mov ah, 2h
    int 21h
    
    continue1:
    inc cx
    jmp for2
    endfor2:
            
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
