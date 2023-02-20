; While loop in Assembly

.model SMALL
.data

.stack
.code
.startup
	
	xor al, al 		; int al = 0
	mov cx, 10 		; int cx = 10
	
INCREMNTO:
	inc al 			; ++al 
	loop INCREMNTO 	; while (al < cx)

EXIT:
	mov ax, 4c00h
	int 21h
end