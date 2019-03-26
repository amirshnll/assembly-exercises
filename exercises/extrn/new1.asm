include io.h
.model small
.Stack 200h
	extrn MySum : far
	extrn MyMul : far
.Data
	num  db  6 dup (?)
	crlf db 10, 13, 0

.Code
;-------------------------------------------------------------
Main proc
mov ax, @Data
mov ds, ax
;---------------------------------------
	clrscr
	mov bx, 10
	mov cx, 5
	push bx
	push cx
	call MyMul
	itoa num, ax
	output num
	output crlf
	mov ax, 10
	mov bx, 8
	call MySum
	itoa num, ax
	output num
;-------------------------------------------
mov ax, 4c00h
int 21h
Main endp
end Main