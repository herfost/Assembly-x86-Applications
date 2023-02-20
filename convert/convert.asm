; Converte un numero decimale in binario

.model SMALL
.data

	string 	db	'123$'
	base	dw	0ah
	pow		dw	01h
	n		dw 	0h
	binary	dw  02h
	message db 'Il numero convertito in binario: $'
.stack
.code
.startup

	xor CX, CX
	lea BX, string	
	
PUT:
	mov AL, BYTE PTR [BX]
	xor AH, AH
	sub AL, BYTE PTR 30h ; Converte a numero 
	push AX				 ; Poi push nello stack
	
NEXT_CHAR:
	inc BX	; Passa a carattere successivo
	inc CX	; Conta n push per effettuare poi i pop
	
IS_END:
	cmp [BX], BYTE PTR '$'
	jne PUT
	
	; (; - ;) Aiaiaia, che fatica convertite i tipi in Assembly
	jmp GET
	
UPDATE:
	mov AX, pow ; Potenza di 10 
	mul base	; (Aggiorno la potenza, il peso) Potenza *= 10	
	mov pow, AX	; Aggiorno la variabile pow
	
GET:
	pop AX		; AX Contiene le cifre partendo dalla meno LS (Meno significativa)
	xor AH, AH
	mul pow		; Moltiplico per la potenza della sua posizione (Il suo peso)
	
	; Aggiornamento numero ( n += pop(stack) )
	add AX, WORD PTR n	; Sommo i precedenti numeri convertiti
	mov n, AX			; Sposto il risultato nella variabile n
	
	loop UPDATE		
	
	mov AX, n
	xor CX, CX
	
CONVERT:
	div binary
	xor AH, AH
	xor DH, DH
	push DX
	inc CX		; Conto il numero di bit per la stampa
	
	cmp AX, WORD PTR 0h
	jne CONVERT
	
	; Grafica Applicazione 
	
	mov AX, 0003h
	int 10h
	
	lea DX, message
	mov AH, 09h
	int 21h
	
	; Stampa numero binario

PRINT:
	pop AX
	add AL, 30h
	mov AH, 0Eh
	int 10h

	loop PRINT

EXIT:
mov AX, 4c00h
int 21h
end