include io.h
.model  small
.stack 200h
.data



.code
main proc 
mov ax,@data
mov ds,ax









    mov ax,4c00h
    int 21h
main endp 
    end main







