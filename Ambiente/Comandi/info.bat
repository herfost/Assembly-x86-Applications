@ECHO OFF
cd ..\Testing
tasm ..\%1
tlink %1
cd ..\Comandi