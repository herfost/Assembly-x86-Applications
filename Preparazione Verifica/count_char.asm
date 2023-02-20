; Conta la occorrenze di una dato carattere in AH
.model SMALL
.data
	string db 'Hellow World$'
.stack	 
.code
.startup

	xor AX, AX	
	xor BX, BX
	
	mov AH, 'H'
	lea BX, string          
	
	jmp IS_CHAR             ; In Alternativa dec BX

NEXT_CHAR:
	inc BX
	
IS_CHAR:
	cmp [BX], BYTE PTR AH   
	jne IS_END
	inc AL                  ; AL contatore delle occorrenze della lettera H
	
IS_END:
	cmp[BX], BYTE PTR '$'
	jne NEXT_CHAR

EXIT:
	mov AX, 4c00h
	int 21h
end
