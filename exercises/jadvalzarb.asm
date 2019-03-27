; multi-segment executable file template.

data segment
    ; add your data here!
    pkey    db      "press any key...$"
    newline db      10, 13, "$"
    i       db      1
    j       db      1
    number  dw      0
    mabna   dw      10
    string  db      20 dup('$')
    z       db      0
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
    
    while1:
    cmp i,10
    jae endwhile1
    
        while2:
        cmp j, 10
        jae endwhile2
        
        mov al, i
        mov bl, j
        mul bl
        mov number, ax
        
        mov ax,number
        mov cx,0
        while3: cmp ax,0
            je endwhile3
            mov dx,0
            div mabna
            add dx,48
            l3:push dx
            inc cx
        jmp while3
        endwhile3:
        mov si,0
        f2: jcxz ef2
            pop dx 
            
            mov string[si],dl
            inc si
        loop f2
        ef2:
        
        mov dx, 0
        lea dx,string
        mov ah,9h
        int 21h
        
        mov dl, 9
        mov ah, 2h
        int 21h
        
        inc j
        jmp while2
        endwhile2:
        
        mov al, 1
        mov j, al
        
        lea dx, newline
        mov ah, 9
        int 21h
        
        mov si, 0
        for3:
        cmp z,20
        jae endfor3
        mov dl, "$"
        mov string[si], dl
        inc z
        inc si
        jmp for3
        endfor3:
        mov al, 0
        mov z, al
        
    inc i
    jmp while1
    endwhile1:
            
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
