; Inverte una stringa

.model SMALL
.data

	STRING db '!dlroW olleH$' ;Hello World!
	
.stack
.code							
.startup

	xor AX, AX
	xor BX, BX
	xor DX, DX
	xor SI, SI
	
	lea SI, STRING			; Memorizzo in SI, l'indirizzo di accesso di string
	jmp COMPARE_END
	
INCREMENT:
	inc BYTE PTR SI
	
COMPARE_END:
	cmp [SI], BYTE PTR '$'  ; Confronta il valore situato all'indirizzo contenuto in SI con '$'
	jne	INCREMENT 			
	
	dec SI					; [SI] = '$' (SI - 1 = Ultimo carattere della stringa)
	lea BX, STRING			; Memorizzo in BX, l'indirizzo di accesso di string

	jmp COMPARE				; Vai alla Label COMPARE
	
SWAP:
	mov AH, [BX]
	mov AL, [SI]
	
	mov [BX], AL
	mov [SI], AH
	
NEXT_CHAR:
	inc BX
	dec SI
	
COMPARE:
	cmp BX, SI
	jng SWAP				; Se BX < SI, Vai alla label SWAP
	
PRINT:						
	lea DX, STRING
	mov AH, 09h
	int 21h

EXIT:
mov AX, 4c00h
int 21h
end