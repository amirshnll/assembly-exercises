include io.h

cr	equ	10
lf	equ	13

.model small
.stack 200h

.data
newline		db		cr,lf,0
string		db		40 dup(?)
prompt1		db		cr,lf,'enter the string : ',0
prompt2		db		cr,lf,'enter the status : ',0
status		db		?


.code
alpha		proc
				
				
	whiles:	
				mov		cl,Byte ptr[bx]
				cmp		cl,0
				je		endwhiles
				
				cmp		cl,96
				jle		lowchar
				
				jmp		highchar
				
	continue:
				inc		bx
				jmp		whiles
				
	lowchar:
				cmp		al,1
				je		continue
				add		Byte ptr[bx],32
				jmp		continue
				
	highchar:
				cmp		al,0
				je		continue
				sub		Byte ptr[bx],32
				jmp		continue
	endwhiles:
				ret
alpha		endp
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
		inputs		status
		atoi		status
		
		
		
		
		
		call	alpha
		
		
		output		newline
		output		string
		;--------------------------------------------------------------		
main	endp
		mov		ax,4c00h
		int		21h
		end		main

;-------------------------------------------------------------------

				
				
