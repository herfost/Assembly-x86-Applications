; main.c disassemblato: confronto Assembly e C

main.o:     file format pe-i386


Disassembly of section .text:

00000000 <_main>:
   0:	55                   	push   ebp
   1:	89 e5                	mov    ebp,esp
   3:	83 e4 f0             	and    esp,0xfffffff0
   6:	83 ec 10             	sub    esp,0x10
   9:	e8 00 00 00 00       	call   e <_main+0xe>
   e:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  15:	00 
  16:	eb 05                	jmp    1d <_main+0x1d>
  18:	83 44 24 0c 01       	add    DWORD PTR [esp+0xc],0x1
  1d:	81 7c 24 0c fe 00 00 	cmp    DWORD PTR [esp+0xc],0xfe
  24:	00 
  25:	7e f1                	jle    18 <_main+0x18>
  27:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  2e:	00 
  2f:	eb 05                	jmp    36 <_main+0x36>
  31:	83 44 24 0c 01       	add    DWORD PTR [esp+0xc],0x1
  36:	81 7c 24 0c fe 00 00 	cmp    DWORD PTR [esp+0xc],0xfe
  3d:	00 
  3e:	7e f1                	jle    31 <_main+0x31>
  40:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  47:	00 
  48:	83 44 24 0c 01       	add    DWORD PTR [esp+0xc],0x1
  4d:	81 7c 24 0c fe 00 00 	cmp    DWORD PTR [esp+0xc],0xfe
  54:	00 
  55:	7e f1                	jle    48 <_main+0x48>
  57:	b8 00 00 00 00       	mov    eax,0x0
  5c:	c9                   	leave  
  5d:	c3                   	ret    
  5e:	90                   	nop
  5f:	90                   	nop
