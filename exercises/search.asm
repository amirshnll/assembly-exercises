include io.h

cr	equ	10
lf	equ	13

.model small
.stack 200h
			extrn	strsearch:far
.data
newline		db		cr,lf,0
string		db		40 dup(?)
str_in		db		?
prompt1		db		cr,lf,'enter the string : ',0
prompt2		db		cr,lf,'enter the character : ',0
result		db		?


.code

;---------------------------------------------------------
main	proc
		mov		ax,@data
		mov		ds,ax
		;-----------------------------------------------------
		clrscr
		
		output		prompt1
		inputs		string
		
		mov		bx,offset	string
		
		output		prompt2
		inputc		str_in
		call	strsearch
		
		mov			ch,0
		output		newline
		itoa		result,cx
		output		result
		;--------------------------------------------------------------		
main	endp
		mov		ax,4c00h
		int		21h
		end		main

;-------------------------------------------------------------------

				
				
