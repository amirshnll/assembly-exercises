.model small
.code
				public	strsearch
strsearch		proc	far
				mov		cl,0
	whiles:	
				cmp		Byte ptr[bx],0
				je		endwhiles
				
				cmp		Byte ptr[bx],al	
				je		endwhiles
				inc		bx
				inc		cl
				jmp	short whiles
	endwhiles:
				ret
strsearch		endp
				end