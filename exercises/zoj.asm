; multi-segment executable file template.
 include emu8086.inc
data segment
    ; add your data here!
    msg1 db 10,13,"please enter a digit:$"
   enter db 9,"$" 
   col db 2
   row db 2
    s1 label byte
      max1 db 6
      len1 db ?
    s1_1 db 6 dup('$')
    s2 db 10 dup('$')
    n dw ?
    ten dw 10
    temp dw 2
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
     gotoxy row,col
    atoi s1_1,len1,n
    w111:mov ax,temp
         cmp ax,n
         jg ew111
         itoa temp,s2,ten 
          print_string s2
          print_string enter
          add temp,2
    jmp w111
    ew111:        
    print_string pkey      
    read_key
    exit_program   
ends

end start ; set entry point and stop the assembler.
