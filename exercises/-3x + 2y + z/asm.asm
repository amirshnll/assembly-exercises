include io.h
cr equ 10
lf equ 13
.model small
.Stack 200h
.Data
newline db cr, lf, 0
number_prompt1 db cr, lf, 'Enter number z: ', 0
number_prompt2 db cr, lf, 'Enter number Y: ', 0
number_prompt3 db cr, lf, 'Enter number x: ', 0
number_one db 10 dup(?)
number_two db 10 dup(?)
number_three db 10 dup(?)

sum1 dw 0
sum2 dw 0
sum3 dw 0

result dw 0
total dw 0
sum_prompt db '-3X + 2Y + Z : ', 0
.Code
main proc
mov ax, @Data
mov ds, ax
;-------------------------------------------------------------

clrscr
output number_prompt1
inputs number_one, 4
atoi number_one
mov sum1, ax

output number_prompt2
inputs number_two, 4
atoi number_two

mov sum2 ,  ax 
add ax , ax
add sum1 , ax
output number_prompt1
inputs number_three, 4
atoi number_three
mov sum3, ax
add ax, ax
add sum3 , ax

neg sum3

itoa total , sum3



output newline
output sum_prompt
output total
;-------------------------------------------------------------
mov ax, 4c00h
int 21h
main endp
end main