; Inverte due variabili

.MODEL SMALL
.DATA
		X db 'X'
		Y db 'Y'
		Z db 'Z'
.STACK
.CODE							
.STARTUP

	xor AX, AX
	xor BX, BX
	
	; Servizio di Stampa per X
	mov AL, X
	mov AH, 0Eh
	int 10h

	mov AL, 11h
	mov AH, 0Eh
	int 10h
	
	; Servizio di Stampa per Y
	mov AL, Y
	mov AH, 0Eh
	int 10h

	mov AL, 11h
	mov AH, 0Eh
	int 10h
	
	; Servizio di Stampa per Z
	mov AL, Z
	mov AH, 0Eh
	int 10h
	
	mov AL, 11h
	mov AH, 0Eh
	int 10h
	
PRIMA_INVERSIONE:
	mov BL, X
	mov BH, Y
    
    ; Se capita di dover invertire due registri si possono usare i seguente metodi:
    
    ; 1) XOR        2) Istruzione XCHG (Exchange)
    ; XOR R1, R2       XCHG R1, R2
    ; XOR R2, R1    
    ; XOR R1, R2
    
	mov X, BH
	mov Y, BL
	
	; Servizio di Stampa per X
	mov AL, X
	mov AH, 0Eh
	int 10h

	mov AL, 11h
	mov AH, 0Eh
	int 10h
	; Servizio di Stampa per Y
	mov AL, Y
	mov AH, 0Eh
	int 10h
	
END:
mov AX, 4c00h
int 21h
END