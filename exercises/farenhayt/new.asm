include io.h
cr equ 10
lf equ 13
.model small
.Stack 200h
.Data
newline db cr, lf, 0
number_prompt1 db cr, lf, 'Enter number z: ', 0

number_one db 10 dup(?)


sum1 dw 0
sum2 dw 0
sum3 dw 0


total dw 0
sum_prompt db 'F = ', 0
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
mov bx, 18
mul bx

mov bx, 10
div bx
add ax,32
itoa total, ax




output newline
output total

;-------------------------------------------------------------
mov ax, 4c00h
int 21h
main endp
end main