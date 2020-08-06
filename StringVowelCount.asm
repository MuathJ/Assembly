include inout.asm
.model small,c
.stack 200h 

.Data 
	 Str db "Test String To Count Number Of Vowels $"
	 Len dw $-Str 
	 Count  db ?

.Code 
	 Main proc 
	 mov AX, @data 
	 mov DS, AX 
	 mov SI, offset Str
	 mov CX, Len
	 mov BL, 0
	 
	Back: mov AL, [SI] 
	 CMP AL, a 
	 JB vow 
	 CMP AL, z
	 JA vow 
	 SUB AL, 20H 
	vow: CMP AL, A 
	 JNZ a3 
	 INC BL 
	 JMP a2 
	a3: CMP AL, E 
	 JNZ a4 
	 INC BL 
	 JMP a2 
	a4: CMP AL, I 
	 JNZ a5 
	 INC BL 
	 JMP a2 
	a5: CMP AL, O 
	 JNZ a6 
	 INC BL 
	 JMP a2 
	a6: CMP AL, U 
	 JNZ a2 
	 INC BL 
	 
	a2: INC SI 
	 LOOP Back 
	 mov Count,  BL 
	 mov AX, 04C00H 
	 INT 21H 
	 Main endp 

 End Main
