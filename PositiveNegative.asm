include inout.asm 
.model small,c
.486
.stack 400h

.Data
	X DW 0
	PRM DB 13,10,”Enter a number : $”
	IsPos DB 13,10,”It is Positive $”
	IsNeg DB 13,10,”It is Negative $”
	IsZero DB 13,10,”It is Zero $”

.Code
	.Startup
		   call puts,offset PRM
		   call getint
		   MOV X,AX
		   OR AX,AX
		
		   JS Negative
		   JZ Zero
	       JNS Positive
		   JMP Next
		
 Negative: MOV Si,offset IsNeg
		   JMP Print
		
	 Zero: MOV Si,offset IsZero
		   JMP Print
		
 Positive: MOV Si,offset IsPos
		   JMP Print
		
	Print: call endl
		   call puts,Si
	
	 Next: OR AX,AX
		   JNS Done
		   Neg AX

	 Done: call endl
		   call putint,AX
		
	.Exit
	END

