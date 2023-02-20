; Replicazione della funzioen gets <stdio.h>

.model SMALL
.stack
.data

.code
.startup
	
	call getString

EXIT:
	mov AX, 4c00h
	int 21h

getString proc
	
	; Proologo
	push 	BP	
	mov		BP, SP
	push	AX	
	push	BX	
	push	DX	
	
	
	; Dichiarazione della stringa
	sub		SP, 22					; Allocazione della memoria (Numero di caratteri + 2 BYTE funzionali)
	mov		BYTE PTR [BP - 28], 20	; Inizializzazione numero caratteri
	
    ; Input della stringa
	mov		DX, BP					; Posizionamento del registro DX 
	sub		DX,	28					; all'indirizzo di accesso della stringa
	mov		AH,	0Ah
	int 	21h
	
	; Sostituzione del carattere invio con il terminatore					
	
	mov		BX, BP					; Posizionamento del registro BX
	sub		BX, 26					; all'indirizzo del primo carattere della stringa

	; sub	BL, 26 conduce ad errori di indirizzamento:
	; Supponendo che BX = 0402 dove BH = 04, BL = 02
	; andando a sottrarre un valore maggiore di 2 (singolarmente) al
	; registro BL, si consegue con la trascrizione di un numero negativo
	; BX - 10h = 03F2 
	; BL - 10h = F2 {con BH = 04 memorizzando in BX 04F2 }
	
	xor		AH, AH
	mov		AL, [BP - 27]			; AL = Numero di caratter inseriti dall'utente + Spazio Proologo
	add		BX, AX
	
	mov		BYTE PTR [BX], '$'
	
	; Stampa Line Feed
	mov		DL, 0Ah					; ASCII CODE Line Feed
	mov		AH, 02h	
	int 	21h
	
	; Stampa della stringa
	mov		DX, BP					; Posizionamento del registro DX
	sub 	DX, 26					; all'indirizzo del primo carattere della stringa
	mov		AH, 09h
	int		21h
	
	; Stampa Line Feed
	mov		DL, 0Ah					; ASCII CODE Line Feed
	mov		AH, 02h	
	int 	21h
	
	; Apoologo
	add		SP, 22
	pop		DX
	pop		BX
	pop		AX
	pop 	BP
	ret
getString endp
END
