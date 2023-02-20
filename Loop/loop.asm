; Disegna di una griglia su terminale

.model SMALL
.data

	row	db	10
	col	db	20

.stack
.code
.startup
	
	mov cx, 60			; Indico le dimensioni delle righe 
	mov dl, row			; Specifico la posizione della prima riga (Per colonna)
	
DISEGNA_RIGHE:		
MOVE_CURSOR				; Servizio che sposta il cursore
	mov dh, row			; Specifico la posizione della prima riga
	mov ah, 02h
	int 10h
	
PRINT_CHAR: 			; Servizio per stampare un carattere
	mov al, '0'
	mov ah, 0eh
	int 10h

MOVE_CURSOR				; Servizio che sposta il cursore
	mov dh, col			; Specifico la posizione della seconda riga
	mov ah, 02h
	int 10h

	mov al, '0'
	mov ah, 0eh
	int 10h
	
	inc dl				; Vado alla colonna successiva
	loop DISEGNA_RIGHE
	
	
	xor ch, ch			; cx = 0
	mov cl, row			; cl = Posizione della prima riga
	inc cl				; Incremento il le dimensioni delle colonne
	mov dh, col
	sub dh, row
	
DISEGNA_COLONNE:
	mov dl, row
	mov ah, 02h
	int 10h
	
	mov al, '1'
	mov ah, 0eh
	int 10h

	mov dl, row
	add dl, 60
	mov ah, 02h
	int 10h
	
	mov al, '1'
	mov ah, 0eh
	int 10h
	
	inc dh
	loop DISEGNA_COLONNE
	
	
	mov dl, row
	mov dh, row
	
	mov al, '?'
	mov ah, 0eh
	int 10h
	
	mov dh, col			; Specifico la posizione della seconda riga
	mov ah, 02h
	int 10h
	
	mov al, '?'
	mov ah, 0eh
	int 10h
	
	
EXIT:					; Termina il programma
	mov ax, 4c00h
	int 21h
end