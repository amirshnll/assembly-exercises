include io.h
cr equ 10
lf equ 13
.model small
.Stack 200h
.Data
newline db cr, lf, 0
prompt3 db cr, lf, 'Enter count: ', 0
prompt1 db cr, lf, 'Enter a number: ', 0
prompt2 db cr, lf, 'number list is one: ', 0

MAX db 10 dup(?)
arr dw 10 dup(?)
strnum db 10 dup(?)
counter dw 10 dup(?)
.Code
main proc
mov ax, @Data
mov ds, ax
;-------------------------------------------------------------
mov si , offset arr
output prompt3
inputs MAX
atoi MAX
mov counter , ax
infor :
output prompt1
inputs strnum
atoi strnum
mov [si] , ax
add si , 2
dec counter
cmp counter , 0
jne infor
;----------------------------------------
mov si , offset arr
output prompt2
mov counter, ax
outfor :
itoa strnum , [si]
output strnum
output newline
add si , 2
dec counter
cmp counter , 0
jne outfor






;-------------------------------------------------------------
mov ax, 4c00h
int 21h
main endp
end main