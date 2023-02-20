; Ancora un'altro swap

.model SMALL
.data
	a db 45
	b db 9
	c db 130

.stack
.code 
.startup

	mov al, a
	mov ah, b
	cmp al, ah
	jb swap_1

LABEL_1:
	mov ah, c
	cmp al, ah
	jb swap_2

LABEL_2:
	mov al, b
	cmp al, ah
	jb swap_3
	jmp EXIT

swap_1:
	mov a, ah
	mov b, al
	mov ah, b
	jmp LABEL_1

swap_2:
	mov a, ah
	mov c, al
	mov ah, c
	jmp LABEL_2
	
swap_3:
	mov b, ah
	mov c, al
	jmp EXIT
	
EXIT:
	mov ax, 4c00h
	int 21h
end