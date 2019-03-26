include io.h
cr	equ	10
lf	equ	13

.model small
.stack 200h


.data
str_in		db		10 dup(?)
str_th		db		10 dup(?)
prompt		db		cr,lf,'insert orginal number : ',0
prompt_th	db		cr,lf,'insert number : ',0
less		db		cr,lf,'less',0
great		db		cr,lf,'great',0
ok		db		cr,lf,'OK',0

.code
main		proc
			mov		ax,@data
			mov		ds,ax
			;-------------------------------------------
			clrscr
			
			output		prompt
			inputs		str_in
			cmp			str_in,'q'
			je			endpr
			atoi		str_in
			mov			cx,ax
			
whilepr:
			
			output		prompt_th
			inputs		str_th
			cmp			str_th,'q'
			je			endpr
			atoi		str_th
			cmp			ax,cx
			jl			lesspr
			jg			greatpr
			je			okpr
			
			
	lesspr:
			output		less
			jmp			whilepr
			
	greatpr:
			output		great
			jmp			whilepr
			
	okpr:				
			output		ok
			jmp			endpr
		
			
			
	endpr:
			
			;-----------------------------------------------------------------
			mov		ax,4c00h
			int		21h
main		endp
			end		main