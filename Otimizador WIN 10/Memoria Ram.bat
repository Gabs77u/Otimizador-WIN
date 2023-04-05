***Limpador***

@ECHO OFF
title Limpador de Memoria by Gabs
chcp 1252 > Nul
set Intervalo=15
mode 30,13
color 0c
:menu
cls
echo Limpador de Memoria by Gabs
echo.
echo Beta
echo ____________________________
echo [1] Limpar memoria
echo [2] Sair
echo [3] Ram Programada
echo ____________________________
echo.
set/p menu=">"

if %menu% equ 1 goto :voltar
if %menu% equ 2 exit
if %menu% equ 3 (goto :ram) else (cls& echo Opção inválida& pause& goto :menu)

:ram
cls
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
echo BO LIMPAR FI
echo _____________________________________________________
echo Executando Limpeza da RAM a cada %Intervalo% segundos
echo.
timeout /t %Intervalo%
goto :ram
exit

:voltar
set a= °
cls
echo.
echo BO LIMPAR FI 
echo.
set n=0
echo.

:limpa
echo.
ECHO -----------LIMPA.LIMPA.LIMPA-----------
ECHO.
echo.
echo.
timeout /t 3
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q "%temp%\*.*"
rd /s /q "%temp%"
md "%temp%"
del /s /f /q c:\windows\temp\*.*
del /s /f /q  c:\windows\prefetch\*.*
del /s /f /q  "c:\windows\Downloaded Program Files\*.*"
del /s /f /q  c:\windows\Installer\*.*
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
cls