.model small
.Code
	public MyMul
	public MySum
;---------------------------------------------------------

MyMul proc far
	push bp
	mov bp,sp
	mov ax, [bp+6] ; mov ax, ss:[bp+6]
	mov bx, [bp+8] ; mov bx, ss:[bp+8]
	mul bx
	pop bp
	ret 4
MyMul endp

;------------------------------------------------------------
MySum proc far
	add ax, bx
	ret
	MySum endp
end