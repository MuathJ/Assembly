include inout.asm
.model small , c
.486
.stack 
.DATA
	ANS DB 13,10 ,"ANS= " 13,10,13,10 ,"$";
	sum DW 0 ; 
.code
	Start : mov BX,@DATA
			mov DS,BX
			
			XOR AX,AX 
			XOR CX,CX
			
	again : cmp CX,200
			JG Done
			ADD AX , CX 
			inc CX 
			inc CX 
			JMP again 
			
	Done :  call puts , offset ANS 
			call putint , AX 
			
			mov AH,04ch  
			mov AL,0h
			int 21h
	END Start
	
