; multi-segment executable file template.
;fasle6. manteghi va shift
;and, test, or, xor, not ,neg 
;logic and arithmetic change flags
data segment
    ; add your data here!  
    
    pkey db "press any key...$"
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

    ; 1-dastor and
   ; mov    al,10100101b
;    mov    bl,11110000b
;    and al,bl;10100000 and ba sefr=0, and ba 1=bedone taghieer
     ;dastor or
    ; mov al,  10100101b
;     mov bl,  11110000b
;     or al,bl;11110101 or ba 1=1, or ba 0=khodesh
     ;mov al,   10100101b
;     mov bl,   11110000b
;     xor al,bl;01010101; xor ba sefr=khodesh, ba yek=not
      ;mov al,10100101b
;      not al     ;motamem yek
       ;
;       mov al,20
;       neg al; al=-20; al=al*-1
      ; mov   al,10100101b
;       shr al,1;01010010 ;cf=1
;       shr al,1;00101001; cf=0 ;taghsim be 2
       ; mov   al,10100101b
;        shl al,1;01001010
;        shl al,7; shift right or left n times for n bit register=0
       ;mov al,10100101b
;       ror al,1;11010010
      ;  mov   al,10100101b
;        rol al,1;01001011
        
            
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
