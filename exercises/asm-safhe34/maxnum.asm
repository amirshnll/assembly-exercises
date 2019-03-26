include io.h

cr	equ	10
lf	equ	13
max	equ	3
.model small
.stack 200h

.data
newline		db		cr,lf,0
number		db		10 dup(?)
prompt1		db		cr,lf,'enter the number : ',0
index		db		1
result		db		5 dup(?)
maximum		dw		?



.code
maxnum		proc
		mov		cx,3	
		mov		ax,[bp]
		mov		maximum,ax	
				
	whiles:	
				mov		dx,[bp]
				cmp		dx,maximum
				jle		continue
				
				mov		ax,[bp]
				mov		maximum,ax
			
	continue:		
				add		bp,2
				loop	whiles
				
	
	endwhiles:
				ret
maxnum		endp
;---------------------------------------------------------
main	proc
		mov		ax,@data
		mov		ds,ax
		;-----------------------------------------------------
		clrscr
forin:	
		cmp			index,max
		jg			endforin
		output		newline
		output		prompt1
		inputs		number
		atoi		number
		push		ax
		inc			index
		jmp			forin
	endforin:	
		mov		bp,sp
		
		call	maxnum
		
		
		output		newline
		itoa		result,maximum
		output		result
		;--------------------------------------------------------------		
main	endp
		mov		ax,4c00h
		int		21h
		end		main

;-------------------------------------------------------------------

				
				
