include				io.h
cr					equ			10
lf					equ			13
.model				small
.Stack				200h

.Data		
newline				db			cr, lf, 0
number_prompt		db			'Enter Number ', 0
tow_dote			db			' : ', 0
counter				dw			?
number_array		dw			10 dup(?)

.Code
main				proc
					mov			ax, @Data
					mov			ds, ax
					
					;-----------------------------------------------------------
					clrscr
					mov 		cx, 10
		Label1:		output 		number_prompt
					output		newline
					mov			counter, cx
					atoi		counter
					add			counter , 0
					output		counter
					output		tow_dote
					
					mov 		si, offset number_array
					mov 		[si], cx
					add			si, 2
		loop Label1
		
		;mov 		cx, 10
		;Label2:		output 		number_prompt
		;
		;loop Label2
					;-----------------------------------------------------------
					
mov			ax,4c00h
int			21h
main		endp
end			main
					
