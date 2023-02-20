; Fornisce la lunghezza di una stringa

.model SMALL
.stack
.data
	n		dw	0Ah
	string 	db	'Hello World!$'
.code
.startup
	
	lea 	BX, string
	push	BX
	
	call 	getString
	add		SP, 02h
	
	call	printNum
	
EXIT:
	mov AX, 4c00h
	int 21h

getString proc
	push 	BP	
	mov		BP, SP
	push	BX
	
	mov		BX, [BP + 04h]

NEXT:		
	inc		BX
	cmp		BYTE PTR [BX], '$'
	jne 	NEXT
	
	mov		AX, BX
	sub		AX, [BP + 04h]
	
	pop		BX
	pop 	BP
	ret
getString endp

printNum	proc
	push	BP
	mov		BP, SP
	push	AX
	push	CX
	push	DX
	
	xor 	CX, CX				
	jmp		IS_ZERO
	
SET_NUMBER:
	xor		DX, DX
	div 	n
	push 	DX			
	inc 	CX			
	
IS_ZERO:
	cmp 	AX, 0		 
	jne 	SET_NUMBER	

PRINT: 
	POP 	AX	
	
	add 	AL, 30h				
	mov 	AH, 0Eh
	int 	10h
	loop PRINT		
	
	; Line Feed
	mov		AL, 0Ah
	mov		AH, 0Eh
	int		10h

	pop	DX
	pop	CX
	pop	AX
	pop BP
	ret
printNum	endp

END