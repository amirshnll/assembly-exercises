include io.h
cr	equ	10
lf	equ	13


.model small
.stack 200h


.data
newline		db		cr,lf,0
sum			dw		0
str_in		db		10 dup(?)
prompt		db		cr,lf,'insert n : ',0
prompt2		db		cr,lf,'insert number : ',0
result		db		10 dup(?)
max			dw		10 dup(?)
avg			dw		10 dup(?)
.code
main		proc
			mov		ax,@data
			mov		ds,ax
			;-------------------------------------------
			clrscr
			
			output		prompt
			inputs		max
			atoi		max
			mov			cx,ax
			
	forin:
			output		prompt2
			inputs		str_in
			atoi		str_in
			add			sum,ax
			loop		forin
			;--------------------------------------------
			mov			dx,0
			mov			ax,sum
			mov			bx,max
			div			bx
			mov			avg,ax
			itoa		result,avg
			output		newline
			output		result
			;-----------------------------------------------------------------
			mov		ax,4c00h
			int		21h
main		endp
			end		main