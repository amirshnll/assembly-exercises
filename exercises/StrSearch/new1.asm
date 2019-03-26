include io.h
.model small
.Stack 200h
.Data
prompt1 db 10, 13, 'Enter a String : ', 0
prompt2 db 10, 13, 'Length of String is : ', 0
prompt3 db 10, 13, 'Enter a charecter : ', 0
string  db 73 dup(?)
char    dw 0
len db 6 dup(?)

;----------------------------------

.Code

StrSearch proc
mov cx, 1
while: cmp byte ptr [bx], al
je endwhile
inc bx
inc cx
jmp short while

endwhile: ret
StrSearch endp
;--------------------------
Main proc
mov ax, @Data
mov ds, ax
;--------------------------
clrscr
output prompt1
inputs string
mov bx, offset string
output prompt3
inputc char
;atoi char
call StrSearch

itoa len, cx
output prompt2
output len
;--------------------------
mov ax, 4c00h
int 21h
Main endp
end Main