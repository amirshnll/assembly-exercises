include io.h
cr	equ	10
lf	equ	13
max	equ	10

.model small
.stack 200h


.data
newline		db		cr,lf,0
arr			dw		10 dup(?)
str_in		db		10 dup(?)
prompt		db		cr,lf,'insert number : ',0
index		db		0
result		db		10 dup(?)
.code
main		proc
			mov		ax,@data
			mov		ds,ax
			;-------------------------------------------
			clrscr
			
			mov		si,offset	arr
			mov		cl,max
			
	forin:
			output		prompt
			inputs		str_in
			atoi		str_in
			mov			[si],ax
			add			si,2
			inc			index
			mov			al,index
			cmp			al,cl
			jl			forin
			;--------------------------------------------
			mov		si,offset	arr
			mov		index,0
			

	
	forout:
			output	newline
			itoa		result,[si]
			output		result
			add			si,2
			inc			index
			mov			al,index
			cmp			al,cl
			jl			forout
			
			;-----------------------------------------------------------------
			mov		ax,4c00h
			int		21h
main		endp
			end		main