include io.h
cr 	equ 10
lf 	equ 13
max	equ	10

.model small
.Stack 200h

.Data
prompt1 db cr, lf, 'Enter a Number : ', 0
prompt2 db cr, lf, 'Number List is : ', 0
newline	db	cr,lf,0
arr		dw	10 dup (?)
strnum	db	10 dup (?)
counter	db	?

.Code
Main 	proc
		mov cx, @Data
		mov ds, cx
;-------------------------------------------
mov		si, offset arr
mov		counter,max

in_for :

output  prompt1
inputs	strnum
atoi	strnum ;-------> ax
mov		[si],ax
add		si,2
dec		counter
cmp		counter,0
jne		in_for

;--------------------------------------
mov		si, offset arr
mov		counter,max
output	prompt2

out_for :

itoa	strnum,[si]
output	strnum
output	newline
;mov		[si],ax
add		si,2
dec		counter
cmp		counter,0
jne		out_for
;--------------------------------------
mov ax, 4c00h
int 21h
Main endp
end Main
