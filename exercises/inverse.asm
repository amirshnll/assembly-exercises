include io.h

cr	equ	10
lf	equ	13

.model small
.stack 200h

.data
newline		db		cr,lf,0
string		db		40 dup(?)
prompt1		db		cr,lf,'enter the string : ',0
prompt2		db		cr,lf,'enter the character : ',0
result		db		?


.code
strinverse		proc
				mov		si,bx
				
	forsi:
				mov		al,[si]
				cmp		al,0
				je		endforsi
				
				inc		si
				jmp		forsi
				
	endforsi:
				dec		si
				
	whiles:	
				cmp		bx,si
				jge		endwhiles
				
				mov		al,Byte ptr[si]
				mov		ah,Byte ptr[bx]
				mov		Byte ptr[si],ah
				mov		Byte ptr[bx],al
				inc		bx
				dec		si
				jmp	short whiles
	endwhiles:
				ret
strinverse		endp
;---------------------------------------------------------
main	proc
		mov		ax,@data
		mov		ds,ax
		;-----------------------------------------------------
		clrscr
		
		output		prompt1
		inputs		string
		
		mov		bx,offset	string
		
		call	strinverse
		
		
		output		newline
		output		string
		;--------------------------------------------------------------		
main	endp
		mov		ax,4c00h
		int		21h
		end		main

;-------------------------------------------------------------------

				
				
