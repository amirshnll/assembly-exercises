
include io.h
cr equ 10
lf equ 13
.model small
.Stack 200h
.Data
prompt1 db cr, lf, 'Enter a org : ', 0
prompt2 db cr, lf, 'Enter a guess  : ', 0
prompt3 db cr, lf, 'The number greater', 0
prompt4 db cr, lf, 'The number less', 0
prompt5 db cr, lf, 'ok', 0

number_one db 10 dup(?)
number_two db 10 dup(?)

num1  dw    ?
num2  dw    ?

.Code
Main proc
mov ax, @Data
mov ds, ax
;-------------------------------------------
clrscr
output prompt1
inputs number_one, 4
atoi   number_one
mov num1, ax
clrscr

enter1: 
output prompt2
inputs number_two, 4
cmp number_two,'q'
je finish
atoi   number_two
mov num2, ax

while: 
cmp num1, ax
je endWhile

cmp num1, ax
ja above

cmp num1, ax
jb less



above:
output prompt4
jmp enter1

less: 
output prompt3
jmp enter1



endwhile:
output prompt5

finish: 
;--------------------------------------
mov ax, 4c00h
int 21h
Main endp
end Main