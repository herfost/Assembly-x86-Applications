.model SMALL
.data

	xor ax, ax 	; ax = 0

.stack
.code
.startup

	mov cx, 10

INCREMENTA:
	loop		; Decrementa cx (while cx > 0)

EXIT:
	mov ax, 4c00h
	int 21h
end
