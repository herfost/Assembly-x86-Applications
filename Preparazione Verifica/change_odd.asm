; Sostituzione caratteri alla posizione dispari con un dato carattere in AH

.model SMALL
.data
	STRING db '12345$'
;   OUTUPUT:   A2A4A

.stack
.code
.startup

	xor AX, AX
	xor BX, BX
	xor DX, DX
	
	mov AH, 41h				; AH = 'A'
	lea BX, STRING
	
	jmp IS_ODD
	
CHANGE:
	mov [BX], BYTE PTR AH

NEXT_CHAR:
	inc BX
	
IS_ODD:
	cmp [BX], BYTE PTR 30h
	jl IS_END				; Se < 30h  non si ha un numero, possibile carattere terminatore ('$' = 24h)
	cmp [BX], BYTE PTR 39h
	jg NEXT_CHAR			; Se > 39h  non si ha il carattere terminatore (39h != 24h)
	
	mov AL, BYTE PTR [BX]	
	AND AL, 01h
	cmp AL, 01h
	je CHANGE
	
IS_END:
	cmp [BX], BYTE PTR 24h
	jne NEXT_CHAR

PRINT_STRING:
	lea DX, STRING
	
	mov AH, 09h
	int 21h

EXIT:
mov AX, 4c00h
int 21h
end