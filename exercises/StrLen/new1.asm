include io.h
.model small
.Stack 200h
.Data
prompt1 db 10, 13, 'Enter a String : ', 0
prompt2 db 10, 13, 'Length of String is : ', 0
string db 73 dup(?)
len db 6 dup(?)

;----------------------------------

.Code
Strlen proc
mov cx, 0
while: cmp byte ptr [bx], 0
je endwhile
inc bx
inc cx
jmp short while

endwhile: ret
Strlen endp
;--------------------------
Main proc
mov ax, @Data
mov ds, ax
;--------------------------
clrscr
output prompt1
inputs string
mov bx, offset string
call Strlen

itoa len, cx
output prompt2
output len
;--------------------------
mov ax, 4c00h
int 21h
Main endp
end Main