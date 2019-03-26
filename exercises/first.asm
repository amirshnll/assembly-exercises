include io.h
cr		equ		10
lf		equ		13
max	    equ		5

.model small
.stack 200h

.data
arrs		dw		10 dup(?)
number		db		10 dup(?)
newline     db      cr,lf,0
prompt		db		cr,lf,'enter the number : ',0

index		db		1
resultmax 	db		10 dup(?)

resultmin 	db		10 dup(?)



.code
main		proc

			mov			ax,@data
			mov			ds,ax
			
			
			;---------------------------------------------------------
			clrscr
			mov			si,offset	arrs
			
			in_for :
					output 		prompt
					inputs		number
					atoi		number
					mov			[si],ax
					add			si,2
					inc 		index
					cmp	index,max
					jbe	  in_for
			
			;----------------------------------------------
		  mov			si,offset	arrs
		  mov 	index,1
		  mov ax,[si]
		  formax :
		  
				cmp  	[si],ax 
				jle  endwhilemax
				
				mov ax,[si]
			
			
			endwhilemax:
			add si,2
			inc index
			cmp	index,max
			
			 jbe formax
			 
			
			 output		newline
			 itoa resultmax,ax
			 output resultmax
			;----------------------------------------------
			 mov			si,offset	arrs
		  mov 	index,1
		  mov ax,[si]
		  formin :
		  
				cmp  	[si],ax 
				jge  endwhilemin
				
				mov ax,[si]
			
			
			endwhilemin:
			add si,2
			inc index
			cmp	index,max
			
			 jbe formin
			 
			
			 output		newline
			 itoa resultmin,ax
			 output resultmin
;-------------------------------------------------------
			mov		ax,4c00h
			int		21h
	main	endp
			end		main
































