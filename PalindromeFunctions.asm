Include inout.asm  
.model small , c
.486
.stack 200h

.Data  
	String db 100 Dup(?)
	Prm db 13,10,"Enter a String To Count a's and Check Palindrome : $";
	As db 13,10,"Number of a's is : $";
	IsPal db 13,10,"Is It Palindrome ? $"
	YES db 13,10,"Yes , It Is Palindrome $"
	NO db 13,10,"No , It Is Not Palindrome $"
	
.Code 

AsCount proc _AA:byte
		LOCALS
		uses Di
		XOR Ax,Ax
		Mov Di , offset _AA
		
@@0300:	Cmp byte PTR[Di],'$'
		JZ @@0100
		
		Cmp byte PTR[Di],'a'
		JNZ @@0200
		Inc Ax 
		
@@0200:	Inc Di
		JMP @@0300
		
@@0100: ret
	Endp AsCount
	
	
PalCheck proc _BB:byte
		LOCALS
		uses Di,Bx,Cx,Si
		XOR Bx,Bx
		Mov Di , offset _BB
	
@@0200: Cmp byte PTR[Di],'$'
		JE @@0100
		Inc Bx
		Mov al, [Di]
		Push Ax
		Inc Di
		JMP @@0200
	
@@0100: Mov Si , offset _BB
		Mov Cx,Bx
	
@@0300:	Pop Ax
		Cmp Al,[Si]
		JNE @@0400
		Inc Si
		Dec Bx
		Loop @@0300
		Mov Ax , 1
		JMP @@0500
		
@@0400:	Mov Cx,Bx

@@0600:	pop si
		Loop @@0600
		Mov Ax , 0
		
@@0500: ret
	Endp PalCheck

	
.STARTUP
		call puts , offset Prm
		call gets , offset String 
		
		call AsCount , offset String
		call puts , offset As
		call putint , Ax
		call endl
		
		call puts ,  offset IsPal
		call PalCheck , offset String
		Cmp AX , 0
		JNZ YesPal
		call puts , offset NO
		JMP Done
YesPal: call puts , offset YES

Done: 	.EXIT
	END

