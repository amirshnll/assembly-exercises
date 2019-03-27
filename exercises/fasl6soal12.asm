; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    
    val1 db 68h
    val2 db 3fh

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
    mov al,val1
    mov bl, val2
    and ax,0b6h
    cmp al, bl
    ja label1
    mov al,bl
    jmp exit
    label1:
    mov bl, al
    exit:

            
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
