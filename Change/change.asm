; Sostiusce i caratteri { 'A', 'a' } con '@'

.model SMALL
.data
	string db 'Numerazione della lettera A$' 

.stack
.code
.startup
	
	lea bx, string			; Memorizza in BX, l'indirizzo di accesso di string
	mov al, 40h				; (AL = '@' {ASCII CODE -> 40h = '@', 64 in base 10})
		
	jmp COMPERE

CHANGE:
	mov [bx], BYTE PTR al   ; Memorizza all'indirizzo contenuto in BX il contenuto di AL ('@')
	
INCREMENT:
	inc bx					; Incrementa BX (Vai all'indirizzo successivo)
	
COMPERE:					; Confronta i caratteri = { 'A', 'a' }
	cmp [bx], BYTE PTR 'A'	; Confronta il carattere che si trova all'indirizzo contenuto in BX, con 'A'
	je  CHANGE  			; Se uguale, vai alla Label CHANGE
	cmp [bx], BYTE PTR 'a'	; Confronta il carattere che si trova all'indirizzo contenuto in BX, con 'a'
	je 	CHANGE				; Se uguale, vai alla Label CHANGE	
	
	cmp [bx], BYTE PTR '$'	; Confronta se il carattere che si trova all'indirizzo contenuto in BX, sia uguale a '$' usato come '\0' (fine stringa)
	jne INCREMENT			; Se diverso, vai alla Lable INCREMENT

PRINT:						; Stampa la stringa
	lea dx, string
	mov ah, 09h			
	int 21h

EXIT:
	mov ax, 4c00h
	int 21h
end 
