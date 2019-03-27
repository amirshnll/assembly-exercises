; multi-segment executable file template.
include emu8086.inc
data segment
    ; add your data here!  
    msg1 db 10,13,"please enter a digit:$"
    s1 label byte
      max1 db 6
      len1 db ?
    s1_1 db 6 dup('$')
     
     s3 label byte
      max3 db 6
      len3 db ?
    s3_3 db 6 dup('$')
    ten dw 10
    mabna dw ?
    n dw 0
    s2 db 20 dup('$')
    msg2 db 10,13,"new digit is:$"
    msg3 db 10,13,"please enter mabna:$"
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

    
    print_string msg1
    read_string s1
    atoi s1_1,len1,n
    print_string msg3
    read_string s3
    mov cl,len3
     mov ch,0 
      lea si,s3_3
   call atoi1 
    itoa n ,s2,mabna
    print_string msg2
    print_string s2     
    print_string pkey
    
        
   read_key
    
   exit_program  
ends 
atoi1 proc near
     
     mov ax,0
    
     f11:jcxz ef11
       mov bl,[si]
       sub bl,48
       mov bh,0
       mul ten  ; ax=ax*ten 
       add ax,bx;ax=ax*10+bx
       inc si
    loop f11
    ef11:
    mov mabna,ax  
  ret
atoi1 endp

end start ; set entry point and stop the assembler.
