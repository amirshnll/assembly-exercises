include io.h
cr equ 10
lf equ	13
.model small
.Stack 200h
.Data
result db 10 dup(?)
sum dw 100
sum_prompt db 'The sum is: ', 0
.Code
main proc
mov ax, @data ; mov ax, seg data
mov ds, ax
;-------------------------------------------------------------
clrscr
mov ax,0
mov cx,100
for:add ax,cx
loop for
mov sum,ax
	
itoa result,sum

	output sum_prompt
	output result
 
;-------------------------------------------------------------
mov ax, 4c00h
int 21h
main endp
end main