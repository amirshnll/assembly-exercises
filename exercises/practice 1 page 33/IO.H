
;                  In the name of A...
;                  By: Askar Ghandchi
;                   Mon. 03-11-2002

.286c
.xlist                  
		   extrn       itoa_proc:far
		   extrn       atoi_proc:far
		   extrn       out_proc:far
		   extrn       ins_proc:far
		   extrn       inc_proc:far
		   extrn       clrscr_proc:far
		   extrn       strrev_proc:far
		   extrn       ShowFlag_proc:far
;----------------------------------------------------------
m_error            macro       msg
		   if2
		   %out        msg
		   .lall
comment *
		   msg
* end comment
		   .err
		   .sall
		   .endif
		   endm
;-----------------------------------------------------------------------------
itoa               macro       dest,source,xtra
		   ifb         <source>
		   m_error     <missing operand(s) in itoa>
		   exitm
		   endif

		   ifnb        <xtra>
		   m_error     <extra operand(s) in itoa>
		   exitm
		   endif

		   push        ax
		   push        di
		   mov         ax,source
		   lea         di,dest
		   call        itoa_proc
		   pop         di
		   pop         ax
		   endm
;-----------------------------------------------------------------------------
atoi               macro       source,xtra
		   ifb         <source>
		   m_error     <missing operand in atoi>
		   exitm
		   endif

		   ifnb        <xtra>
		   m_error     <extra operand(s) in atoi>
		   exitm
		   endif

		   push        di
		   lea         di,source
		   call        atoi_proc
		   pop         di
		   endm
;-----------------------------------------------------------------------------
output             macro       string,length,xtra
		   ifb         <string>
		   m_error     <missing operand in output>
		   exitm
		   endif

		   ifnb        <xtra>
		   m_error     <extra operand(s) in output>
		   exitm
		   endif

		   push        ax
		   push        si
		   lea         si,string
		   ifb         <length>
		   xor         ax,ax
		   else
		   mov         ax,length
		   endif
		   call        out_proc
		   pop         si
		   pop         ax
		   endm
;-----------------------------------------------------------------------------
inputs             macro       dest,length,xtra
		   ifb         <dest>
		   m_error     <missing operand(s) in inputs>
		   exitm
		   endif

		   ifnb        <xtra>
		   m_error     <extra operand(s) in inputs>
		   exitm
		   endif

		   push        di
		   push        cx
		   lea         di,dest
		   ifb         <length>
		   mov         cx,0ffh
		   else
		   mov         cx,length
		   inc         cx
		   endif
		   call        ins_proc
		   pop         cx
		   pop         di
		   endm
;-----------------------------------------------------------------------------
inputc             macro       xtra
		   ifnb        <xtra>
		   m_error     <extra operand(s) in inputc>
		   exitm
		   endif

		   call        inc_proc
		   endm
;-----------------------------------------------------------------------------
clrscr             macro       xtra
		   ifnb        <xtra>
		   m_error     <extra operand(s) in clrscr>
		   exitm
		   endif

		   call        clrscr_proc
		   endm
;-----------------------------------------------------------------------------
strrev             macro       string,xtra
		   ifb         <string>
		   m_error     <missing operand in strrev>
		   exitm
		   endif

		   ifnb        <xtra>
		   m_error     <extra operand(s) in strrev>
		   exitm
		   endif

		   push        di
		   lea         di,string
		   call        strrev_proc
		   pop         di
		   endm
;-----------------------------------------------------------------------------
ShowFlagRegister   macro       xtra
		   ifnb        <xtra>
		   m_error     <extra operand(s) in clrscr>
		   exitm
		   endif

		   call        ShowFlag_proc
		   endm
;-----------------------------------------------------------------------------
.sall
.list
