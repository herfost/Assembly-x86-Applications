.MODEL SMALL
.DATA
	STRING db 50 dup(?)			
.STACK
.CODE							
.STARTUP

	mov STRING, BYTE PTR 48		; Inizializzo uno spazio di memoria pari: n - 2
	
INPUT_STRINGA:					; Servizio di Input Stringa
	lea DX, STRING				; Memorizza nel registro DX l'indirizzo di accesso della stringa STRING
	mov AH, 0Ah 					
	int 21h	

; Ricordare la struttura degle stringhe di input in Assembly:
; Si ricoda che il primo elemento dell'array ha indice 0
; In Assembly, i primi due indirizzi/elementi dell'array sono ausiliari per il sistema
; Nel secondo indirizzo/elemento si ha la dimensione della stringa ricevuta in input
; Quando abbiamo a che fare con le stringhe, l'input si interrompe con l'inserimento del carattere invio
; Esso deve essere sostituito con il carattere terminatore '$'

ADD_NULL_CHAR:
	lea BX, STRING				; L'indirizzo d'accesso della stringa coincide con l'indirizzo del primo elemento STRING[0]
	inc BX						; Ci si sposta all'elemento STRING[1] (il secondo elemento contiene la dimensione dell'Array, la differenza fra il primo e l'ultimo indirizzo)
	add BL, BYTE PTR [BX]		; Memorizza nella parte bassa del registro BX l'indirizzo di accesso dell'ultimo carattere inserito
	mov BYTE PTR [bx + 1], '$'	; Imposta il carattere successivo l'ultimo inserito come terminatore (sostituisce '\n' con '0' {Confrontando con il C})
	
PRINT_STRING:					; Servizio di Output Stringa
	add DX, 2
	mov AH, 09h
	int 21h
	
EXIT:	
mov AX, 4c00h
int 21h
END