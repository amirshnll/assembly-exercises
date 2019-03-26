include io.h
cr	equ	10
lf	equ	13


.model small
.stack 200h


.data
newline		db		cr,lf,0
str_in		db		10 dup(?)
prompt		db		cr,lf,'insert string : ',0


.code
main		proc
			mov		ax,@data
			mov		ds,ax
			;-------------------------------------------
			clrscr
			
			
			
			output		prompt
			inputs		str_in
			
			mov			si,offset	str_in
			mov			di,offset	str_in

	fordi:
			cmp			byte ptr[di],0
			je			enddi
			inc			di
			jmp			fordi
			
	enddi:		
			dec			di
			
	forin:
			mov			ah,[si]
			mov			al,[di]
			mov			[si],al
			mov			[di],ah
			inc			si
			dec			di
			cmp			si,di
			jle			forin
		
			;--------------------------------------------
			
			
			output		newline
			output		str_in
			;-----------------------------------------------------------------
			mov		ax,4c00h
			int		21h
main		endp
			end		main