include				io.h
cr					equ			10
lf					equ			13
.model				small
.Stack				200h

.Data		
newline				db			cr, lf, 0
number_prompt1		db			cr, lf, 'Enter Number one :', 0
number_prompt2		db			cr, lf, 'Enter Number two :', 0
number_prompt3		db			cr, lf, 'Enter Number three :', 0
number_one			db			10 dup(?)
number_two			db			10 dup(?)
number_three		db			10 dup(?)
result				db			10 dup(?)
sum					dw			0
sum_prompt			db			'The Sum is :', 0

.Code
main				proc
					mov			ax, @Data
					mov			ds, ax
					
					;-----------------------------------------------------------
					clrscr
					output 		number_prompt1
					inputs		number_one, 4
					atoi		number_one
					add			sum,ax
					
					output 		number_prompt2
					inputs		number_two, 4
					atoi		number_two
					add			sum,ax
					
					output 		number_prompt3
					inputs		number_three, 4
					atoi		number_three
					add			sum,ax
					
					itoa		result,sum
					output		newline
					output		sum_prompt
					output		result
					;-----------------------------------------------------------
					
mov			ax,4c00h
int			21h
main		endp
end			main
					
