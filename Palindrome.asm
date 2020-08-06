include inout.asm 
.model small,c
.486
.stack 200h

.Data
	Num DW ? 
	Count DW 0
	X DW 10
	Prm DB 13,10,"Enter The Number To Check : $"
	Yes DB 13,10,"It Is Palindrome $"		
	No  DB 13,10,"It Is Not Palindrome $"


.Code
		.Startup
		call puts , offset Prm
		call getint , offset Num
		Mov Num , AX
ToCount:CWD
		Cmp AX , 0
		JE GO
		Div X
		Push DX
		Inc Count
		JMP ToCount
    GO: Mov AX , Num
		Mov CX , Count
 Again: CWD
		Pop BX
		Div X
		Cmp DX,BX
		JNE PNO
		Loop Again
		
		Call puts , offset Yes
		call endl
		JMP ToExit
		
   PNO: Call puts , offset NO
		call endl
ToExit:
		.EXIT
		END
		