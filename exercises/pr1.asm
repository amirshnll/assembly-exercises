; multi-segment executable file template.

data segment
    ; add your data here!   
    msg1 db 10,13,"please enter a string:$" 
    msg2 db 10,13,"you entered:$" 
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

    ; add your code here
    lea dx,msg1
    call print       
   
    lea dx,s1
    call read
    lea dx,msg2
    call print
    lea dx,s1_1
    call print
     lea dx, pkey
    call print
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends 
print proc near
     mov ah, 9
    int 21h 
    ret
print endp 
read proc near
    mov ah,0ah
    int 21h
    ret
read endp

end start ; set entry point and stop the assembler.
