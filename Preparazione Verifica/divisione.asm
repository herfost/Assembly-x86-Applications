; Divisione tra due numeri

.model SMALL
.stack
.data
	
	DIVISORE	dw 10
	N_INIZIALE 	dw 10
	N_FINALE 	dw 50
	
.code
.startup 

	mov BX, N_INIZIALE
	
	dec BX			; In alternativa  jmp BEGIN
	
NEXT_N:
	inc BX					
	
BEGIN:
	xor CX, CX				
	mov AX, BX				
	
SET_NUMBER:
	xor DX, DX		; Registro protagonista nella divisione a 2 Byte (Word)
	div DIVISORE	; AX / 2
	push DX			; Il resto viene memorizzato in DX e viene inserito nello Stack 
	inc CX			; Conta il numero di cifre del numero
	
	cmp AX, 0		 
	jne SET_NUMBER	

GET_NUMBER:
	POP AX			; Preleva dallo Stack il primo elemento 
	
PRINT: 
	add AL, 48				
	mov AH, 0Eh
	int 10h
	loop GET_NUMBER		
	
	xor AX, AX			
	add AL, 20h	
	mov AH, 0Eh
	int 10h
	
	cmp BX, N_FINALE
	jne NEXT_N

EXIT: 
	mov AX, 4c00h
int 21h
end