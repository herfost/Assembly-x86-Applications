; Scrive una stringa in maiuscolo 

.model SMALL
.data
	STRING db 'Hello World!$'
.stack
.code
.startup

	xor AX, AX
	xor BX, BX
	xor DX, DX
	
	; Nella Codifica ASCII le lettere Minuscole sono maggiorate di 32 rispetto le Maiuscole:
	; A = 65 | a = 97 
	;  ...   |  ...
	; Dunque si osserva che il 5Â° bit (32) ha ruolo nella conversione maiuscolo-minuscolo
	; Andando ad effettuare l'operazione di XOR 32 si convertono le lettere alfabetiche
	
	mov AL, 32
	lea BX, STRING
	
	jmp IS_CHAR
	
TO_UPPER:
	xor [BX], AL        ; Effettuo lo XOR, Converte da Minuscolo a Maiuscolo
	
NEXT_CHAR:
	inc BX
	
IS_CHAR:
	
	; Confronto se si tratta di lettere alfabetiche minuscole
	cmp [BX], BYTE PTR 'a'
	jl IS_END   ; Se < di 'a' significa che non si ha una lettera minuscola
	cmp [BX], BYTE PTR 'z'
	jle TO_UPPER    ; Se <= 'z' significa che si ha una lettera minuscola, salta alla label TO_UPPER
	; else continua...
	
IS_END:
	cmp [BX], BYTE PTR '$'
	jne NEXT_CHAR

PRINT_STRING:
	lea DX, STRING
	mov AH, 09h
	int 21h
	
EXIT:
mov AX, 4c00h
int 21h
end