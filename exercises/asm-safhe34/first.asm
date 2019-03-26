include io.h
cr		equ		10
lf		equ		13
max	    equ		10

.model small
.stack 200h

.data
arrs		dw		10 dup(?)
number		db		10 dup(?)
newline     db      cr,lf,0
prompt		db		cr,lf,'enter the string : ',0

index		dw		1
resultmax 	db		10 dup(?)

resultmin 	db		'not found letter' ,0
strl 		db 		?
indexs		db		10 dup(?)


.code
main		proc

			mov			ax,@data
			mov			ds,ax
			
			
			;---------------------------------------------------------
			clrscr
			output  prompt
			inputs arrs,10
			
			;----------------------------------------------
		
			;----------------------------------------------
			 mov			si,offset	arrs
		  mov 	index,1
		  output		newline
		  inputs strl
		  mov dl,strl
		  formin :
		  
				cmp  	[si],dl 
				jne  endwhilemin
				 output		newline
				 itoa indexs,index
					output indexs
					
					jmp endw
				
			
			endwhilemin:
			add si,2
			inc index
			cmp	index,max
			
			 jbe formin
			 
			
		endw:	
;-------------------------------------------------------
			mov		ax,4c00h
			int		21h
	main	endp
			end		main
































