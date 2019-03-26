
include io.h

cr         equ    10
lf         equ    13
number_no  equ    10

.model small
.Stack  200h
.Data
prompt   db    cr, lf, "Enter a number: ",0
num_str  db    7 dup(?)
new_line db    cr, lf, 0
arr      dw    number_no dup(?)

.Code
Main     proc
         mov    ax, @Data
		 mov    ds, ax
		 ;----------------
		 mov     cx, number_no
		 mov     si, offset arr
for1:		 
		 output  prompt
		 inputs  num_str, 4
		 atoi    num_str  ; ----> ax		 
		 mov     [si], ax
		 add     si, 2
		 loop    for1
		 
		 mov     cx, number_no
		 mov     si, offset arr
for2:		 
		 ;output  prompt
		 ;inputs  num_str, 4
		 ;atoi    num_str  ; ----> ax		 
		 itoa    num_str,[si]
		 output  new_line
		 output  num_str
		 ;mov     [si], ax
		 add     si, 2
		 loop    for2		 		 
		 ;----------------
		 mov    ax, 4c00h
		 int    21h
Main     endp
         end    Main