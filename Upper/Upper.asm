; Scrive una stringa in maiuscolo 

.model SMALL
.data

	string db 'Hello World!$'

.stack
.code
.startup

	lea dx, string 			; Memorizzo nel registro dx, l'indirizzo di accesso di string	(Funzionale per la stampa della stringa)
	lea bx, string			; Memorizzo nel registro dx, l'indirizzo di accesso di string	(Funzionale per accedere ai caratteri della stringa)

	jmp COMPARE_END			; Vai alla Label COMPARE_END

IS_ALPHABET:
	cmp [bx], BYTE PTR 'a'  ; Confronta (di 1 Byte) il valore all'indirizzo contenuto nel registro bx con 'a'
	jl INCREMENT			; Vai alla Label INCREMENT
	
	cmp [bx], BYTE PTR 'z'  ; Confronta (di 1 Byte) il valore all'indirizzo contenuto nel registro bx con 'z'
	jg INCREMENT			; Vai alla Label INCREMENT
	
TO_UPPER:
	and [bx], BYTE PTR 223	; Svogle AND (Di dimensione 1 Byte) del valore nel indirizzo contenuto in bx e 223
							; (Spegne Il 6 Bit -> Trasforma le lettere minuscole in maiuscole nel codice ASCII)
INCREMENT:
	inc bx					; Incrementa il contenuto del registro bx (Va all'indirizzo successivo)

COMPARE_END:
	cmp [bx], BYTE PTR '$'  ; Confronta (di 1 Byte) il valore all'indirizzo contenuto nel registro bx con '$'
	jne IS_ALPHABET			; Se il confronto non restituisce 0 (non accende il flag), Vai alla Label IS_ALPHABET

PRINT:						; Stampa la stringa
	mov ah, 09h			
	int 21h
	
EXIT:						; Termina il programma
	mov ax, 4c00h
	int 21h
end
