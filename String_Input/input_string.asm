; Input di una stringa da parte dell'utente

.model SMALL
.data

	string db 50 dup(?)			; Allocazione array di 50 byte
	
.stack
.code							
.startup

INPUT: 							; Input Stringa
	mov string, BYTE PTR 48 	; Dichiara il numero di caratteri (i primi due byte sono funzionali all'array)
	

READLINE: 						; Servizio lettura di una stringa
	lea dx, string				; Memorizza in dx, l'indirizzo d'accesso della stringa
	mov ah, 0Ah 				
	int 21h	

ARRAY_TO_STRING:				; La stringa a differenza dell'array viene delimitata da un carattere terminatore
	lea bx, string				; Memorizza in dx, l'indirizzo d'accesso della stringa
	inc bx						; Incrementando bx, ci spostiamo all'indirizzo ove memorizzato il numero di caratteri
	add bl, BYTE PTR [bx]		; Memorizza in bl, il contenuto di [bx], ci si sposta all'ultimo carattere inserito
	mov BYTE PTR [bx + 1], '$'	; Cambio l'ultimo carattere con il carattere terminatore
	
PRINT:							; Stampa la stringa
	add dx, 2
	mov ah, 09h
	int 21h

EXIT:							; Termina il programma
	mov ax, 4c00h
	int 21h
end
