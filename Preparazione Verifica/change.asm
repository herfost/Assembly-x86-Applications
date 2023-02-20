; Sostituzione caratteri con 'Y'

.model SMALL
.data
	string db 'Hellow World$'
.stack	 
.code
.startup

	xor AX, AX	
	xor BX, BX
	xor DX, DX
	mov AL, 'Y				; Sostituto

	lea BX, string
	dec BX 					; Stessa funzione di jmp IS_CHAR

NEXT_CHAR:
	inc BX
	
IS_CHAR:
	cmp [BX], BYTE PTR 'H' 
	je IS_END
	mov [BX], BYTE PTR AL   ; Ricorda: operazioni solo tra registri - registri,  registri e indirizzi di memoria
	                        ; Dunque scrivere mov [BX], BYTE PTR 'Y' comporta errore (essendo 'Y' specificata in esecuzione).
	
IS_END:
	cmp[BX], BYTE PTR '$'
	jne NEXT_CHAR
	
PRINT_STRING:
	lea DX, string
	mov AH, 09h	
	int 21h

EXIT:
	mov AX, 4c00h
	int 21h
end
