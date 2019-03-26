include io.h
cr	equ	10
lf	equ	13

.model small
.stack 200h


.data
newline		db		cr,lf,0
arr			dw		5 dup(?)
prompt		db		cr,lf,'inser the number >> ',0
str_in		dw		?
result		db		10 dup(?)
.code
main		proc
			mov			ax,@data
			mov			ds,ax
			;-------------------------------------------------------------
			clrscr
			mov			si,offset arr
			mov			cx,5
	forin:
			 output		prompt
			 inputs		str_in
			 atoi		str_in
			 mov		[si],ax
			 add		si,2
			 loop		forin
			 ;-------------------------------------------------------------
			 mov			si,offset arr
			 mov			di,offset arr
			 mov			cx,5
			 
	while1:
			mov			dx,1
			
	while2:
			cmp			dx,cx
			jge			endwhile1
			
			mov			di,si
			add			di,2
			
			mov			ax,[si]
			
			cmp			ax,[di]
			jle			endwhile2
			
			mov			ax,[si]
			mov			bx,[di]
			
			mov			[si],bx
			mov			[di],ax
			
	endwhile2:
			mov			si,di
			inc			dx
			jmp			while2
			
	endwhile1:
			   mov			si,offset arr
			   mov			di,offset arr
			  loop			while1
			;----------------------------------------------------
			
			mov			si,offset arr
			mov			cx,5
	forout:
			output		newline
			itoa		result,[si]
			output		result
			add			si,2
			loop		forout
			
			
			 
		
		


			;-------------------------------------------------------------
			mov			ax,4c00h
			int			21h
main		endp
			end			main



