; Stampa un dato numero

.model SMALL
.stack
.data
	n		dw	0Ah
.code
.startup
		
	mov		WORD PTR AX, 78h
	call 	printNum

EXIT:
	mov AX, 4c00h
	int 21h

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