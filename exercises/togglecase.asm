; multi-segment executable file template.
 include emu8086.inc
 
data segment
    ; add your data here!
    msg1 db 10,13,"please enter a string:$"
    str1 label byte
       max1 db 40
       len1 db ?
    str1_1 db 40 dup('$')
    msg2 db 10,13,"reverse is:$"
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
    read_string str1
    toggle_case str1_1,len1
    print_string msg2
    print_string str1_1
    
    print_string pkey
    read_key        
    exit_program
ends

end start ; set entry point and stop the assembler.
