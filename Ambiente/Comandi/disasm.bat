@ECHO OFF
cd ..\Testing
gcc ..\%1.c -o %1
gcc -Wall -c ..\%1.c
objdump -M intel -d %1.o > %1.asm
del *.o
del *.c
del *.exe
cd ..\Comandi