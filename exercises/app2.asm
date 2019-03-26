include io.h
cr		equ		10
lf		equ		13
.model	small
.stack	200h
.Data
promptN1 db cr, lf, 'Enter a NumberBase -> ', 0
promptN2 db cr, lf, 'Enter a NumberGuesses -> ', 0
promptN3 db cr, lf, 'The number Greater :( ', 0
promptN4 db cr, lf, 'The number Less :( ', 0
promptN5 db cr, lf, 'Afaaaaaaaaaaaaaaaarin Pesare Gooolam :)', 0

valueOne db 10 dup(?)
valueTwo db 10 dup(?)

numberOne  dw    ?
numberTwo  dw    ?
.Code
Main	proc
mov		ax, @data
mov		ds, ax
;===================================================
clrscr
output promptN1
inputs valueOne, 5
atoi   valueOne
mov numberOne, ax
clrscr

myloop:
output promptN2
inputs valueTwo, 5
cmp valueTwo,'q'
je endprogrammses
atoi   valueTwo
mov numberTwo, ax

while: 
cmp numberOne, ax
je endWhile
cmp numberOne, ax
ja Balatar
cmp numberOne, ax
jb Paiiintar

Balatar:
output promptN4
jmp myloop

Paiiintar: 
output promptN3
jmp myloop

endwhile:
output promptN5

endprogrammses:

;===================================================
mov		ax, 4c00h
int		21h
Main	endp
end		Main