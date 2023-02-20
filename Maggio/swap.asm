; Inverte due variabili nelle loro celle di memoria

.model SMALL
.stack	
.data

	var_1	db	'A'
	var_2	db	'Z'

.code 
.startup

PRINT_1:
	; Parametri per valore:
	xor		AH, AH
	
	mov		BYTE PTR AL, var_1
	push	AX
	mov		BYTE PTR AL, var_2
	push	AX
	
	call	print
	add		SP, 04h

SWAP_1:
	lea		BX, var_1
	push	BX
	
	lea		BX, var_2
	push	BX
	
	call	swap
	add		SP, 04h
	
PRINT_2:
	; Parametri per riferimento:
	xor		AH, AH
	
	mov		BYTE PTR AL, var_1
	push	AX
	mov		BYTE PTR AL, var_2
	push	AX
	
	call	print
	add		SP, 04h
	
EXIT:
	mov AX, 4c00h
	int 21h	

print	proc
	push	BP
	mov		BP, SP
	push	AX
	
	mov		AX, [BP + 06h]
	mov		AH, 0Eh
	int		10h
	
	mov		AX, [BP + 04h]
	mov		AH, 0Eh
	int		10h
	
	mov		AL,	0Ah
	mov		AH, 0Eh
	int		10h	
	
	pop		AX
	pop		BP
	ret
print	endp

swap	proc
	push	BP
	mov		BP, SP
	push	AX
	push	BX
	
	; 
	mov		BX, [BP + 06h]
	mov		BYTE PTR AL, [BX]	
	
	mov		BX, [BP + 04h]
	mov		AH, [BX]		
	
	mov		[BX], AL
	mov		BX, [BP + 06h]
	mov		[BX], AH
	; 
	
	pop 	BX
	pop		AX
	pop		BP
	ret
swap	endp

END