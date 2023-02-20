; Conta le occorrenza di un carattere all'interno di una stringa

.model SMALL
.data

	string db 'Numerazione della lettera A$'

.stack
.code
.startup
	
	lea bx, string			; Memorizza in BX, l'indirizzo di accesso di string
	xor al, al				; (AL = 0) - Inizializza AL a 0 
		
	jmp COMPERE

COUNT:
	inc al					; Incrementa AL	
	
INCREMENT:
	inc bx					; Incrementa BX (Va all'indirizzo successivo)
	
COMPERE:
	cmp [bx], BYTE PTR 'A'	; Confronta il valore che si trova all'indirizzo contenuto in BX, con 'A'
	je  COUNT  				; Se uguale, vai alla Label COUNT
	cmp [bx], BYTE PTR 'a'	; Confronta il valore che si trova all'indirizzo contenuto in BX, con 'a'
	je 	COUNT				; Se uguale, vai alla Label COUNT
	
	cmp [bx], BYTE PTR '$'	; Confronta il carattere che si trova all'indirizzo contenuto in BX, con '$'
	jne INCREMENT			; Se diverso, vai alla Lable INCREMENT

EXIT:
	mov ax, 4c00h
	int 21h
end 