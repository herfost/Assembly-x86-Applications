; Funzione fattoriale 

.model SMALL
.stack
.data
	n		dw	0Ah
.code
.startup

	mov		AX, 0005h
	push	AX
	call 	fact
	
	pop		AX
	call	printNum

	
EXIT:
	mov AX, 4c00h
	int 21h



fact proc

	push	BP
	mov		BP, SP
	push	AX
	push	DX
	
	mov		AX,	[BP + 04h]
	cmp		AX, 0002h
	jz		RETURN
	
	dec		AX
	push	AX
	
	call	fact
	
	pop		DX
	mov		AX, [BP + 04h]
	mul		DX
	mov		[BP + 04h], AX
	
RETURN:
	pop		DX
	pop		AX
	pop		BP
	ret
	
fact endp



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
	jnz 	SET_NUMBER	

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