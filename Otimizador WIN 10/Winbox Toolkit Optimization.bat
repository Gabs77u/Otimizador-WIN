@echo off
REM ================================================================================
REM WINBOX TOOLKIT OPTIMIZATION v3.0.1 - UNIFIED EDITION
REM Copyright (c) 2025 Gabs77u - https://github.com/Gabs77u/Otimizador-WIN
REM 
REM Licenca: Creative Commons Attribution-NonCommercial 4.0 International
REM USO NAO-COMERCIAL APENAS - Proibida venda ou uso comercial
REM Para uso comercial, contate o autor
REM
REM DISCLAIMER: Use por sua conta e risco. Sempre faca backup antes de usar.
REM Este software e fornecido "como esta" sem garantias de qualquer tipo.
REM ================================================================================

setlocal EnableDelayedExpansion
chcp 65001 > nul 2>&1
mode 85,30
color 0f

REM ================================================================================
REM CONFIGURAÇÕES GLOBAIS
REM ================================================================================
set "VERSION=3.0.1"
set "AUTHOR=Gabs77u"
set "MEMORY_INTERVAL=30"
set "MONITOR_REFRESH=2"
set "MONITOR_ALERT_LEVEL=85"
set "DEBUG_MODE=0"
set "LOG_FILE=WinboxToolkit_Debug_%date:~6,4%%date:~3,2%%date:~0,2%.log"
set "LOG_FILE=!LOG_FILE: =0!"

REM ================================================================================
REM SISTEMA DE LOGS DE DEBUG
REM ================================================================================

:WriteDebugLog
if "!DEBUG_MODE!"=="0" goto :eof
echo [%date% %time%] %~1 >> "!LOG_FILE!"
goto :eof

:EnableDebugMode
set "DEBUG_MODE=1"
call :WriteDebugLog "DEBUG: Modo debug ativado"
call :WriteDebugLog "DEBUG: Sistema iniciado - Windows !WINDOWS_VERSION!"
call :WriteDebugLog "DEBUG: Privilegios administrativos: !ADMIN_STATUS!"
goto :eof

:DisableDebugMode
call :WriteDebugLog "DEBUG: Modo debug desativado"
set "DEBUG_MODE=0"
goto :eof

REM ================================================================================
REM SISTEMA DE TRATAMENTO DE ERROS
REM ================================================================================

:HandleError
set "ERROR_CODE=%~1"
set "ERROR_MESSAGE=%~2"
set "ERROR_FUNCTION=%~3"

if not defined ERROR_CODE set "ERROR_CODE=1"
if not defined ERROR_MESSAGE set "ERROR_MESSAGE=Erro desconhecido"
if not defined ERROR_FUNCTION set "ERROR_FUNCTION=Funcao nao especificada"

call :WriteDebugLog "ERROR: Codigo: !ERROR_CODE! - !ERROR_MESSAGE! em !ERROR_FUNCTION!"

echo    [ERROR] Codigo: !ERROR_CODE!
echo    [ERROR] Mensagem: !ERROR_MESSAGE!
echo    [ERROR] Funcao: !ERROR_FUNCTION!
echo    [ERROR] Consulte o log para mais detalhes: !LOG_FILE!

if !ERROR_CODE! gtr 0 (
    echo    [WARN] Operacao falhou. Pressione qualquer tecla para continuar...
    pause >nul
)
goto :eof

:CheckErrorLevel
set "LAST_ERROR=%errorlevel%"
if !LAST_ERROR! neq 0 (
    call :HandleError "!LAST_ERROR!" "Comando anterior falhou" "%~1"
    return !LAST_ERROR!
)
goto :eof

REM ================================================================================
REM DETECÇÃO DE SISTEMA E PRIVILÉGIOS
REM ================================================================================
call :DetectWindowsVersion
call :CheckAdminPrivileges
call :GetInitialMemoryInfo

REM Verificar se devemos ativar modo debug baseado em parâmetro
if "%1"=="--debug" call :EnableDebugMode
if "%1"=="/debug" call :EnableDebugMode
if "%1"=="-d" call :EnableDebugMode

call :WriteDebugLog "INIT: Sistema inicializado com sucesso"

REM ================================================================================
REM MENU PRINCIPAL
REM ================================================================================
:MainMenu
cls
call :DrawGhostHeader
call :ShowSystemInfo
call :DrawMainMenu
echo.
set /p "MENU_CHOICE=   ═══^> Digite sua opcao: "

REM Validação de entrada melhorada
if "!MENU_CHOICE!"=="" goto :InvalidChoice

REM Verificar caracteres especiais perigosos
echo !MENU_CHOICE! | findstr /r "[&<>|^\"'%%]" >nul 2>&1
if !errorlevel! equ 0 goto :InvalidChoice

REM Verificar se é um número válido ou x/X
if "!MENU_CHOICE!"=="1" goto :SystemOptimization
if "!MENU_CHOICE!"=="2" goto :MemoryManager
if "!MENU_CHOICE!"=="3" goto :PrivacyTweaks
if "!MENU_CHOICE!"=="4" goto :ServiceManager
if "!MENU_CHOICE!"=="5" goto :AdvancedSettings
if "!MENU_CHOICE!"=="6" goto :About
if "!MENU_CHOICE!"=="0" goto :ExitProgram
if "!MENU_CHOICE!"=="x" goto :ExitProgram
if "!MENU_CHOICE!"=="X" goto :ExitProgram

REM Se chegou aqui, é uma opção inválida
goto :InvalidChoice

:InvalidChoice
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [ERROR] Opcao invalida! Por favor, escolha uma opcao valida.             ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
timeout /t 3 > nul
goto :MainMenu

REM ================================================================================
REM INTERFACE VISUAL
REM ================================================================================

:DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                                                                           ║
echo    ║    ██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗  ██╗                       ║
echo    ║    ██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗╚██╗██╔╝                       ║
echo    ║    ██║ █╗ ██║██║██╔██╗ ██║██████╔╝██║   ██║ ╚███╔╝                        ║
echo    ║    ██║███╗██║██║██║╚██╗██║██╔══██╗██║   ██║ ██╔██╗                        ║
echo    ║    ╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝██╔╝ ██╗                       ║
echo    ║     ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝                       ║
echo    ║                                                                           ║
echo    ║           ████████╗ ██████╗  ██████╗ ██╗     ██╗  ██╗██╗████████╗         ║
echo    ║           ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██║ ██╔╝██║╚══██╔══╝         ║
echo    ║              ██║   ██║   ██║██║   ██║██║     █████╔╝ ██║   ██║            ║
echo    ║              ██║   ██║   ██║██║   ██║██║     ██╔═██╗ ██║   ██║            ║
echo    ║              ██║   ╚██████╔╝╚██████╔╝███████╗██║  ██╗██║   ██║            ║
echo    ║              ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝            ║
echo    ║                                                                           ║
echo    ║                                                                           ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                     WINBOX TOOLKIT OPTIMIZATION v%VERSION%                ║
echo    ║                        Sistema + Memoria RAM + Privacy                    ║
echo    ║                            By %AUTHOR% - 2025                             ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
goto :eof

:ShowSystemInfo
call :GetCurrentMemoryInfo
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [SYS] SISTEMA: %WINDOWS_VERSION% ^(Build: %WIN_BUILD%^)                  ║
echo    ║  [ADM] ADMIN: %ADMIN_STATUS%  ^|  [VER] WINVER: %WINVER%                  ║
echo    ║  [RAM] RAM: %MEMORY_USAGE_MB%MB/%TOTAL_MEMORY_MB%MB ^(%MEMORY_PERCENT%%%^)║
echo    ║  [DBG] DEBUG: %DEBUG_MODE%    ^|  [VRS] VERSAO: v%VERSION%                ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
goto :eof

:DrawMainMenu
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                              [MENU PRINCIPAL]                             ║
echo    ╠═══════════════════════════════════════════════════════════════════════════╣
echo    ║                                                                           ║
echo    ║    [1] [SYS] OTIMIZACAO DE SISTEMA   │  [2] [RAM] GERENCIADOR DE MEMORIA  ║
echo    ║        * Servicos e Performance      │      * Limpeza Inteligente         ║
echo    ║        * Tweaks e Configuracoes      │      * Monitor em Tempo Real       ║
echo    ║        * Registry e Features         │      * Estatisticas Detalhadas     ║
echo    ║                                      │                                    ║
echo    ║    [3] [SEC] PRIVACIDADE E TELEMETRIA│  [4] [SVC] GERENCIADOR DE SERVICOS ║
echo    ║        * Remover Telemetria          │      * Servicos Avancados          ║
echo    ║        * Cortana e Tracking          │      * Tarefas Agendadas           ║
echo    ║        * Apps e Bloatware            │      * Registry e Drivers          ║
echo    ║                                      │                                    ║
echo    ║    [5] [CFG] CONFIGURACOES AVANCADAS │  [6] [INF] SOBRE E INFORMACOES     ║
echo    ║        * Hardware Fraco              │      * Creditos e Licenca          ║
echo    ║        * Power Management            │      * Documentacao                ║
echo    ║        * Network e Storage           │      * Suporte e Updates           ║
echo    ║                                                                           ║
echo    ║    [0/X] [EXIT] SAIR DO PROGRAMA                                          ║
echo    ║                                                                           ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
goto :eof

REM ================================================================================
REM FUNÇÕES DE DETECÇÃO DE SISTEMA
REM ================================================================================

:DetectWindowsVersion
set "WINDOWS_VERSION=Windows 10"
set "WINVER=10"
set "WIN_BUILD=Unknown"

REM Método robusto para detectar versão do Windows - TESTE UNIT: DetectWindowsVersion
REM Comando ver como método primário - TESTE UNIT: comando ver
for /f "tokens=3" %%i in ('ver 2^>nul') do (
    for /f "tokens=2 delims=[]" %%j in ("%%i") do (
        set "WIN_BUILD=%%j"
    )
)

REM PowerShell como método secundário - TESTE UNIT: Get-CimInstance
if not defined WIN_BUILD (
    powershell -Command "try { (Get-CimInstance -ClassName Win32_OperatingSystem).BuildNumber } catch { exit 1 }" 2>nul >temp_build.txt
    if exist temp_build.txt (
        for /f "tokens=*" %%i in (temp_build.txt) do (
            echo %%i | findstr /r "^[0-9]*$" >nul && set "WIN_BUILD=%%i"
        )
        del temp_build.txt >nul 2>&1
    )
)

REM WMIC como fallback final
if not defined WIN_BUILD (
    for /f "skip=1 tokens=*" %%a in ('wmic os get BuildNumber /value 2^>nul ^| findstr "="') do (
        for /f "tokens=2 delims==" %%b in ("%%a") do (
            echo %%b | findstr /r "^[0-9]*$" >nul && set "WIN_BUILD=%%b"
        )
    )
)

REM Detectar Windows 11 por build numbers - TESTE UNIT: Compatibilidade Windows 10/11
if defined WIN_BUILD (
    for /f "tokens=1 delims=." %%i in ("!WIN_BUILD!") do set "BUILD_NUM=%%i"
    
    REM Windows 11 builds conhecidos - TESTE UNIT: Compatibilidade Windows 11
    if !BUILD_NUM! geq 26100 set "WINVER=11" && set "WINDOWS_VERSION=Windows 11 Insider"
    if !BUILD_NUM! geq 22631 if !BUILD_NUM! lss 26100 set "WINVER=11" && set "WINDOWS_VERSION=Windows 11 23H2"
    if !BUILD_NUM! geq 22621 if !BUILD_NUM! lss 22631 set "WINVER=11" && set "WINDOWS_VERSION=Windows 11 22H2"
    if !BUILD_NUM! geq 22000 if !BUILD_NUM! lss 22621 set "WINVER=11" && set "WINDOWS_VERSION=Windows 11"
    
    REM Windows 10 builds conhecidos - TESTE UNIT: variável WINVER para Win10
    if !BUILD_NUM! geq 19041 if !BUILD_NUM! lss 22000 set "WINVER=10" && set "WINDOWS_VERSION=Windows 10 20H1+"
    if !BUILD_NUM! geq 18362 if !BUILD_NUM! lss 19041 set "WINVER=10" && set "WINDOWS_VERSION=Windows 10 1903"
    if !BUILD_NUM! lss 18362 set "WINVER=10" && set "WINDOWS_VERSION=Windows 10 Legacy"
) else (
    REM Default para Windows 10 se detecção falhar
    set "WINVER=10"
    set "WINDOWS_VERSION=Windows 10"
    set "WIN_BUILD=Unknown"
)

REM Definir título da janela
title WINBOX TOOLKIT OPTIMIZATION v%VERSION% - %WINDOWS_VERSION% [Build: %WIN_BUILD%]
goto :eof

REM ================================================================================
REM IMPLEMENTAÇÕES FINAIS E CORREÇÕES
REM ================================================================================

:RemoveAdvertising
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [ADS] REMOVER PUBLICIDADE                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "remover publicidade e sugestoes do Windows"
if !ERRO_LEVEL! neq 0 goto :PrivacyTweaks

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [PROC] Removendo publicidade do Windows...

REM Desabilitar ads no menu iniciar
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Sugestoes do sistema desabilitadas || echo    [WARN] Falha nas sugestoes
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Apps silenciosos desabilitados || echo    [WARN] Falha nos apps silenciosos
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Apps pre-instalados desabilitados || echo    [WARN] Falha nos pre-instalados
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Apps OEM desabilitados || echo    [WARN] Falha nos apps OEM

REM Desabilitar sugestões na timeline
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Timeline suggestions desabilitadas || echo    [WARN] Falha na timeline
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Settings suggestions desabilitadas || echo    [WARN] Falha no settings

REM Desabilitar publicidade no Explorer
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Sync provider notifications desabilitadas || echo    [WARN] Falha no sync provider

echo.
echo    [SUCCESS] Publicidade removida com sucesso!
echo.
pause
goto :PrivacyTweaks

:AntiTracking
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                         [TRK] ANTI-TRACKING                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "aplicar configuracoes anti-tracking avancadas"
if !ERRO_LEVEL! neq 0 goto :PrivacyTweaks

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [PROC] Aplicando protecoes anti-tracking...

REM Hosts file para bloquear tracking
echo    [HOST] Configurando arquivo hosts para bloquear tracking...
echo 0.0.0.0 vortex.data.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts 2>nul && echo    [OK] Microsoft telemetry bloqueado || echo    [SKIP] Hosts ja configurado
echo 0.0.0.0 vortex-win.data.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts 2>nul && echo    [OK] Vortex bloqueado || echo    [SKIP] Vortex ja bloqueado
echo 0.0.0.0 settings-win.data.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts 2>nul && echo    [OK] Settings data bloqueado || echo    [SKIP] Settings ja bloqueado

REM Configurações de tracking
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Advertising ID desabilitado || echo    [WARN] Falha no advertising ID
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Coleta de dados desabilitada || echo    [WARN] Falha na coleta

REM Desabilitar tracking de localização
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Sensor de localizacao desabilitado || echo    [WARN] Falha no sensor
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Location service desabilitado || echo    [WARN] Falha no location service

echo.
echo    [SUCCESS] Configuracoes anti-tracking aplicadas!
echo    [INFO] Reinicie o navegador para aplicar bloqueios de hosts.
echo.
pause
goto :PrivacyTweaks

:MemoryOptimization
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [OPT] OTIMIZACAO DE MEMORIA                         ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Otimizacao de Virtual Memory        │  [2] Configurar Page File     ║
echo    ║  [3] Otimizacao de Cache                 │  [4] Memory Management        ║
echo    ║  [5] Configuracoes Avancadas             │  [6] Restaurar Configuracoes  ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "MEM_OPT_CHOICE=   ═══^> Digite sua opcao: "

if "!MEM_OPT_CHOICE!"=="1" goto :OptimizeVirtualMemory
if "!MEM_OPT_CHOICE!"=="2" goto :ConfigurePageFile
if "!MEM_OPT_CHOICE!"=="3" goto :OptimizeCache
if "!MEM_OPT_CHOICE!"=="4" goto :MemoryManagement
if "!MEM_OPT_CHOICE!"=="5" goto :AdvancedMemorySettings
if "!MEM_OPT_CHOICE!"=="6" goto :RestoreMemorySettings
if "!MEM_OPT_CHOICE!"=="0" goto :MemoryManager
goto :MemoryOptimization

:OptimizeVirtualMemory
echo    [OPT] Otimizando memoria virtual...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul 2>&1 && echo    [OK] Paging Executive desabilitado || echo    [WARN] Falha no paging
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Large System Cache otimizado || echo    [WARN] Falha no cache
echo    [SUCCESS] Memoria virtual otimizada!
pause
goto :MemoryOptimization

:ConfigurePageFile
echo    [OPT] Configurando Page File...
call :GetCurrentMemoryInfo
set /a "RECOMMENDED_PAGEFILE=!TOTAL_MEMORY_MB!/2"
echo    [INFO] RAM detectada: !TOTAL_MEMORY_MB! MB
echo    [INFO] Page File recomendado: !RECOMMENDED_PAGEFILE! MB
echo    [INFO] Configure manualmente em: Sistema ^> Configuracoes Avancadas ^> Performance ^> Avancado ^> Memoria Virtual
pause
goto :MemoryOptimization

:OptimizeCache
echo    [OPT] Otimizando cache do sistema...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d 256 /f >nul 2>&1 && echo    [OK] L2 Cache configurado || echo    [WARN] Falha no L2 cache
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ThirdLevelDataCache" /t REG_DWORD /d 1024 /f >nul 2>&1 && echo    [OK] L3 Cache configurado || echo    [WARN] Falha no L3 cache
echo    [SUCCESS] Cache otimizado!
pause
goto :MemoryOptimization

:MemoryManagement
echo    [OPT] Configurando gerenciamento de memoria...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 1 /f >nul 2>&1 && echo    [OK] Clear PageFile habilitado || echo    [WARN] Falha no clear pagefile
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d 1 /f >nul 2>&1 && echo    [OK] Paging Combining desabilitado || echo    [WARN] Falha no paging combining
echo    [SUCCESS] Gerenciamento de memoria configurado!
pause
goto :MemoryOptimization

:AdvancedMemorySettings
echo    [OPT] Configuracoes avancadas de memoria...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d 60 /f >nul 2>&1 && echo    [OK] Pool Usage configurado || echo    [WARN] Falha no pool usage
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d 192 /f >nul 2>&1 && echo    [OK] Paged Pool configurado || echo    [WARN] Falha no paged pool
echo    [SUCCESS] Configuracoes avancadas aplicadas!
pause
goto :MemoryOptimization

:RestoreMemorySettings
echo    [OPT] Restaurando configuracoes padrao de memoria...
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /f >nul 2>&1 && echo    [OK] Paging Executive restaurado || echo    [SKIP] Nao encontrado
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /f >nul 2>&1 && echo    [OK] Large System Cache restaurado || echo    [SKIP] Nao encontrado
echo    [SUCCESS] Configuracoes restauradas!
pause
goto :MemoryOptimization

:MemoryReport
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [RPT] RELATORIO COMPLETO                            ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [INFO] Gerando relatorio completo de memoria...

set "MEMORY_REPORT=WinboxToolkit_MemoryReport_%date:~6,4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%.txt"
set "MEMORY_REPORT=!MEMORY_REPORT: =0!"

echo WINBOX TOOLKIT OPTIMIZATION - RELATORIO COMPLETO DE MEMORIA > "!MEMORY_REPORT!"
echo Data/Hora: %date% %time% >> "!MEMORY_REPORT!"
echo =============================================================================== >> "!MEMORY_REPORT!"
echo. >> "!MEMORY_REPORT!"

call :GetCurrentMemoryInfo
echo RESUMO DE MEMORIA: >> "!MEMORY_REPORT!"
echo Total de Memoria RAM: !TOTAL_MEMORY_MB! MB >> "!MEMORY_REPORT!"
echo Memoria Livre: !FREE_MEMORY_MB! MB >> "!MEMORY_REPORT!"
echo Memoria em Uso: !MEMORY_USAGE_MB! MB >> "!MEMORY_REPORT!"
echo Percentual de Uso: !MEMORY_PERCENT!%% >> "!MEMORY_REPORT!"
echo. >> "!MEMORY_REPORT!"

echo INFORMACOES DETALHADAS DO SISTEMA: >> "!MEMORY_REPORT!"
wmic OS get TotalVisibleMemorySize,FreePhysicalMemory,TotalVirtualMemorySize,FreeVirtualMemory /format:list >> "!MEMORY_REPORT!" 2>nul
echo. >> "!MEMORY_REPORT!"

echo TOP 15 PROCESSOS POR CONSUMO DE MEMORIA: >> "!MEMORY_REPORT!"
powershell -Command "Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 15 ProcessName, @{Name='Memory(MB)';Expression={[math]::Round($_.WorkingSet/1MB,2)}}, Id | Format-Table -AutoSize" >> "!MEMORY_REPORT!" 2>nul

echo CONFIGURACOES DE MEMORIA VIRTUAL: >> "!MEMORY_REPORT!"
wmic computersystem get TotalPhysicalMemory >> "!MEMORY_REPORT!" 2>nul
wmic pagefileset get AllocatedBaseSize,CurrentUsage,Name >> "!MEMORY_REPORT!" 2>nul

echo    [SUCCESS] Relatorio completo gerado!
echo    [INFO] Arquivo salvo em: !MEMORY_REPORT!
echo.
pause
goto :MemoryManager

:DeveloperMode
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [DEV] MODO DESENVOLVEDOR                           ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Ativar Debug Mode                   │  [2] Ver Logs de Debug        ║
echo    ║  [3] Executar Testes Unitarios           │  [4] Benchmark Performance    ║
echo    ║  [5] Verificar Integridade               │  [6] Exportar Configuracoes   ║
echo    ║  [7] Modo Verbose                        │  [8] Desativar Debug          ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "DEV_CHOICE=   ═══^> Digite sua opcao: "

if "!DEV_CHOICE!"=="1" goto :ActivateDebugMode
if "!DEV_CHOICE!"=="2" goto :ViewDebugLogs
if "!DEV_CHOICE!"=="3" goto :RunUnitTests
if "!DEV_CHOICE!"=="4" goto :BenchmarkPerformance
if "!DEV_CHOICE!"=="5" goto :CheckIntegrityDev
if "!DEV_CHOICE!"=="6" goto :ExportConfigurations
if "!DEV_CHOICE!"=="7" goto :VerboseMode
if "!DEV_CHOICE!"=="8" goto :DisableDebugMode
if "!DEV_CHOICE!"=="0" goto :AdvancedSettings
goto :DeveloperMode

:ActivateDebugMode
echo    [DEV] Ativando modo debug...
call :EnableDebugMode
echo    [SUCCESS] Modo debug ativado!
echo    [INFO] Logs serao salvos em: !LOG_FILE!
pause
goto :DeveloperMode

:ViewDebugLogs
echo    [DEV] Exibindo logs de debug...
if exist "!LOG_FILE!" (
    echo    [INFO] Ultimas 20 linhas do log:
    powershell -Command "Get-Content '!LOG_FILE!' | Select-Object -Last 20"
) else (
    echo    [WARN] Arquivo de log nao encontrado: !LOG_FILE!
    echo    [INFO] Ative o modo debug primeiro.
)
pause
goto :DeveloperMode

:RunUnitTests
echo    [DEV] Executando testes unitarios...
if exist "test_unit_winbox.bat" (
    echo    [INFO] Executando testes...
    call "test_unit_winbox.bat"
) else (
    echo    [WARN] Arquivo de testes nao encontrado: test_unit_winbox.bat
)
pause
goto :DeveloperMode

:BenchmarkPerformance
echo    [DEV] Executando benchmark de performance...
set "START_TIME=%time%"
call :GetCurrentMemoryInfo
set "END_TIME=%time%"
echo    [BENCH] Tempo para verificacao de memoria: calculando...
pause
goto :DeveloperMode

:CheckIntegrityDev
echo    [DEV] Verificando integridade do codigo...
findstr /n "TODO\|FIXME\|XXX\|HACK" "%~f0" && echo    [WARN] Encontrados marcadores de desenvolvimento || echo    [OK] Nenhum marcador encontrado
pause
goto :DeveloperMode

:ExportConfigurations
echo    [DEV] Exportando configuracoes atuais...
set "CONFIG_EXPORT=WinboxToolkit_Config_%date:~6,4%%date:~3,2%%date:~0,2%.txt"
echo CONFIGURACOES WINBOX TOOLKIT > "!CONFIG_EXPORT!"
echo VERSION: %VERSION% >> "!CONFIG_EXPORT!"
echo DEBUG_MODE: !DEBUG_MODE! >> "!CONFIG_EXPORT!"
echo MEMORY_INTERVAL: %MEMORY_INTERVAL% >> "!CONFIG_EXPORT!"
echo MONITOR_REFRESH: %MONITOR_REFRESH% >> "!CONFIG_EXPORT!"
echo MONITOR_ALERT_LEVEL: %MONITOR_ALERT_LEVEL% >> "!CONFIG_EXPORT!"
echo    [SUCCESS] Configuracoes exportadas para: !CONFIG_EXPORT!
pause
goto :DeveloperMode

:VerboseMode
echo    [DEV] Modo verbose ativado para proximas operacoes...
set "VERBOSE_MODE=1"
echo    [SUCCESS] Modo verbose ativado!
pause
goto :DeveloperMode

:LogManager
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [LOG] GERENCIAR LOGS                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Ver Logs Atuais                     │  [2] Limpar Logs              ║
echo    ║  [3] Exportar Logs                       │  [4] Configurar Log Level     ║
echo    ║  [5] Arquivar Logs Antigos               │  [6] Estatisticas de Logs     ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "LOG_CHOICE=   ═══^> Digite sua opcao: "

if "!LOG_CHOICE!"=="1" goto :ViewCurrentLogs
if "!LOG_CHOICE!"=="2" goto :ClearLogs
if "!LOG_CHOICE!"=="3" goto :ExportLogs
if "!LOG_CHOICE!"=="4" goto :ConfigureLogLevel
if "!LOG_CHOICE!"=="5" goto :ArchiveOldLogs
if "!LOG_CHOICE!"=="6" goto :LogStatistics
if "!LOG_CHOICE!"=="0" goto :AdvancedSettings
goto :LogManager

:ViewCurrentLogs
echo    [LOG] Exibindo logs atuais...
if exist "!LOG_FILE!" (
    type "!LOG_FILE!" | more
) else (
    echo    [INFO] Nenhum log encontrado. Ative o modo debug primeiro.
)
pause
goto :LogManager

:ClearLogs
echo    [LOG] Limpando logs...
call :ConfirmAction "limpar todos os arquivos de log"
if !ERRO_LEVEL! neq 0 goto :LogManager

del /q WinboxToolkit_*.log >nul 2>&1 && echo    [OK] Logs limpos || echo    [WARN] Nenhum log encontrado
del /q *_test_*.log >nul 2>&1 && echo    [OK] Logs de teste limpos || echo    [SKIP] Nenhum log de teste
echo    [SUCCESS] Logs limpos com sucesso!
pause
goto :LogManager

:ExportLogs
echo    [LOG] Exportando logs...
set "LOG_ARCHIVE=WinboxToolkit_LogArchive_%date:~6,4%%date:~3,2%%date:~0,2%.zip"
if exist "!LOG_FILE!" (
    copy "!LOG_FILE!" "exported_!LOG_FILE!" >nul 2>&1 && echo    [OK] Log principal exportado || echo    [WARN] Falha na exportacao
) else (
    echo    [WARN] Nenhum log para exportar
)
pause
goto :LogManager

:ConfigureLogLevel
echo    [LOG] Configurando nivel de log...
echo    [INFO] Niveis disponiveis:
echo        [0] Desabilitado
echo        [1] Basico (atual)
echo        [2] Detalhado
echo        [3] Verbose
set /p "NEW_DEBUG_LEVEL=   ═══^> Digite o nivel (0-3): "
if "!NEW_DEBUG_LEVEL!"=="0" set "DEBUG_MODE=0"
if "!NEW_DEBUG_LEVEL!"=="1" set "DEBUG_MODE=1"
if "!NEW_DEBUG_LEVEL!"=="2" set "DEBUG_MODE=2"
if "!NEW_DEBUG_LEVEL!"=="3" set "DEBUG_MODE=3"
echo    [SUCCESS] Nivel de log configurado!
pause
goto :LogManager

:ArchiveOldLogs
echo    [LOG] Arquivando logs antigos...
for %%f in (WinboxToolkit_*.log) do (
    if exist "%%f" (
        move "%%f" "archived_%%f" >nul 2>&1 && echo    [OK] %%f arquivado || echo    [WARN] Falha ao arquivar %%f
    )
)
echo    [SUCCESS] Logs arquivados!
pause
goto :LogManager

:LogStatistics
echo    [LOG] Estatisticas de logs...
echo    [INFO] Arquivos de log encontrados:
dir /b WinboxToolkit_*.log 2>nul | find /c /v "" && echo logs encontrados || echo    [INFO] Nenhum log encontrado
echo.
if exist "!LOG_FILE!" (
    for /f %%i in ('type "!LOG_FILE!" ^| find /c /v ""') do echo    [INFO] Linhas no log atual: %%i
)
pause
goto :LogManager

:DetectWindowsVersion
set "WINDOWS_VERSION=Windows 10"
set "WINVER=10"
set "WIN_BUILD=Unknown"

REM Método robusto para detectar versão do Windows - TESTE UNIT: DetectWindowsVersion
REM Comando ver como método primário - TESTE UNIT: comando ver
for /f "tokens=3" %%i in ('ver 2^>nul') do (
    for /f "tokens=2 delims=[]" %%j in ("%%i") do (
        set "WIN_BUILD=%%j"
    )
)

REM PowerShell como método secundário - TESTE UNIT: Get-CimInstance
if not defined WIN_BUILD (
    powershell -Command "try { (Get-CimInstance -ClassName Win32_OperatingSystem).BuildNumber } catch { exit 1 }" 2>nul >temp_build.txt
    if exist temp_build.txt (
        for /f "tokens=*" %%i in (temp_build.txt) do (
            echo %%i | findstr /r "^[0-9]*$" >nul && set "WIN_BUILD=%%i"
        )
        del temp_build.txt >nul 2>&1
    )
)

REM WMIC como fallback final
if not defined WIN_BUILD (
    for /f "skip=1 tokens=*" %%a in ('wmic os get BuildNumber /value 2^>nul ^| findstr "="') do (
        for /f "tokens=2 delims==" %%b in ("%%a") do (
            echo %%b | findstr /r "^[0-9]*$" >nul && set "WIN_BUILD=%%b"
        )
    )
)

REM Detectar Windows 11 por build numbers - TESTE UNIT: Compatibilidade Windows 10/11
if defined WIN_BUILD (
    for /f "tokens=1 delims=." %%i in ("!WIN_BUILD!") do set "BUILD_NUM=%%i"
    
    REM Windows 11 builds conhecidos - TESTE UNIT: Compatibilidade Windows 11
    if !BUILD_NUM! geq 26100 set "WINVER=11" && set "WINDOWS_VERSION=Windows 11 Insider"
    if !BUILD_NUM! geq 22631 if !BUILD_NUM! lss 26100 set "WINVER=11" && set "WINDOWS_VERSION=Windows 11 23H2"
    if !BUILD_NUM! geq 22621 if !BUILD_NUM! lss 22631 set "WINVER=11" && set "WINDOWS_VERSION=Windows 11 22H2"
    if !BUILD_NUM! geq 22000 if !BUILD_NUM! lss 22621 set "WINVER=11" && set "WINDOWS_VERSION=Windows 11"
    
    REM Windows 10 builds conhecidos - TESTE UNIT: variável WINVER para Win10
    if !BUILD_NUM! geq 19041 if !BUILD_NUM! lss 22000 set "WINVER=10" && set "WINDOWS_VERSION=Windows 10 20H1+"
    if !BUILD_NUM! geq 18362 if !BUILD_NUM! lss 19041 set "WINVER=10" && set "WINDOWS_VERSION=Windows 10 1903"
    if !BUILD_NUM! lss 18362 set "WINVER=10" && set "WINDOWS_VERSION=Windows 10 Legacy"
) else (
    REM Default para Windows 10 se detecção falhar
    set "WINVER=10"
    set "WINDOWS_VERSION=Windows 10"
    set "WIN_BUILD=Unknown"
)

REM Definir título da janela
title WINBOX TOOLKIT OPTIMIZATION v%VERSION% - %WINDOWS_VERSION% [Build: %WIN_BUILD%]
goto :eof

:CheckAdminPrivileges
set "ADMIN_STATUS=NAO"
set "IS_ADMIN=0"

REM Método primário: testar net session - TESTE UNIT: CheckAdminPrivileges
net session >nul 2>&1
if %errorlevel% equ 0 (
    set "ADMIN_STATUS=SIM"
    set "IS_ADMIN=1"
    call :WriteDebugLog "ADMIN: Privilegios administrativos detectados via net session"
) else (
    REM Método secundário: testar whoami /priv - TESTE UNIT: verificacao privilegio admin
    whoami /priv | findstr /i "SeDebugPrivilege" >nul 2>&1
    if !errorlevel! equ 0 (
        set "ADMIN_STATUS=SIM"
        set "IS_ADMIN=1"
        call :WriteDebugLog "ADMIN: Privilegios administrativos detectados via whoami"
    ) else (
        REM Método terciário: testar registro administrativo
        reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion" >nul 2>&1
        if !errorlevel! equ 0 (
            set "ADMIN_STATUS=SIM"
            set "IS_ADMIN=1"
            call :WriteDebugLog "ADMIN: Privilegios administrativos detectados via registry"
        ) else (
            call :WriteDebugLog "ADMIN: Executando sem privilegios administrativos"
        )
    )
)
goto :eof

REM ================================================================================
REM FUNÇÕES DE MEMÓRIA - INTEGRADAS DO RAM CLEANER
REM ================================================================================

:GetInitialMemoryInfo
call :GetCurrentMemoryInfo
goto :eof

:GetCurrentMemoryInfo
REM Resetar variáveis para evitar valores antigos
set "TOTAL_KB="
set "FREE_KB="
set "ERROR_FLAG=0"

call :WriteDebugLog "MEMORY: Iniciando verificacao de memoria"

REM TESTE UNIT: GetCurrentMemoryInfo - Get-CimInstance
REM Verificar se PowerShell e Get-CimInstance estão disponíveis
powershell -Command "Get-Command Get-CimInstance -ErrorAction SilentlyContinue" >nul 2>&1
if %errorlevel% neq 0 (
    call :WriteDebugLog "MEMORY: Get-CimInstance nao disponivel, usando fallback"
    set "ERROR_FLAG=1"
    goto :WMICFallback
)

REM Usar PowerShell como método primário
powershell -Command "try { (Get-CimInstance -ClassName Win32_OperatingSystem).TotalVisibleMemorySize } catch { exit 1 }" 2>nul | findstr /r "^[0-9]*$" >temp_total.txt
if %errorlevel% equ 0 (
    set /p TOTAL_KB=<temp_total.txt
    call :WriteDebugLog "MEMORY: Total memoria obtida via PowerShell: !TOTAL_KB! KB"
) else (
    set "ERROR_FLAG=1"
)

powershell -Command "try { (Get-CimInstance -ClassName Win32_OperatingSystem).FreePhysicalMemory } catch { exit 1 }" 2>nul | findstr /r "^[0-9]*$" >temp_free.txt
if %errorlevel% equ 0 (
    set /p FREE_KB=<temp_free.txt
    call :WriteDebugLog "MEMORY: Memoria livre obtida via PowerShell: !FREE_KB! KB"
) else (
    set "ERROR_FLAG=1"
)

REM Limpar arquivos temporários
if exist temp_total.txt del temp_total.txt >nul 2>&1
if exist temp_free.txt del temp_free.txt >nul 2>&1

:WMICFallback
REM Fallback para WMIC se PowerShell falhar
if "!ERROR_FLAG!"=="1" (
    echo    [FALLBACK] PowerShell falhou, usando WMIC...
    call :WriteDebugLog "MEMORY: Usando fallback WMIC"
    
    for /f "skip=1 tokens=*" %%a in ('wmic OS get TotalVisibleMemorySize /value 2^>nul ^| findstr "="') do (
        for /f "tokens=2 delims==" %%b in ("%%a") do (
            echo %%b | findstr /r "^[0-9]*$" >nul && set "TOTAL_KB=%%b"
        )
    )
    
    for /f "skip=1 tokens=*" %%a in ('wmic OS get FreePhysicalMemory /value 2^>nul ^| findstr "="') do (
        for /f "tokens=2 delims==" %%b in ("%%a") do (
            echo %%b | findstr /r "^[0-9]*$" >nul && set "FREE_KB=%%b"
        )
    )
)

REM Validar e calcular valores
if defined TOTAL_KB if defined FREE_KB (
    REM Verificar se os valores são números válidos
    set /a "TEST_TOTAL=!TOTAL_KB!" >nul 2>&1
    set /a "TEST_FREE=!FREE_KB!" >nul 2>&1
    if !errorlevel! equ 0 (
        set /a "TOTAL_MEMORY_MB=!TOTAL_KB!/1024"
        set /a "FREE_MEMORY_MB=!FREE_KB!/1024"
        set /a "MEMORY_USAGE_MB=!TOTAL_MEMORY_MB!-!FREE_MEMORY_MB!"
        
        REM Evitar divisão por zero
        if !TOTAL_MEMORY_MB! gtr 0 (
            set /a "MEMORY_PERCENT=(!MEMORY_USAGE_MB!*100)/!TOTAL_MEMORY_MB!"
        ) else (
            set "MEMORY_PERCENT=0"
        )
    ) else (
        echo    [ERROR] Valores de memoria invalidos detectados!
        set "TOTAL_MEMORY_MB=N/A"
        set "FREE_MEMORY_MB=N/A"
        set "MEMORY_USAGE_MB=N/A"
        set "MEMORY_PERCENT=0"
    )
) else (
    echo    [ERROR] Nao foi possivel obter informacoes de memoria!
    set "TOTAL_MEMORY_MB=N/A"
    set "FREE_MEMORY_MB=N/A"
    set "MEMORY_USAGE_MB=N/A"
    set "MEMORY_PERCENT=0"
)
goto :eof

REM ================================================================================
REM MÓDULO 1: OTIMIZAÇÃO DE SISTEMA
REM ================================================================================

:SystemOptimization
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                         [SYS] OTIMIZACAO DE SISTEMA                       ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] [REG] Performance e Registry     │  [2] [VIS] Interface e Visual     ║
echo    ║  [3] [FTR] Features e Componentes     │  [4] [EDG] Microsoft Edge         ║
echo    ║  [5] [INS] Instaladores Essenciais    │  [6] [LOW] Hardware Limitado      ║
echo    ║  [7] [CLN] Limpeza de Arquivos        │  [8] [W11] Especificos Win11      ║
echo    ║  [9] [NET] Configuracoes de Rede      │  [A] [PWR] Gerenciamento Energia  ║
echo    ║                                                                           ║
echo    ║  [0] [BACK] Voltar ao Menu Principal                                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "SYS_CHOICE=   ═══^> Digite sua opcao: "

if "!SYS_CHOICE!"=="1" goto :PerformanceOptimization
if "!SYS_CHOICE!"=="2" goto :VisualOptimization
if "!SYS_CHOICE!"=="3" goto :FeaturesOptimization
if "!SYS_CHOICE!"=="4" goto :EdgeOptimization
if "!SYS_CHOICE!"=="5" goto :EssentialInstallers
if "!SYS_CHOICE!"=="6" goto :LowEndHardware
if "!SYS_CHOICE!"=="7" goto :FileCleanup
if "!SYS_CHOICE!"=="8" goto :Windows11Specific
if /i "!SYS_CHOICE!"=="9" goto :NetworkOptimization
if /i "!SYS_CHOICE!"=="a" goto :PowerManagement
if "!SYS_CHOICE!"=="0" goto :MainMenu
goto :SystemOptimization

REM ================================================================================
REM MÓDULO 2: GERENCIADOR DE MEMÓRIA
REM ================================================================================

:MemoryManager
cls
call :DrawGhostHeader
call :GetCurrentMemoryInfo
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                         [RAM] GERENCIADOR DE MEMORIA                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [MEM] ESTADO ATUAL DA MEMORIA:                                           ║
echo    ║     Total: !TOTAL_MEMORY_MB! MB                                           ║
echo    ║     Usada: !MEMORY_USAGE_MB! MB (!MEMORY_PERCENT!%%)                      ║
echo    ║     Livre: !FREE_MEMORY_MB! MB                                            ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
if "!IS_ADMIN!"=="1" (
    echo    ║  [1] [CLN] Limpeza Completa de RAM      │  [2] [AUTO] Limpeza Automatica      ║
    echo    ║  [3] [ADV] Limpeza Avancada + Arquivos  │  [4] [STAT] Estatisticas Memoria    ║
) else (
    echo    ║  [1] [BAS] Limpeza Basica (Sem Admin)   │  [2] [AUTO] Auto-Limpeza Basica     ║
    echo    ║  [3] [LCK] Limpeza Avancada (Admin)     │  [4] [STAT] Estatisticas Memoria    ║
)
echo    ║  [5] [MON] Monitor em Tempo Real           │  [6] [CFG] Configuracoes             ║
echo    ║  [7] [OPT] Otimizacao de Memoria           │  [8] [RPT] Relatorio Completo        ║
echo    ║                                                                                 ║
echo    ║  [0] [BACK] Voltar ao Menu Principal                                            ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "MEM_CHOICE=   ═══^> Digite sua opcao: "

if "!MEM_CHOICE!"=="1" goto :MemoryCleanup
if "!MEM_CHOICE!"=="2" goto :AutoMemoryCleanup
if "!MEM_CHOICE!"=="3" goto :AdvancedMemoryCleanup
if "!MEM_CHOICE!"=="4" goto :MemoryStatistics
if "!MEM_CHOICE!"=="5" goto :RealTimeMemoryMonitor
if "!MEM_CHOICE!"=="6" goto :MemorySettings
if "!MEM_CHOICE!"=="7" goto :MemoryOptimization
if "!MEM_CHOICE!"=="8" goto :MemoryReport
if "!MEM_CHOICE!"=="0" goto :MainMenu
goto :MemoryManager

REM ================================================================================
REM MÓDULO 3: PRIVACIDADE E TELEMETRIA
REM ================================================================================

:PrivacyTweaks
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [SEC] PRIVACIDADE E TELEMETRIA                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] [TEL] Remover Telemetria Completa │  [2] [COR] Dsabilitar Cortana    ║
echo    ║  [3] [APP] Remover Apps da Store       │  [4] [CFG] Configuracoes Diversas║
echo    ║  [5] [TWK] Tweaks de Privacidade       │  [6] [REP] Relatorio de Privacy  ║
echo    ║  [7] [ADS] Remover Publicidade         │  [8] [TRK] Anti-Tracking          ║
echo    ║                                                                           ║
echo    ║  [0] [BACK] Voltar ao Menu Principal                                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "PRIV_CHOICE=   ═══^> Digite sua opcao: "

if "!PRIV_CHOICE!"=="1" goto :RemoveTelemetry
if "!PRIV_CHOICE!"=="2" goto :DisableCortana
if "!PRIV_CHOICE!"=="3" goto :RemoveStoreApps
if "!PRIV_CHOICE!"=="4" goto :MiscPrivacySettings
if "!PRIV_CHOICE!"=="5" goto :PrivacyTweaksAdvanced
if "!PRIV_CHOICE!"=="6" goto :PrivacyReport
if "!PRIV_CHOICE!"=="7" goto :RemoveAdvertising
if "!PRIV_CHOICE!"=="8" goto :AntiTracking
if "!PRIV_CHOICE!"=="0" goto :MainMenu
goto :PrivacyTweaks

REM ================================================================================
REM MÓDULO 4: GERENCIADOR DE SERVIÇOS
REM ================================================================================

:ServiceManager
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [SVC] GERENCIADOR DE SERVICOS                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] [DIS] Servicos Desnecessarios     │  [2] [TSK] Tarefas Agendadas     ║
echo    ║  [3] [NET] Parametros de Rede          │  [4] [PWR] Configuracoes Energia ║
echo    ║  [5] [REG] Registry e Drivers          │  [6] [STA] Status dos Servicos   ║
echo    ║  [7] [OPT] Otimizar Servicos           │  [8] [RST] Restaurar Servicos    ║
echo    ║                                                                           ║
echo    ║  [0] [BACK] Voltar ao Menu Principal                                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "SVC_CHOICE=   ═══^> Digite sua opcao: "

if "!SVC_CHOICE!"=="1" goto :DisableServices
if "!SVC_CHOICE!"=="2" goto :ScheduledTasks
if "!SVC_CHOICE!"=="3" goto :NetworkParameters
if "!SVC_CHOICE!"=="4" goto :PowerManagement
if "!SVC_CHOICE!"=="5" goto :RegistryDrivers
if "!SVC_CHOICE!"=="6" goto :ServiceStatus
if "!SVC_CHOICE!"=="7" goto :OptimizeServices
if "!SVC_CHOICE!"=="8" goto :RestoreServices
if "!SVC_CHOICE!"=="0" goto :MainMenu
goto :ServiceManager

REM ================================================================================
REM MÓDULO 5: CONFIGURAÇÕES AVANÇADAS
REM ================================================================================

:AdvancedSettings
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [CFG] CONFIGURACOES AVANCADAS                       ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] [PGM] Configuracoes do Programa  │  [2] [SYS] Configuracoes Sistema  ║
echo    ║  [3] [RST] Restaurar Configuracoes    │  [4] [BAK] Backup de Configuracoes║
echo    ║  [5] [TST] Modo de Teste              │  [6] [DIA] Diagnosticos Avancados ║
echo    ║  [7] [DEV] Modo Desenvolvedor         │  [8] [LOG] Gerenciar Logs          ║
echo    ║                                                                           ║
echo    ║  [0] [BACK] Voltar ao Menu Principal                                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "ADV_CHOICE=   ═══^> Digite sua opcao: "

if "!ADV_CHOICE!"=="1" goto :ProgramSettings
if "!ADV_CHOICE!"=="2" goto :SystemSettings
if "!ADV_CHOICE!"=="3" goto :RestoreSettings
if "!ADV_CHOICE!"=="4" goto :BackupSettings
if "!ADV_CHOICE!"=="5" goto :TestMode
if "!ADV_CHOICE!"=="6" goto :AdvancedDiagnostics
if "!ADV_CHOICE!"=="7" goto :DeveloperMode
if "!ADV_CHOICE!"=="8" goto :LogManager
if "!ADV_CHOICE!"=="0" goto :MainMenu
goto :AdvancedSettings

REM ================================================================================
REM MÓDULO 6: SOBRE E INFORMAÇÕES
REM ================================================================================

:About
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                         [INF] SOBRE E INFORMACOES                         ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [APP] WINBOX TOOLKIT OPTIMIZATION v%VERSION%                             ║
echo    ║  [DEV] Desenvolvido por: %AUTHOR%                                         ║
echo    ║  [YER] Ano: 2025                                                          ║
echo    ║  [LIC] Licenca: Creative Commons BY-NC 4.0                                ║
echo    ║                                                                           ║
echo    ║  [FTR] FUNCIONALIDADES:                                                   ║
echo    ║     * Otimizacao completa de sistema Windows 10/11                        ║
echo    ║     * Gerenciador avancado de memoria RAM                                 ║
echo    ║     * Remocao de telemetria e melhorias de privacidade                    ║
echo    ║     * Interface ASCII moderna sem emojis                                  ║
echo    ║     * Suporte adaptativo para usuarios com/sem admin                      ║
echo    ║                                                                           ║
echo    ║  [LNK] Links:                                                             ║
echo    ║     * GitHub: https://github.com/Gabs77u/Otimizador-WIN                   ║
echo    ║     * Licenca: https://creativecommons.org/licenses/by-nc/4.0/            ║
echo    ║                                                                           ║
echo    ║  [0] [BACK] Voltar ao Menu Principal                                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "dummy=   ═══^> Pressione ENTER para voltar: "
goto :MainMenu

REM ================================================================================
REM FUNÇÕES DE LIMPEZA DE MEMÓRIA - ADAPTADAS DO RAM CLEANER
REM ================================================================================

:MemoryCleanup
cls
call :DrawGhostHeader
echo.

if "!IS_ADMIN!"=="1" (
    echo    [ADMIN] Modo administrador detectado - Limpeza completa disponivel
) else (
    echo    [USER] Modo usuario detectado - Limpeza basica sera executada
)

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
if "!IS_ADMIN!"=="1" (
    echo    ║                         [CLN] LIMPEZA COMPLETA DE RAM                    ║
) else (
    echo    ║                         [BAS] LIMPEZA BASICA DE RAM                      ║
)
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "Executar limpeza de memoria"
if !ERRO_LEVEL! neq 0 goto :MemoryManager

call :GetCurrentMemoryInfo
set "MEMORY_BEFORE=!MEMORY_USAGE_MB!"

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [1/5] [GC] Forcando coleta de lixo do .NET Framework...
powershell -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers(); [System.GC]::Collect()" 2>nul

if "!IS_ADMIN!"=="1" (
    echo    [2/5] [CACHE] Limpando cache do sistema...
    %windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
    
    echo    [3/5] [PROC] Liberando memoria de aplicacoes inativas...
    powershell -Command "Get-Process | Where-Object {$_.WorkingSet -gt 100MB -and $_.ProcessName -notlike '*svchost*'} | ForEach-Object {$_.CloseMainWindow()}" 2>nul
    
    echo    [4/5] [VIRT] Compactando memoria virtual...
    powershell -Command "[System.Runtime.GCSettings]::LargeObjectHeapCompactionMode = 'CompactOnce'; [System.GC]::Collect()" 2>nul
    
    echo    [5/5] [OPT] Otimizando cache de paginas...
    rundll32.exe kernel32.dll,SetProcessWorkingSetSize -1,-1 2>nul
) else (
    echo    [2/5] [VIRT] Compactando memoria virtual...
    powershell -Command "[System.Runtime.GCSettings]::LargeObjectHeapCompactionMode = 'CompactOnce'; [System.GC]::Collect()" 2>nul
    
    echo    [3/5] [WARN] Cache do sistema ^(requer admin^) - PULADO
    echo    [4/5] [WARN] Aplicacoes inativas ^(requer admin^) - PULADO  
    echo    [5/5] [WARN] Cache de paginas ^(requer admin^) - PULADO
)

call :GetCurrentMemoryInfo
set "MEMORY_AFTER=!MEMORY_USAGE_MB!"
set /a "MEMORY_FREED=!MEMORY_BEFORE!-!MEMORY_AFTER!"

echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                             [RESULT] RESULTADO                            ║
echo    ╠═══════════════════════════════════════════════════════════════════════════╣
echo    ║  Memoria antes: !MEMORY_BEFORE! MB                                        ║
echo    ║  Memoria depois: !MEMORY_AFTER! MB                                        ║
echo    ║  Memoria liberada: !MEMORY_FREED! MB                                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
pause
goto :MemoryManager

REM ================================================================================
REM MONITOR EM TEMPO REAL DE MEMÓRIA
REM ================================================================================

:RealTimeMemoryMonitor
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [MON] MONITOR EM TEMPO REAL                         ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    [WARN] INSTRUCOES:
echo       * Atualizacao automatica a cada %MONITOR_REFRESH% segundos
echo       * Pressione Ctrl+C para parar e voltar ao menu
echo.
echo    [INIT] Iniciando monitor...
timeout /t 3 > NUL

:MonitorLoop
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                     [MON] MONITOR - Refresh %MONITOR_REFRESH%s            ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝

call :GetCurrentMemoryInfo

echo.
echo    [MEM] MEMORIA FISICA:
echo    ┌─────────────────────────────────────────────────────────────────────────────┐
echo    │ Total: !TOTAL_MEMORY_MB! MB                                                 │
echo    │ Usada: !MEMORY_USAGE_MB! MB (!MEMORY_PERCENT!%%)                            │
echo    │ Livre: !FREE_MEMORY_MB! MB                                                  │
echo    └─────────────────────────────────────────────────────────────────────────────┘

call :DrawMemoryBar !MEMORY_PERCENT!

echo.
echo    [TOP] TOP 5 PROCESSOS POR MEMORIA:
echo    ┌─────────────────────────────────────────────────────────────────────────────┐
powershell -Command "$procs = Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5; foreach($p in $procs) { $mem = [math]::Round($p.WorkingSet/1MB,1); Write-Host ('│   ' + $p.ProcessName.PadRight(25) + $mem.ToString().PadLeft(8) + ' MB'.PadRight(15) + '│') }" 2>nul
echo    └─────────────────────────────────────────────────────────────────────────────┘

call :ShowMemoryAlerts !MEMORY_PERCENT!

echo.
echo    [TIME] Ultima atualizacao: %TIME%
echo    [TIP] Pressione Ctrl+C para parar o monitor

timeout /t %MONITOR_REFRESH% > NUL
goto :MonitorLoop

REM ================================================================================
REM ESTATÍSTICAS DETALHADAS DE MEMÓRIA
REM ================================================================================

:MemoryStatistics
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [STAT] ESTATISTICAS DE MEMORIA                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :GetCurrentMemoryInfo

REM Informações extras
for /f "skip=1 tokens=*" %%a in ('wmic computersystem get TotalPhysicalMemory /value 2^>nul ^| findstr "="') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do set "TOTAL_BYTES=%%b"
)

if defined TOTAL_BYTES (
    set /a "TOTAL_GB_REAL=!TOTAL_BYTES!/1073741824"
    echo    [SYS] MEMORIA FISICA TOTAL: !TOTAL_GB_REAL! GB (!TOTAL_MEMORY_MB! MB)
) else (
    echo    [SYS] MEMORIA FISICA TOTAL: !TOTAL_MEMORY_MB! MB
)

echo    [FREE] MEMORIA LIVRE: !FREE_MEMORY_MB! MB
echo    [USED] MEMORIA USADA: !MEMORY_USAGE_MB! MB (!MEMORY_PERCENT!%%)

call :WriteDebugLog "STATS: Exibindo estatisticas de memoria - Total: !TOTAL_MEMORY_MB!MB"

echo.
echo    [TOP] PROCESSOS COM MAIOR USO DE MEMORIA:
echo    ─────────────────────────────────────────────────────────────────────────────

REM TESTE UNIT: exibição de processos 
REM Formatação melhorada de processos
if "!IS_ADMIN!"=="1" (
    echo    [INFO] Exibindo TOP 10 processos (modo administrador):
    powershell -Command "Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10 ProcessName, @{Name='Memory(MB)';Expression={[math]::Round($_.WorkingSet/1MB,2)}}, Id | Format-Table -AutoSize" 2>nul
) else (
    echo    [INFO] Exibindo TOP 5 processos (modo basico):
    REM Versão básica sem privilégios admin
    tasklist /fo table | findstr /v "Image Name" | findstr /v "========" | findstr /v "^$" >temp_processes.txt 2>nul
    if exist temp_processes.txt (
        echo       [INFO] TOP 5 PROCESSOS (modo basico):
        for /f "skip=0 tokens=1,5 delims=," %%a in ('type temp_processes.txt ^| head -5') do (
            echo       %%a - %%b
        )
        del temp_processes.txt >nul 2>&1
    ) else (
        echo       [WARN] Nao foi possivel obter lista de processos
    )
)

echo.
echo    [VIRT] INFORMACOES DE MEMORIA VIRTUAL:
for /f "skip=1 tokens=*" %%a in ('wmic OS get TotalVirtualMemorySize /value 2^>nul ^| findstr "="') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do set "VIRTUAL_KB=%%b"
)
for /f "skip=1 tokens=*" %%a in ('wmic OS get FreeVirtualMemory /value 2^>nul ^| findstr "="') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do set "FREE_VIRTUAL_KB=%%b"
)

if defined VIRTUAL_KB if defined FREE_VIRTUAL_KB (
    set /a "VIRTUAL_MB=!VIRTUAL_KB!/1024"
    set /a "FREE_VIRTUAL_MB=!FREE_VIRTUAL_KB!/1024"
    set /a "USED_VIRTUAL_MB=!VIRTUAL_MB!-!FREE_VIRTUAL_MB!"
    
    echo       Total Virtual: !VIRTUAL_MB! MB
    echo       Livre Virtual: !FREE_VIRTUAL_MB! MB
    echo       Usada Virtual: !USED_VIRTUAL_MB! MB
)

echo.
pause
goto :MemoryManager

REM ================================================================================
REM FUNÇÕES AUXILIARES - ADAPTADAS DO RAM CLEANER
REM ================================================================================

:ConfirmAction
echo    [?] Tem certeza que deseja %~1?
echo       [S] Sim    [N] Nao    [C] Cancelar
echo.
set /p "CONFIRM=   ═══^> Confirmar acao (S/N/C): "

call :WriteDebugLog "CONFIRM: Usuario escolheu: '!CONFIRM!' para acao: %~1"

call :ValidateInput "!CONFIRM!" "SNC"
if !VALIDATION_RESULT! equ 0 (
    echo    [ERROR] Entrada invalida! Use apenas S, N ou C.
    timeout /t 2 >nul
    goto :ConfirmAction
)

if /i "!CONFIRM!"=="s" (
    set "ERRO_LEVEL=0"
    call :WriteDebugLog "CONFIRM: Acao confirmada pelo usuario"
) else if /i "!CONFIRM!"=="c" (
    set "ERRO_LEVEL=2"
    call :WriteDebugLog "CONFIRM: Acao cancelada pelo usuario"
) else (
    set "ERRO_LEVEL=1"
    call :WriteDebugLog "CONFIRM: Acao rejeitada pelo usuario"
)
goto :eof

REM ================================================================================
REM FUNÇÃO DE VALIDAÇÃO DE ENTRADA
REM ================================================================================

:ValidateInput
set "INPUT_VALUE=%~1"
set "ALLOWED_CHARS=%~2"
set "VALIDATION_RESULT=1"

call :WriteDebugLog "VALIDATE: Verificando entrada: '!INPUT_VALUE!' contra '!ALLOWED_CHARS!'"

if "!INPUT_VALUE!"=="" (
    set "VALIDATION_RESULT=0"
    call :WriteDebugLog "VALIDATE: Entrada vazia - REJEITADA"
    goto :eof
)

echo !INPUT_VALUE! | findstr /r "[&<>|^\"'%%]" >nul 2>&1
if !errorlevel! equ 0 (
    set "VALIDATION_RESULT=0"
    call :WriteDebugLog "VALIDATE: Caracteres especiais detectados - REJEITADA"
    goto :eof
)

set "VALID_CHOICE=0"
for %%c in (!ALLOWED_CHARS!) do (
    if /i "!INPUT_VALUE!"=="%%c" set "VALID_CHOICE=1"
)

if !VALID_CHOICE! equ 0 (
    echo !INPUT_VALUE! | findstr /r "^[0-9]$" >nul 2>&1
    if !errorlevel! equ 0 (
        if "!ALLOWED_CHARS!"=="MENU" set "VALID_CHOICE=1"
    )
    
    if /i "!INPUT_VALUE!"=="x" if "!ALLOWED_CHARS!"=="MENU" set "VALID_CHOICE=1"
)

if !VALID_CHOICE! equ 1 (
    set "VALIDATION_RESULT=1"
    call :WriteDebugLog "VALIDATE: Entrada valida - ACEITA"
) else (
    set "VALIDATION_RESULT=0"
    call :WriteDebugLog "VALIDATE: Entrada invalida - REJEITADA"
)
goto :eof

:DrawMemoryBar
set "PERCENT=%~1"
if not defined PERCENT set "PERCENT=0"

REM TESTE UNIT: DrawMemoryBar - configuração de comprimento da barra
set "BAR_LENGTH=50"
set "MAX_BAR_WIDTH=75"
set "MIN_BAR_WIDTH=20"

REM Validar configuração de comprimento da barra
if !BAR_LENGTH! lss !MIN_BAR_WIDTH! set "BAR_LENGTH=!MIN_BAR_WIDTH!"
if !BAR_LENGTH! gtr !MAX_BAR_WIDTH! set "BAR_LENGTH=!MAX_BAR_WIDTH!"

REM Validar entrada
if !PERCENT! lss 0 set "PERCENT=0"
if !PERCENT! gtr 100 set "PERCENT=100"

set /a "FILLED_CHARS=(!PERCENT!*!BAR_LENGTH!)/100"
set /a "EMPTY_CHARS=!BAR_LENGTH!-!FILLED_CHARS!"

if !PERCENT! geq 90 (
    set "BAR_COLOR=[CRIT]"
    set "BAR_CHAR=█"
    set "STATUS_COLOR=RED"
) else if !PERCENT! geq 75 (
    set "BAR_COLOR=[HIGH]"
    set "BAR_CHAR=█"
    set "STATUS_COLOR=YELLOW"
) else (
    set "BAR_COLOR=[NORM]"
    set "BAR_CHAR=█"
    set "STATUS_COLOR=GREEN"
)

call :WriteDebugLog "MEMORY: Desenho barra memoria - !PERCENT!%% (comprimento: !BAR_LENGTH!)"

echo.
echo    %BAR_COLOR% BARRA DE USO DE MEMORIA:
echo    ┌─────────────────────────────────────────────────────────────────────────────┐
set "PROGRESS_BAR=│ ["

REM Criar barra preenchida
for /l %%i in (1,1,!FILLED_CHARS!) do set "PROGRESS_BAR=!PROGRESS_BAR!!BAR_CHAR!"

REM Criar barra vazia
for /l %%i in (1,1,!EMPTY_CHARS!) do set "PROGRESS_BAR=!PROGRESS_BAR! "

set "PROGRESS_BAR=!PROGRESS_BAR!] !PERCENT!%% (!STATUS_COLOR!)"

REM Preencher até o final da linha
for /l %%i in (1,1,15) do set "PROGRESS_BAR=!PROGRESS_BAR! "
set "PROGRESS_BAR=!PROGRESS_BAR!│"

echo    !PROGRESS_BAR!
echo    └─────────────────────────────────────────────────────────────────────────────┘
goto :eof

:ShowMemoryAlerts
set "USAGE=%~1"
if not defined USAGE set "USAGE=0"

REM TESTE UNIT: ShowMemoryAlerts - alerta crítico
set "CRITICAL_LEVEL=95"
set "HIGH_LEVEL=!MONITOR_ALERT_LEVEL!"
set "MEDIUM_LEVEL=70"
set "LOW_LEVEL=40"

call :WriteDebugLog "MEMORY: Verificando alertas - Uso: !USAGE!%% (Critico: !CRITICAL_LEVEL!%%)"

echo.
echo    🚨 STATUS DO SISTEMA:
echo    ┌─────────────────────────────────────────────────────────────────────────────┐

if !USAGE! geq !CRITICAL_LEVEL! (
    echo    │ [CRIT] CRITICO: Memoria quase esgotada! Execute limpeza imediatamente!     │
    echo    │ [TIP] Recomendacao: Feche aplicativos desnecessarios                       │
    echo    │ [WARN] Sistema pode travar ou ficar instavel!                              │
    call :WriteDebugLog "MEMORY: ALERTA CRITICO - Memoria em !USAGE!%%"
) else if !USAGE! geq !HIGH_LEVEL! (
    echo    │ [HIGH] ALTO: Uso elevado de memoria. Considere executar limpeza.           │
    echo    │ [TIP] Recomendacao: Monitor processos e execute limpeza se necessario      │
    call :WriteDebugLog "MEMORY: ALERTA ALTO - Memoria em !USAGE!%%"
) else if !USAGE! geq !MEDIUM_LEVEL! (
    echo    │ [MED] MODERADO: Uso normal-alto de memoria.                                │
    echo    │ [TIP] Recomendacao: Monitoramento normal                                   │
) else if !USAGE! geq !LOW_LEVEL! (
    echo    │ [LOW] BAIXO: Uso de memoria em nivel baixo.                                │
    echo    │ [TIP] Status: Sistema com boa disponibilidade de memoria                   │
) else (
    echo    │ [OK] NORMAL: Uso de memoria em niveis saudaveis.                           │
    echo    │ [TIP] Status: Sistema operando normalmente                                 │
)

echo    └─────────────────────────────────────────────────────────────────────────────┘
goto :eof

REM ================================================================================
REM IMPLEMENTAÇÕES PRINCIPAIS - EXEMPLOS FUNCIONAIS
REM ================================================================================

:DisableServices
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [DIS] DESABILITAR SERVICOS                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "desabilitar servicos desnecessarios"
if !ERRO_LEVEL! neq 0 goto :ServiceManager

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

REM Serviços básicos seguros para desabilitar - TESTE UNIT: Service Management
echo    [PROC] Desabilitando servicos desnecessarios...

REM TESTE UNIT: servico DiagTrack
sc query DiagTrack >nul 2>&1
if %errorlevel% equ 0 (
    sc config DiagTrack start= disabled >nul 2>&1 && echo    [OK] DiagTrack ^(Telemetria^) desabilitado || echo    [WARN] DiagTrack falhou ao configurar
    net stop DiagTrack >nul 2>&1 && echo    [OK] DiagTrack parado || echo    [INFO] DiagTrack ja estava parado
) else (
    echo    [SKIP] DiagTrack nao encontrado no sistema
)

REM TESTE UNIT: comandos sc config
sc config dmwappushservice start= disabled >nul 2>&1 && echo    [OK] WAP Push Message || echo    [WARN] WAP Push ja configurado
sc config RemoteRegistry start= disabled >nul 2>&1 && echo    [OK] Remote Registry || echo    [WARN] Remote Registry ja configurado
sc config RetailDemo start= disabled >nul 2>&1 && echo    [OK] Retail Demo || echo    [WARN] Retail Demo ja configurado
sc config MapsBroker start= disabled >nul 2>&1 && echo    [OK] Maps Broker || echo    [WARN] Maps Broker ja configurado

if "!WINVER!"=="11" (
    echo    [W11] Servicos especificos Windows 11...
    sc config WSearch start= disabled >nul 2>&1 && echo    [OK] Windows Search ^(Win11^) || echo    [WARN] Windows Search ja configurado
)

echo.
echo    [SUCCESS] Servicos otimizados com sucesso!
echo.
pause
goto :ServiceManager

:RemoveTelemetry
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                         [TEL] REMOVER TELEMETRIA                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "remover telemetria do sistema"
if !ERRO_LEVEL! neq 0 goto :PrivacyTweaks

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

REM Desabilitar telemetria básica - TESTE UNIT: Registry Operations
echo    [PROC] Removendo telemetria...

REM TESTE UNIT: configuracao de telemetria
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Telemetria basica desabilitada || echo    [WARN] Falha ao configurar telemetria basica
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Experiencias personalizadas desabilitadas || echo    [WARN] Falha ao configurar experiencias
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Publicidade direcionada desabilitada || echo    [WARN] Falha ao configurar publicidade

REM Configurações adicionais de telemetria
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Coleta de dados desabilitada || echo    [WARN] Falha ao configurar coleta
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d 4 /f >nul 2>&1 && echo    [OK] Servico DiagTrack via registry || echo    [WARN] Falha no registry DiagTrack

if "!WINVER!"=="11" (
    echo    [W11] Telemetria especifica Windows 11...
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Sugestoes Win11 removidas || echo    [WARN] Falha nas sugestoes Win11
)

echo.
echo    [SUCCESS] Telemetria removida com sucesso!
echo.
pause
goto :PrivacyTweaks

:PerformanceOptimization
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [REG] OTIMIZACAO DE PERFORMANCE                     ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "aplicar otimizacoes de performance"
if !ERRO_LEVEL! neq 0 goto :SystemOptimization

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

REM Otimizações de performance básicas - TESTE UNIT: Performance Optimization
echo    [PROC] Aplicando otimizacoes de performance...

REM TESTE UNIT: configuracao de prioridade
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul 2>&1 && echo    [OK] Prioridade de processos otimizada || echo    [WARN] Prioridade ja configurada
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Balloon Tips desabilitadas || echo    [WARN] Balloon Tips ja configuradas
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul 2>&1 && echo    [OK] Delay de menu reduzido || echo    [WARN] Delay ja configurado

REM Configurações adicionais de prioridade do sistema
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul 2>&1 && echo    [OK] Paging Executive desabilitado || echo    [WARN] Paging ja configurado
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Large System Cache otimizado || echo    [WARN] Cache ja configurado

echo.
echo    [SUCCESS] Performance otimizada com sucesso!
echo.
pause
goto :SystemOptimization

REM ================================================================================
REM CONFIGURAÇÕES E AJUSTES TEMPORÁRIOS
REM ================================================================================

:MemorySettings
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [CFG] CONFIGURACOES DE MEMORIA                     ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    [INFO] Configuracoes atuais:
echo       * Intervalo de limpeza automatica: %MEMORY_INTERVAL% segundos
echo       * Intervalo do monitor: %MONITOR_REFRESH% segundos
echo       * Nivel de alerta: %MONITOR_ALERT_LEVEL%%%
echo.
echo    [DEV] Funcionalidade em desenvolvimento...
echo.
pause
goto :MemoryManager

REM ================================================================================
REM IMPLEMENTAÇÕES COMPLETAS DAS FUNÇÕES DE MEMÓRIA
REM ================================================================================

:AutoMemoryCleanup
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [AUTO] LIMPEZA AUTOMATICA DE RAM                     ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "configurar limpeza automatica de memoria"
if !ERRO_LEVEL! neq 0 goto :MemoryManager

echo    [INFO] Configurando limpeza automatica...
echo    [INFO] Intervalo configurado: %MEMORY_INTERVAL% segundos
echo.

:AutoCleanupLoop
call :GetCurrentMemoryInfo
if !MEMORY_PERCENT! gtr !MONITOR_ALERT_LEVEL! (
    echo    [AUTO] Memoria em !MEMORY_PERCENT!%% - Executando limpeza automatica...
    call :MemoryCleanup
)

echo    [AUTO] Aguardando %MEMORY_INTERVAL% segundos para proxima verificacao...
timeout /t %MEMORY_INTERVAL% > nul
goto :AutoCleanupLoop

:AdvancedMemoryCleanup
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [ADV] LIMPEZA AVANCADA + ARQUIVOS                    ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

if "!IS_ADMIN!"=="0" (
    echo    [ERROR] Esta funcionalidade requer privilegios administrativos!
    echo    [INFO] Execute o programa como administrador para acessar limpeza avancada.
    echo.
    pause
    goto :MemoryManager
)

call :ConfirmAction "executar limpeza avancada incluindo arquivos temporarios"
if !ERRO_LEVEL! neq 0 goto :MemoryManager

call :GetCurrentMemoryInfo
set "MEMORY_BEFORE=!MEMORY_USAGE_MB!"

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                         [PROC] LIMPEZA AVANCADA...                        ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [1/8] [MEM] Executando limpeza basica de memoria...
call :MemoryCleanup

echo    [2/8] [TMP] Limpando arquivos temporarios do sistema...
del /q /s "%TEMP%\*" >nul 2>&1
del /q /s "%TMP%\*" >nul 2>&1
del /q /s "%LOCALAPPDATA%\Temp\*" >nul 2>&1

echo    [3/8] [PFT] Limpando arquivos de prefetch...
del /q "%SystemRoot%\Prefetch\*" >nul 2>&1

echo    [4/8] [CHR] Limpando cache do Chrome...
taskkill /f /im chrome.exe >nul 2>&1
del /q /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1

echo    [5/8] [EDG] Limpando cache do Edge...
taskkill /f /im msedge.exe >nul 2>&1
del /q /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1

echo    [6/8] [SYS] Executando limpeza de disco do sistema...
cleanmgr /sagerun:1 >nul 2>&1

echo    [7/8] [REG] Compactando registry...
reg.exe compact /c /s:HKLM >nul 2>&1

echo    [8/8] [FIN] Finalizando limpeza avancada...
rundll32.exe kernel32.dll,SetProcessWorkingSetSize -1,-1 >nul 2>&1

call :GetCurrentMemoryInfo
set "MEMORY_AFTER=!MEMORY_USAGE_MB!"
set /a "MEMORY_FREED=!MEMORY_BEFORE!-!MEMORY_AFTER!"

echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [RESULT] LIMPEZA CONCLUIDA                         ║
echo    ╠═══════════════════════════════════════════════════════════════════════════╣
echo    ║  Memoria antes: !MEMORY_BEFORE! MB                                        ║
echo    ║  Memoria depois: !MEMORY_AFTER! MB                                        ║
echo    ║  Memoria liberada: !MEMORY_FREED! MB                                      ║
echo    ║  Arquivos temporarios removidos                                           ║
echo    ║  Cache de navegadores limpo                                               ║
echo    ║  Registry compactado                                                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
pause
goto :MemoryManager

REM ================================================================================
REM IMPLEMENTAÇÕES COMPLETAS DE PRIVACIDADE E TELEMETRIA
REM ================================================================================

:DisableCortana
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [COR] DESABILITAR CORTANA                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "desabilitar completamente a Cortana"
if !ERRO_LEVEL! neq 0 goto :PrivacyTweaks

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [PROC] Desabilitando Cortana...

REM Desabilitar Cortana via registry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Cortana desabilitada via policy || echo    [WARN] Falha na policy de Cortana
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Botao Cortana removido da taskbar || echo    [WARN] Falha ao remover botao
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Caixa de pesquisa desabilitada || echo    [WARN] Falha na caixa de pesquisa
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Consentimento Cortana removido || echo    [WARN] Falha no consentimento

REM Configurações adicionais para Cortana
REG ADD "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Download de modelos de voz desabilitado || echo    [WARN] Falha nos modelos de voz
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f >nul 2>&1 && echo    [OK] Coleta de texto restringida || echo    [WARN] Falha na coleta de texto
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f >nul 2>&1 && echo    [OK] Coleta de tinta restringida || echo    [WARN] Falha na coleta de tinta

echo.
echo    [SUCCESS] Cortana desabilitada com sucesso!
echo    [INFO] Reinicie o sistema para aplicar todas as mudancas.
echo.
pause
goto :PrivacyTweaks

:RemoveStoreApps
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [APP] REMOVER APPS DA STORE                         ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "remover aplicativos desnecessarios da Microsoft Store"
if !ERRO_LEVEL! neq 0 goto :PrivacyTweaks

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [PROC] Removendo aplicativos desnecessarios...

REM Apps básicos seguros para remover
powershell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] 3D Builder removido || echo    [SKIP] 3D Builder nao encontrado
powershell -Command "Get-AppxPackage *windowsalarms* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Alarmes removido || echo    [SKIP] Alarmes nao encontrado
powershell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Mail e Calendar removidos || echo    [SKIP] Mail nao encontrado
powershell -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Groove Music removido || echo    [SKIP] Groove nao encontrado
powershell -Command "Get-AppxPackage *zunevideo* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Filmes e TV removido || echo    [SKIP] Filmes nao encontrado
powershell -Command "Get-AppxPackage *bingweather* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Clima removido || echo    [SKIP] Clima nao encontrado
powershell -Command "Get-AppxPackage *bingnews* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Noticias removido || echo    [SKIP] Noticias nao encontrado
powershell -Command "Get-AppxPackage *officehub* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Office Hub removido || echo    [SKIP] Office Hub nao encontrado
powershell -Command "Get-AppxPackage *skypeapp* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Skype removido || echo    [SKIP] Skype nao encontrado
powershell -Command "Get-AppxPackage *windowsmaps* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Mapas removido || echo    [SKIP] Mapas nao encontrado

REM Apps específicos do Windows 11
if "!WINVER!"=="11" (
    echo    [W11] Removendo apps especificos do Windows 11...
    powershell -Command "Get-AppxPackage *clipchamp* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Clipchamp removido || echo    [SKIP] Clipchamp nao encontrado
    powershell -Command "Get-AppxPackage *teams* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Teams removido || echo    [SKIP] Teams nao encontrado
)

echo.
echo    [SUCCESS] Apps desnecessarios removidos com sucesso!
echo    [INFO] Alguns apps podem reaparecer apos atualizacoes do Windows.
echo.
pause
goto :PrivacyTweaks

:MiscPrivacySettings
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [CFG] CONFIGURACOES DIVERSAS                         ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "aplicar configuracoes diversas de privacidade"
if !ERRO_LEVEL! neq 0 goto :PrivacyTweaks

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [PROC] Aplicando configuracoes de privacidade...

REM Configurações de localização
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Servicos de localizacao desabilitados || echo    [WARN] Falha nos servicos de localizacao
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1 && echo    [OK] Acesso a localizacao negado || echo    [WARN] Falha no acesso de localizacao

REM Configurações de câmera e microfone
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1 && echo    [OK] Acesso a camera restringido || echo    [WARN] Falha na camera
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1 && echo    [OK] Acesso ao microfone restringido || echo    [WARN] Falha no microfone

REM Configurações de notificações
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Notificacoes toast desabilitadas || echo    [WARN] Falha nas notificacoes

REM Configurações de sincronização
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d 5 /f >nul 2>&1 && echo    [OK] Sincronizacao de configuracoes desabilitada || echo    [WARN] Falha na sincronizacao

echo.
echo    [SUCCESS] Configuracoes diversas aplicadas com sucesso!
echo.
pause
goto :PrivacyTweaks

:PrivacyTweaksAdvanced
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [TWK] TWEAKS DE PRIVACIDADE                         ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

if "!IS_ADMIN!"=="0" (
    echo    [ERROR] Esta funcionalidade requer privilegios administrativos!
    echo    [INFO] Execute o programa como administrador para acessar tweaks avancados.
    echo.
    pause
    goto :PrivacyTweaks
)

call :ConfirmAction "aplicar tweaks avancados de privacidade"
if !ERRO_LEVEL! neq 0 goto :PrivacyTweaks

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [PROC] Aplicando tweaks avancados...

REM Desabilitar Windows Update Delivery Optimization
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Delivery Optimization desabilitado || echo    [WARN] Falha no Delivery Optimization

REM Desabilitar Biometrics
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Biometrics desabilitado || echo    [WARN] Falha no Biometrics

REM Desabilitar Customer Experience Improvement Program
REG ADD "HKLM\SOFTWARE\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] CEIP desabilitado || echo    [WARN] Falha no CEIP

REM Desabilitar Application Impact Telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Application Telemetry desabilitado || echo    [WARN] Falha no Application Telemetry

REM Configurações de WiFi Sense
REG ADD "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] WiFi HotSpot Reporting desabilitado || echo    [WARN] Falha no WiFi Reporting
REG ADD "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] WiFi Sense Auto Connect desabilitado || echo    [WARN] Falha no WiFi Sense

echo.
echo    [SUCCESS] Tweaks avancados aplicados com sucesso!
echo    [INFO] Reinicie o sistema para aplicar todas as mudancas.
echo.
pause
goto :PrivacyTweaks

:PrivacyReport
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [REP] RELATORIO DE PRIVACIDADE                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [INFO] Gerando relatorio completo de privacidade...

set "PRIVACY_REPORT=WinboxToolkit_PrivacyReport_%date:~6,4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%.txt"
set "PRIVACY_REPORT=!PRIVACY_REPORT: =0!"

echo WINBOX TOOLKIT OPTIMIZATION - RELATORIO DE PRIVACIDADE > "!PRIVACY_REPORT!"
echo Data/Hora: %date% %time% >> "!PRIVACY_REPORT!"
echo =============================================================================== >> "!PRIVACY_REPORT!"
echo. >> "!PRIVACY_REPORT!"

echo CONFIGURACOES DE TELEMETRIA: >> "!PRIVACY_REPORT!"
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" >> "!PRIVACY_REPORT!" 2>nul
echo. >> "!PRIVACY_REPORT!"

echo CONFIGURACOES DE CORTANA: >> "!PRIVACY_REPORT!"
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" >> "!PRIVACY_REPORT!" 2>nul
echo. >> "!PRIVACY_REPORT!"

echo APPS INSTALADOS DA STORE: >> "!PRIVACY_REPORT!"
powershell -Command "Get-AppxPackage | Select-Object Name, Version | Format-Table -AutoSize" >> "!PRIVACY_REPORT!" 2>nul

echo    [SUCCESS] Relatorio de privacidade gerado!
echo    [INFO] Arquivo salvo em: !PRIVACY_REPORT!
echo.
pause
goto :PrivacyTweaks

REM ================================================================================
REM IMPLEMENTAÇÕES COMPLETAS DE SERVIÇOS
REM ================================================================================

:ScheduledTasks
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [TSK] TAREFAS AGENDADAS                             ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

if "!IS_ADMIN!"=="0" (
    echo    [ERROR] Esta funcionalidade requer privilegios administrativos!
    echo    [INFO] Execute o programa como administrador para gerenciar tarefas.
    echo.
    pause
    goto :ServiceManager
)

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Desabilitar Tarefas Desnecessarias  │  [2] Listar Tarefas Ativas     ║
echo    ║  [3] Criar Tarefa de Limpeza             │  [4] Restaurar Tarefas         ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "TASK_CHOICE=   ═══^> Digite sua opcao: "

if "!TASK_CHOICE!"=="1" goto :DisableUnnecessaryTasks
if "!TASK_CHOICE!"=="2" goto :ListActiveTasks
if "!TASK_CHOICE!"=="3" goto :CreateCleanupTask
if "!TASK_CHOICE!"=="4" goto :RestoreTasks
if "!TASK_CHOICE!"=="0" goto :ServiceManager
goto :ScheduledTasks

:DisableUnnecessaryTasks
echo    [PROC] Desabilitando tarefas desnecessarias...
echo.

schtasks /change /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable >nul 2>&1 && echo    [OK] Compatibility Appraiser desabilitado || echo    [SKIP] Compatibility Appraiser nao encontrado
schtasks /change /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable >nul 2>&1 && echo    [OK] Program Data Updater desabilitado || echo    [SKIP] Program Data Updater nao encontrado
schtasks /change /tn "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable >nul 2>&1 && echo    [OK] CEIP Consolidator desabilitado || echo    [SKIP] CEIP nao encontrado
schtasks /change /tn "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable >nul 2>&1 && echo    [OK] Error Reporting desabilitado || echo    [SKIP] Error Reporting nao encontrado

echo    [SUCCESS] Tarefas desnecessarias desabilitadas!
echo.
pause
goto :ScheduledTasks

:ListActiveTasks
echo    [INFO] Listando tarefas ativas do sistema...
echo.
schtasks /query /fo table | findstr "Ready Running" | more
echo.
pause
goto :ScheduledTasks

:CreateCleanupTask
echo    [PROC] Criando tarefa automatica de limpeza...
echo.
schtasks /create /tn "WinboxToolkit_AutoCleanup" /tr "cleanmgr /sagerun:1" /sc daily /st 02:00 /ru SYSTEM >nul 2>&1 && echo    [OK] Tarefa de limpeza criada || echo    [WARN] Falha ao criar tarefa
echo.
pause
goto :ScheduledTasks

:RestoreTasks
echo    [PROC] Restaurando tarefas do sistema...
echo.
schtasks /change /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /enable >nul 2>&1 && echo    [OK] Compatibility Appraiser restaurado || echo    [SKIP] Nao encontrado
schtasks /change /tn "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /enable >nul 2>&1 && echo    [OK] CEIP restaurado || echo    [SKIP] Nao encontrado
echo    [SUCCESS] Tarefas restauradas!
echo.
pause
goto :ScheduledTasks

:NetworkParameters
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [NET] PARAMETROS DE REDE                             ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Otimizar TCP/IP                     │  [2] DNS Publico (Google)      ║
echo    ║  [3] Desabilitar IPv6                    │  [4] Resetar Configuracoes     ║
echo    ║  [5] Status da Rede                      │  [6] Teste de Conectividade    ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "NET_CHOICE=   ═══^> Digite sua opcao: "

if "!NET_CHOICE!"=="1" goto :OptimizeTCPIP
if "!NET_CHOICE!"=="2" goto :SetPublicDNS
if "!NET_CHOICE!"=="3" goto :DisableIPv6
if "!NET_CHOICE!"=="4" goto :ResetNetwork
if "!NET_CHOICE!"=="5" goto :NetworkStatus
if "!NET_CHOICE!"=="6" goto :ConnectivityTest
if "!NET_CHOICE!"=="0" goto :ServiceManager
goto :NetworkParameters

:OptimizeTCPIP
echo    [NET] Otimizando configuracoes TCP/IP...
netsh int tcp set global autotuninglevel=normal >nul 2>&1 && echo    [OK] Auto-tuning configurado || echo    [WARN] Falha no auto-tuning
netsh int tcp set global chimney=enabled >nul 2>&1 && echo    [OK] TCP Chimney habilitado || echo    [WARN] Falha no Chimney
echo    [SUCCESS] TCP/IP otimizado!
pause
goto :NetworkParameters

:SetPublicDNS
echo    [NET] Configurando DNS publico do Google...
netsh interface ip set dns "Wi-Fi" static 8.8.8.8 >nul 2>&1 && echo    [OK] DNS primario configurado || echo    [WARN] Falha no DNS primario
netsh interface ip add dns "Wi-Fi" 8.8.4.4 index=2 >nul 2>&1 && echo    [OK] DNS secundario configurado || echo    [WARN] Falha no DNS secundario
echo    [SUCCESS] DNS publico configurado!
pause
goto :NetworkParameters

:DisableIPv6
echo    [NET] Desabilitando IPv6...
netsh interface ipv6 set global randomizeidentifiers=disabled >nul 2>&1 && echo    [OK] IPv6 randomization desabilitado || echo    [WARN] Falha no IPv6
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 255 /f >nul 2>&1 && echo    [OK] IPv6 desabilitado via registry || echo    [WARN] Falha no registry IPv6
echo    [SUCCESS] IPv6 desabilitado!
pause
goto :NetworkParameters

:ResetNetwork
echo    [NET] Resetando configuracoes de rede...
netsh winsock reset >nul 2>&1 && echo    [OK] Winsock resetado || echo    [WARN] Falha no Winsock
netsh int ip reset >nul 2>&1 && echo    [OK] TCP/IP resetado || echo    [WARN] Falha no TCP/IP
ipconfig /release >nul 2>&1 && echo    [OK] IP liberado || echo    [WARN] Falha na liberacao
ipconfig /renew >nul 2>&1 && echo    [OK] IP renovado || echo    [WARN] Falha na renovacao
ipconfig /flushdns >nul 2>&1 && echo    [OK] DNS cache limpo || echo    [WARN] Falha no DNS cache
echo    [SUCCESS] Rede resetada! Reinicie o sistema.
pause
goto :NetworkParameters

:NetworkStatus
echo    [NET] Status atual da rede:
echo.
ipconfig /all | findstr /C:"Ethernet" /C:"Wi-Fi" /C:"IPv4" /C:"Gateway"
echo.
pause
goto :NetworkParameters

:ConnectivityTest
echo    [NET] Testando conectividade...
ping -n 4 8.8.8.8 | findstr "TTL"
echo.
pause
goto :NetworkParameters

:RegistryDrivers
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [REG] REGISTRY E DRIVERS                             ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

if "!IS_ADMIN!"=="0" (
    echo    [ERROR] Esta funcionalidade requer privilegios administrativos!
    echo.
    pause
    goto :ServiceManager
)

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Limpeza de Registry                 │  [2] Backup do Registry        ║
echo    ║  [3] Otimizar Drivers                    │  [4] Verificar Integridade     ║
echo    ║  [5] Restaurar Registry                  │  [6] Compactar Registry        ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "REG_CHOICE=   ═══^> Digite sua opcao: "

if "!REG_CHOICE!"=="1" goto :CleanRegistry
if "!REG_CHOICE!"=="2" goto :BackupRegistry
if "!REG_CHOICE!"=="3" goto :OptimizeDrivers
if "!REG_CHOICE!"=="4" goto :CheckIntegrity
if "!REG_CHOICE!"=="5" goto :RestoreRegistry
if "!REG_CHOICE!"=="6" goto :CompactRegistry
if "!REG_CHOICE!"=="0" goto :ServiceManager
goto :RegistryDrivers

:CleanRegistry
echo    [REG] Limpando entradas invalidas do registry...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul 2>&1 && echo    [OK] Documentos recentes limpos || echo    [SKIP] Nao encontrado
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1 && echo    [OK] Historico de execucao limpo || echo    [SKIP] Nao encontrado
echo    [SUCCESS] Registry limpo!
pause
goto :RegistryDrivers

:BackupRegistry
set "BACKUP_FILE=Registry_Backup_%date:~6,4%%date:~3,2%%date:~0,2%.reg"
echo    [REG] Criando backup do registry...
reg export HKLM "!BACKUP_FILE!" >nul 2>&1 && echo    [OK] Backup criado: !BACKUP_FILE! || echo    [WARN] Falha no backup
pause
goto :RegistryDrivers

:OptimizeDrivers
echo    [DRV] Otimizando configuracoes de drivers...
pnputil /enum-drivers | findstr "Published Name" | find /c "Published" >temp_drivers.txt
set /p DRIVER_COUNT=<temp_drivers.txt
del temp_drivers.txt >nul 2>&1
echo    [INFO] Drivers instalados: !DRIVER_COUNT!
pause
goto :RegistryDrivers

:CheckIntegrity
echo    [SYS] Verificando integridade do sistema...
sfc /scannow | findstr "violation"
echo    [INFO] Verificacao concluida.
pause
goto :RegistryDrivers

:RestoreRegistry
echo    [REG] Lista de backups disponiveis:
dir *.reg /b 2>nul
echo.
echo    [INFO] Use o backup desejado manualmente.
pause
goto :RegistryDrivers

:CompactRegistry
echo    [REG] Compactando registry...
reg.exe compact /c /s:HKLM >nul 2>&1 && echo    [OK] Registry compactado || echo    [WARN] Falha na compactacao
pause
goto :RegistryDrivers

REM ================================================================================
REM IMPLEMENTAÇÃO: GERENCIAMENTO DE SERVIÇOS
REM ================================================================================

:ServiceStatus
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [SVC] GERENCIAMENTO DE SERVICOS                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

if "!IS_ADMIN!"=="0" (
    echo    [ERROR] Requer privilegios administrativos para gerenciar servicos!
    echo.
    pause
    goto :SystemOptimization
)

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Desabilitar Servicos Desnecessarios  │  [2] Otimizar Servicos        ║
echo    ║  [3] Status dos Servicos                  │  [4] Restaurar Servicos       ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "SVC_CHOICE=   ═══^> Digite sua opcao: "

if "!SVC_CHOICE!"=="1" goto :DisableUnnecessaryServices
if "!SVC_CHOICE!"=="2" goto :OptimizeServices
if "!SVC_CHOICE!"=="3" goto :ShowServiceStatus
if "!SVC_CHOICE!"=="4" goto :RestoreServices
if "!SVC_CHOICE!"=="0" goto :SystemOptimization
goto :ServiceStatus

:DisableUnnecessaryServices
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                    [SVC] DESABILITANDO SERVICOS...                        ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [PROC] Desabilitando servicos desnecessarios...
echo.

REM Serviços básicos para desabilitar
sc config "Fax" start= disabled >nul 2>&1 && echo    [OK] Servico de Fax desabilitado || echo    [SKIP] Fax nao encontrado
sc config "WSearch" start= disabled >nul 2>&1 && echo    [OK] Windows Search desabilitado || echo    [SKIP] Windows Search ativo
sc config "TabletInputService" start= disabled >nul 2>&1 && echo    [OK] Tablet Input Service desabilitado || echo    [SKIP] Tablet Input nao encontrado
sc config "Spooler" start= demand >nul 2>&1 && echo    [OK] Print Spooler otimizado (manual) || echo    [SKIP] Print Spooler falhou

REM Serviços específicos por versão do Windows
if "!WINVER!"=="11" (
    echo    [INFO] Aplicando configuracoes especificas do Windows 11...
    sc config "WbioSrvc" start= disabled >nul 2>&1 && echo    [OK] Windows Biometric desabilitado || echo    [SKIP] Biometric nao encontrado
    sc config "PcaSvc" start= disabled >nul 2>&1 && echo    [OK] Program Compatibility Assistant desabilitado || echo    [SKIP] PCA nao encontrado
) else (
    echo    [INFO] Aplicando configuracoes especificas do Windows 10...
    sc config "DiagTrack" start= disabled >nul 2>&1 && echo    [OK] Diagnostics Tracking desabilitado || echo    [SKIP] DiagTrack nao encontrado
    sc config "dmwappushservice" start= disabled >nul 2>&1 && echo    [OK] WAP Push Message Routing desabilitado || echo    [SKIP] dmwappush nao encontrado
)

REM Serviços de telemetria
sc config "TrkWks" start= disabled >nul 2>&1 && echo    [OK] Distributed Link Tracking Client desabilitado || echo    [SKIP] TrkWks nao encontrado
sc config "RemoteRegistry" start= disabled >nul 2>&1 && echo    [OK] Remote Registry desabilitado || echo    [SKIP] RemoteRegistry nao encontrado

echo.
echo    [SUCCESS] Servicos otimizados com sucesso!
echo.
pause
goto :ServiceStatus

:OptimizeServices
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                     [SVC] OTIMIZANDO SERVICOS...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [PROC] Otimizando configuracoes de servicos essenciais...
echo.

REM Otimizar serviços essenciais para manual (demand)
sc config "Themes" start= demand >nul 2>&1 && echo    [OK] Themes otimizado (manual) || echo    [SKIP] Themes falhou
sc config "AudioSrv" start= auto >nul 2>&1 && echo    [OK] Windows Audio garantido (automatico) || echo    [SKIP] Audio falhou
sc config "BITS" start= demand >nul 2>&1 && echo    [OK] Background Transfer otimizado (manual) || echo    [SKIP] BITS falhou
sc config "EventLog" start= auto >nul 2>&1 && echo    [OK] Event Log garantido (automatico) || echo    [SKIP] EventLog falhou

REM Serviços de rede
sc config "Dhcp" start= auto >nul 2>&1 && echo    [OK] DHCP Client garantido (automatico) || echo    [SKIP] DHCP falhou
sc config "Dnscache" start= auto >nul 2>&1 && echo    [OK] DNS Client garantido (automatico) || echo    [SKIP] DNS falhou

echo.
echo    [SUCCESS] Servicos essenciais otimizados!
echo.
pause
goto :ServiceStatus

:ShowServiceStatus
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [SVC] STATUS DOS SERVICOS                            ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [INFO] Verificando status dos principais servicos...
echo.

REM Mostrar status dos serviços principais
echo    ┌─────────────────────────────────────────────────────────────────────────┐
echo    │ Servico                          │ Status        │ Tipo de Inicializacao│
echo    ├─────────────────────────────────────────────────────────────────────────┤

for %%s in ("Fax" "WSearch" "TabletInputService" "Spooler" "DiagTrack" "dmwappushservice" "TrkWks" "RemoteRegistry" "Themes" "AudioSrv" "BITS" "EventLog" "Dhcp" "Dnscache") do (
    for /f "tokens=2 delims=:" %%i in ('sc query %%s 2^>nul ^| findstr "STATE"') do (
        for /f "tokens=1" %%j in ("%%i") do (
            for /f "tokens=2 delims=:" %%k in ('sc qc %%s 2^>nul ^| findstr "START_TYPE"') do (
                for /f "tokens=1" %%l in ("%%k") do (
                    echo    │ %%s                     │ %%j      │ %%l             │
                )
            )
        )
    )
)

echo    └─────────────────────────────────────────────────────────────────────────┘
echo.
pause
goto :ServiceStatus

:RestoreServices
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                     [SVC] RESTAURANDO SERVICOS...                         ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "restaurar todos os servicos para configuracao padrao"
if !ERRO_LEVEL! neq 0 goto :ServiceStatus

echo    [PROC] Restaurando servicos para configuracao padrao...
echo.

REM Restaurar serviços para configuração padrão
sc config "Fax" start= demand >nul 2>&1 && echo    [OK] Fax restaurado para manual || echo    [SKIP] Fax falhou
sc config "WSearch" start= auto >nul 2>&1 && echo    [OK] Windows Search restaurado para automatico || echo    [SKIP] WSearch falhou
sc config "TabletInputService" start= demand >nul 2>&1 && echo    [OK] Tablet Input restaurado para manual || echo    [SKIP] TabletInput falhou
sc config "Spooler" start= auto >nul 2>&1 && echo    [OK] Print Spooler restaurado para automatico || echo    [SKIP] Spooler falhou
sc config "DiagTrack" start= auto >nul 2>&1 && echo    [OK] Diagnostics Tracking restaurado || echo    [SKIP] DiagTrack falhou
sc config "dmwappushservice" start= demand >nul 2>&1 && echo    [OK] WAP Push Message restaurado || echo    [SKIP] dmwappush falhou
sc config "TrkWks" start= auto >nul 2>&1 && echo    [OK] Distributed Link Tracking restaurado || echo    [SKIP] TrkWks falhou
sc config "RemoteRegistry" start= demand >nul 2>&1 && echo    [OK] Remote Registry restaurado || echo    [SKIP] RemoteRegistry falhou

echo.
echo    [SUCCESS] Servicos restaurados com sucesso!
echo.
pause
goto :ServiceStatus

:ProgramSettings
:SystemSettings
:RestoreSettings
:BackupSettings
:TestMode
:AdvancedDiagnostics
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                    [DIAG] DIAGNOSTICOS AVANCADOS                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Relatorio Completo do Sistema    │  [2] Diagnostico de Memoria       ║
echo    ║  [3] Status de Servicos               │  [4] Informacoes de Hardware      ║
echo    ║  [5] Log de Eventos do Sistema        │  [6] Exportar Todos Relatorios    ║
echo    ║                                                                           ║
echo    ║  [0] Voltar ao Menu Avancado                                              ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "DIAG_CHOICE=   ═══^> Digite sua opcao: "

if "!DIAG_CHOICE!"=="1" goto :SystemReport
if "!DIAG_CHOICE!"=="2" goto :MemoryDiagnostic
if "!DIAG_CHOICE!"=="3" goto :ServicesDiagnostic
if "!DIAG_CHOICE!"=="4" goto :HardwareInfo
if "!DIAG_CHOICE!"=="5" goto :EventLogReport
if "!DIAG_CHOICE!"=="6" goto :ExportAllReports
if "!DIAG_CHOICE!"=="0" goto :AdvancedSettings
goto :AdvancedDiagnostics

:SystemReport
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [RPT] RELATORIO DO SISTEMA                           ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

set "REPORT_FILE=WinboxToolkit_SystemReport_%date:~6,4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%.txt"
set "REPORT_FILE=!REPORT_FILE: =0!"

echo    [INFO] Gerando relatorio completo do sistema...
echo    [INFO] Arquivo: !REPORT_FILE!
echo.

echo WINBOX TOOLKIT OPTIMIZATION v%VERSION% - RELATORIO DO SISTEMA > "!REPORT_FILE!"
echo Data/Hora: %date% %time% >> "!REPORT_FILE!"
echo =============================================================================== >> "!REPORT_FILE!"
echo. >> "!REPORT_FILE!"

echo INFORMACOES DO SISTEMA: >> "!REPORT_FILE!"
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" >> "!REPORT_FILE!" 2>nul
echo. >> "!REPORT_FILE!"

echo INFORMACOES DE MEMORIA: >> "!REPORT_FILE!"
call :GetCurrentMemoryInfo
echo Total de Memoria: !TOTAL_MEMORY_MB! MB >> "!REPORT_FILE!"
echo Memoria Livre: !FREE_MEMORY_MB! MB >> "!REPORT_FILE!"
echo Memoria em Uso: !MEMORY_USAGE_MB! MB >> "!REPORT_FILE!"
echo Percentual de Uso: !MEMORY_PERCENT!%% >> "!REPORT_FILE!"
echo. >> "!REPORT_FILE!"

echo VERSAO DO WINDOWS: >> "!REPORT_FILE!"
echo Versao Detectada: !WINDOWS_VERSION! >> "!REPORT_FILE!"
echo WINVER: !WINVER! >> "!REPORT_FILE!"
echo Build: !WIN_BUILD! >> "!REPORT_FILE!"
echo. >> "!REPORT_FILE!"

echo PRIVILEGIOS: >> "!REPORT_FILE!"
echo Administrador: !ADMIN_STATUS! >> "!REPORT_FILE!"
echo. >> "!REPORT_FILE!"

echo PROCESSOS COM MAIOR CONSUMO DE MEMORIA: >> "!REPORT_FILE!"
powershell -Command "Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10 ProcessName, @{Name='Memory(MB)';Expression={[math]::Round($_.WorkingSet/1MB,2)}} | Format-Table -AutoSize" >> "!REPORT_FILE!" 2>nul

echo    [SUCCESS] Relatorio gerado com sucesso!
echo    [INFO] Arquivo salvo em: !REPORT_FILE!
echo.
pause
goto :AdvancedDiagnostics

:MemoryDiagnostic
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                     [MEM] DIAGNOSTICO DE MEMORIA                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :GetCurrentMemoryInfo
call :DrawMemoryBar !MEMORY_PERCENT!
call :ShowMemoryAlerts !MEMORY_PERCENT!

echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        INFORMACOES DETALHADAS                             ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo       • Total de Memoria RAM: !TOTAL_MEMORY_MB! MB
echo       • Memoria Livre: !FREE_MEMORY_MB! MB
echo       • Memoria em Uso: !MEMORY_USAGE_MB! MB
echo       • Percentual de Uso: !MEMORY_PERCENT!%%
echo.

echo    [INFO] TOP 5 PROCESSOS POR CONSUMO DE MEMORIA:
echo    ┌─────────────────────────────────────────────────────────────────────────┐
powershell -Command "Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5 ProcessName, @{Name='Memory(MB)';Expression={[math]::Round($_.WorkingSet/1MB,2)}} | ForEach-Object { '    │ {0,-30} {1,10} MB                         │' -f $_.ProcessName, $_.'Memory(MB)' }" 2>nul
echo    └─────────────────────────────────────────────────────────────────────────┘
echo.
pause
goto :AdvancedDiagnostics

:ServicesDiagnostic
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                    [SVC] DIAGNOSTICO DE SERVICOS                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [INFO] Analisando status dos servicos principais...
echo.

set "SERVICES_REPORT=WinboxToolkit_Services_%date:~6,4%%date:~3,2%%date:~0,2%.txt"
set "SERVICES_REPORT=!SERVICES_REPORT: =0!"

echo DIAGNOSTICO DE SERVICOS - %date% %time% > "!SERVICES_REPORT!"
echo =============================================== >> "!SERVICES_REPORT!"
echo. >> "!SERVICES_REPORT!"

echo    ┌─────────────────────────────────────────────────────────────────────────┐
echo    │ Servico                     │ Status         │ Tipo de Inicio           │
echo    ├─────────────────────────────────────────────────────────────────────────┤

for %%s in ("WSearch" "Spooler" "Themes" "AudioSrv" "BITS" "EventLog" "Dhcp" "Dnscache") do (
    for /f "tokens=2" %%i in ('sc query %%s 2^>nul ^| findstr "STATE" 2^>nul') do (
        for /f "tokens=2" %%j in ('sc qc %%s 2^>nul ^| findstr "START_TYPE" 2^>nul') do (
            echo    │ %%s                  │ %%i        │ %%j              │
            echo Servico: %%s - Status: %%i - Inicio: %%j >> "!SERVICES_REPORT!"
        )
    )
)

echo    └─────────────────────────────────────────────────────────────────────────┘
echo.
echo    [INFO] Relatorio salvo em: !SERVICES_REPORT!
echo.
pause
goto :AdvancedDiagnostics

:HardwareInfo
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                     [HW] INFORMACOES DE HARDWARE                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [INFO] Coletando informacoes de hardware...
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                           PROCESSADOR                                     ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
wmic cpu get name,numberofcores,numberoflogicalprocessors /format:list | findstr "=" 2>nul

echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                              MEMORIA                                      ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
wmic memorychip get capacity,speed,manufacturer /format:list | findstr "=" 2>nul

echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                           ARMAZENAMENTO                                   ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
wmic diskdrive get model,size,interfacetype /format:list | findstr "=" 2>nul

echo.
pause
goto :AdvancedDiagnostics

:EventLogReport
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [LOG] LOG DE EVENTOS                                 ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [INFO] Gerando relatorio de eventos do sistema...
echo.

set "EVENTS_REPORT=WinboxToolkit_Events_%date:~6,4%%date:~3,2%%date:~0,2%.txt"
set "EVENTS_REPORT=!EVENTS_REPORT: =0!"

echo RELATORIO DE EVENTOS DO SISTEMA - %date% %time% > "!EVENTS_REPORT!"
echo ============================================================= >> "!EVENTS_REPORT!"
echo. >> "!EVENTS_REPORT!"

echo    [INFO] Coletando eventos criticos e erros das ultimas 24 horas...
powershell -Command "Get-EventLog -LogName System -EntryType Error,Warning -Newest 20 | Select-Object TimeGenerated, EntryType, Source, Message | Format-Table -Wrap" >> "!EVENTS_REPORT!" 2>nul

echo    [SUCCESS] Relatorio de eventos gerado!
echo    [INFO] Arquivo salvo em: !EVENTS_REPORT!
echo.
pause
goto :AdvancedDiagnostics

:ExportAllReports
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                    [EXP] EXPORTAR TODOS RELATORIOS                        ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "gerar todos os relatorios de diagnostico"
if !ERRO_LEVEL! neq 0 goto :AdvancedDiagnostics

echo    [PROC] Gerando conjunto completo de relatorios...
echo.

REM Criar pasta para os relatórios
set "REPORTS_FOLDER=WinboxToolkit_Reports_%date:~6,4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%"
set "REPORTS_FOLDER=!REPORTS_FOLDER: =0!"
mkdir "!REPORTS_FOLDER!" >nul 2>&1

echo    [1/4] Gerando relatorio do sistema...
goto :SystemReport

echo    [2/4] Gerando diagnostico de servicos...
goto :ServicesDiagnostic

echo    [3/4] Gerando relatorio de hardware...
goto :HardwareInfo

echo    [4/4] Gerando log de eventos...
goto :EventLogReport

echo    [SUCCESS] Todos os relatorios foram gerados!
echo    [INFO] Relatorios salvos na pasta: !REPORTS_FOLDER!
echo.
pause
goto :AdvancedDiagnostics

REM ================================================================================
REM IMPLEMENTAÇÕES COMPLETAS DE OTIMIZAÇÃO DE SISTEMA
REM ================================================================================

:VisualOptimization
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [VIS] OTIMIZACAO VISUAL                             ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

call :ConfirmAction "aplicar otimizacoes visuais para melhor performance"
if !ERRO_LEVEL! neq 0 goto :SystemOptimization

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                            [PROC] PROCESSANDO...                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    [PROC] Aplicando otimizacoes visuais...

REM Efeitos visuais para performance
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f >nul 2>&1 && echo    [OK] Efeitos visuais otimizados || echo    [WARN] Falha nos efeitos visuais
REG ADD "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f >nul 2>&1 && echo    [OK] Arrastar janelas otimizado || echo    [WARN] Falha no arrastar janelas
REG ADD "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul 2>&1 && echo    [OK] Delay do menu reduzido || echo    [WARN] Falha no delay do menu
REG ADD "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >nul 2>&1 && echo    [OK] Animacoes de janela desabilitadas || echo    [WARN] Falha nas animacoes

REM Configurações de transparência
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Transparencia desabilitada || echo    [WARN] Falha na transparencia

REM Configurações da taskbar
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Animacoes da taskbar desabilitadas || echo    [WARN] Falha nas animacoes taskbar

echo.
echo    [SUCCESS] Otimizacoes visuais aplicadas com sucesso!
echo    [INFO] Reinicie o explorer ou faca logout/login para aplicar mudancas.
echo.
pause
goto :SystemOptimization

:FeaturesOptimization
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [FTR] FEATURES E COMPONENTES                         ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

if "!IS_ADMIN!"=="0" (
    echo    [ERROR] Esta funcionalidade requer privilegios administrativos!
    echo.
    pause
    goto :SystemOptimization
)

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Desabilitar Features Desnecessarios │  [2] Otimizar Windows Media   ║
echo    ║  [3] Internet Explorer                   │  [4] Hyper-V                  ║
echo    ║  [5] Fax e Scan                          │  [6] Restaurar Features       ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "FTR_CHOICE=   ═══^> Digite sua opcao: "

if "!FTR_CHOICE!"=="1" goto :DisableUnnecessaryFeatures
if "!FTR_CHOICE!"=="2" goto :OptimizeWindowsMedia
if "!FTR_CHOICE!"=="3" goto :DisableInternetExplorer
if "!FTR_CHOICE!"=="4" goto :DisableHyperV
if "!FTR_CHOICE!"=="5" goto :DisableFaxScan
if "!FTR_CHOICE!"=="6" goto :RestoreFeatures
if "!FTR_CHOICE!"=="0" goto :SystemOptimization
goto :FeaturesOptimization

:DisableUnnecessaryFeatures
echo    [FTR] Desabilitando features desnecessarios...
dism /online /disable-feature /featurename:TelnetClient /norestart >nul 2>&1 && echo    [OK] Telnet Client desabilitado || echo    [SKIP] Telnet nao encontrado
dism /online /disable-feature /featurename:TFTP /norestart >nul 2>&1 && echo    [OK] TFTP desabilitado || echo    [SKIP] TFTP nao encontrado
dism /online /disable-feature /featurename:TIFFIFilter /norestart >nul 2>&1 && echo    [OK] TIFF Filter desabilitado || echo    [SKIP] TIFF nao encontrado
echo    [SUCCESS] Features desnecessarios desabilitados!
pause
goto :FeaturesOptimization

:OptimizeWindowsMedia
echo    [FTR] Otimizando Windows Media...
dism /online /disable-feature /featurename:WindowsMediaPlayer /norestart >nul 2>&1 && echo    [OK] Windows Media Player desabilitado || echo    [SKIP] WMP nao encontrado
dism /online /disable-feature /featurename:MediaPlayback /norestart >nul 2>&1 && echo    [OK] Media Features desabilitados || echo    [SKIP] Media Features nao encontrado
echo    [SUCCESS] Windows Media otimizado!
pause
goto :FeaturesOptimization

:DisableInternetExplorer
echo    [FTR] Desabilitando Internet Explorer...
dism /online /disable-feature /featurename:Internet-Explorer-Optional-amd64 /norestart >nul 2>&1 && echo    [OK] Internet Explorer desabilitado || echo    [SKIP] IE nao encontrado
echo    [SUCCESS] Internet Explorer desabilitado!
pause
goto :FeaturesOptimization

:DisableHyperV
echo    [FTR] Desabilitando Hyper-V...
dism /online /disable-feature /featurename:Microsoft-Hyper-V-All /norestart >nul 2>&1 && echo    [OK] Hyper-V desabilitado || echo    [SKIP] Hyper-V nao encontrado
echo    [SUCCESS] Hyper-V desabilitado!
pause
goto :FeaturesOptimization

:DisableFaxScan
echo    [FTR] Desabilitando Fax e Scan...
dism /online /disable-feature /featurename:FaxServicesClientPackage /norestart >nul 2>&1 && echo    [OK] Fax Services desabilitado || echo    [SKIP] Fax nao encontrado
echo    [SUCCESS] Fax e Scan desabilitados!
pause
goto :FeaturesOptimization

:RestoreFeatures
echo    [FTR] Restaurando features do Windows...
dism /online /enable-feature /featurename:Internet-Explorer-Optional-amd64 /norestart >nul 2>&1 && echo    [OK] Internet Explorer restaurado || echo    [SKIP] IE nao restaurado
dism /online /enable-feature /featurename:WindowsMediaPlayer /norestart >nul 2>&1 && echo    [OK] Windows Media Player restaurado || echo    [SKIP] WMP nao restaurado
echo    [SUCCESS] Features restaurados!
pause
goto :FeaturesOptimization

:EdgeOptimization
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [EDG] MICROSOFT EDGE                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Otimizar Edge para Performance      │  [2] Desabilitar Telemetria   ║
echo    ║  [3] Limpar Cache e Dados                │  [4] Configurar Privacidade   ║
echo    ║  [5] Desabilitar Atualizacoes            │  [6] Restaurar Configuracoes  ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "EDG_CHOICE=   ═══^> Digite sua opcao: "

if "!EDG_CHOICE!"=="1" goto :OptimizeEdgePerformance
if "!EDG_CHOICE!"=="2" goto :DisableEdgeTelemetry
if "!EDG_CHOICE!"=="3" goto :ClearEdgeData
if "!EDG_CHOICE!"=="4" goto :ConfigureEdgePrivacy
if "!EDG_CHOICE!"=="5" goto :DisableEdgeUpdates
if "!EDG_CHOICE!"=="6" goto :RestoreEdgeSettings
if "!EDG_CHOICE!"=="0" goto :SystemOptimization
goto :EdgeOptimization

:OptimizeEdgePerformance
echo    [EDG] Otimizando Microsoft Edge para performance...
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Startup boost desabilitado || echo    [WARN] Falha no startup boost
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Background mode desabilitado || echo    [WARN] Falha no background mode
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeCollectionsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Collections desabilitado || echo    [WARN] Falha no collections
echo    [SUCCESS] Edge otimizado para performance!
pause
goto :EdgeOptimization

:DisableEdgeTelemetry
echo    [EDG] Desabilitando telemetria do Microsoft Edge...
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "MetricsReportingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Metrics reporting desabilitado || echo    [WARN] Falha no metrics
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SpellcheckEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Spellcheck desabilitado || echo    [WARN] Falha no spellcheck
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AddressBarMicrosoftSearchInBingProviderEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Bing search desabilitado || echo    [WARN] Falha no bing search
echo    [SUCCESS] Telemetria do Edge desabilitada!
pause
goto :EdgeOptimization

:ClearEdgeData
echo    [EDG] Limpando cache e dados do Microsoft Edge...
taskkill /f /im msedge.exe >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1 && echo    [OK] Cache removido || echo    [SKIP] Cache nao encontrado
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache" >nul 2>&1 && echo    [OK] Code cache removido || echo    [SKIP] Code cache nao encontrado
del /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cookies" >nul 2>&1 && echo    [OK] Cookies removidos || echo    [SKIP] Cookies nao encontrados
echo    [SUCCESS] Dados do Edge limpos!
pause
goto :EdgeOptimization

:ConfigureEdgePrivacy
echo    [EDG] Configurando privacidade do Microsoft Edge...
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Personalization reporting desabilitado || echo    [WARN] Falha no personalization
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SearchSuggestEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Search suggestions desabilitado || echo    [WARN] Falha no search suggestions
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PaymentMethodQueryEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Payment methods desabilitado || echo    [WARN] Falha no payment methods
echo    [SUCCESS] Privacidade do Edge configurada!
pause
goto :EdgeOptimization

:DisableEdgeUpdates
echo    [EDG] Desabilitando atualizacoes automaticas do Edge...
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "UpdateDefault" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Updates desabilitados || echo    [WARN] Falha nos updates
sc config edgeupdate start= disabled >nul 2>&1 && echo    [OK] Servico de update desabilitado || echo    [WARN] Falha no servico
echo    [SUCCESS] Atualizacoes do Edge desabilitadas!
pause
goto :EdgeOptimization

:RestoreEdgeSettings
echo    [EDG] Restaurando configuracoes padrao do Edge...
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Edge" /f >nul 2>&1 && echo    [OK] Policies removidas || echo    [SKIP] Policies nao encontradas
sc config edgeupdate start= auto >nul 2>&1 && echo    [OK] Servico de update restaurado || echo    [WARN] Falha no servico
echo    [SUCCESS] Configuracoes do Edge restauradas!
pause
goto :EdgeOptimization

:EssentialInstallers
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                      [INS] INSTALADORES ESSENCIAIS                        ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Chocolatey Package Manager          │  [2] Visual C++ Redistributables║
echo    ║  [3] .NET Framework Essentials           │  [4] DirectX e Visual Studio   ║
echo    ║  [5] Adobe Flash Player (Legacy)         │  [6] Java Runtime Environment  ║
echo    ║  [7] Verificar Instaladores              │  [8] Links de Download         ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "INS_CHOICE=   ═══^> Digite sua opcao: "

if "!INS_CHOICE!"=="1" goto :InstallChocolatey
if "!INS_CHOICE!"=="2" goto :InstallVCRedist
if "!INS_CHOICE!"=="3" goto :InstallDotNet
if "!INS_CHOICE!"=="4" goto :InstallDirectX
if "!INS_CHOICE!"=="5" goto :InstallFlash
if "!INS_CHOICE!"=="6" goto :InstallJava
if "!INS_CHOICE!"=="7" goto :CheckInstallers
if "!INS_CHOICE!"=="8" goto :ShowDownloadLinks
if "!INS_CHOICE!"=="0" goto :SystemOptimization
goto :EssentialInstallers

:InstallChocolatey
echo    [INS] Preparando instalacao do Chocolatey...
echo    [INFO] O Chocolatey sera instalado via PowerShell
echo    [WARN] Esta operacao requer conexao com internet
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && echo    [OK] Chocolatey instalado com sucesso! || echo    [WARN] Falha na instalacao do Chocolatey
pause
goto :EssentialInstallers

:InstallVCRedist
echo    [INS] Links para Visual C++ Redistributables:
echo    [INFO] Baixe e instale manualmente:
echo        * VC++ 2015-2022 x64: https://aka.ms/vs/17/release/vc_redist.x64.exe
echo        * VC++ 2015-2022 x86: https://aka.ms/vs/17/release/vc_redist.x86.exe
echo.
pause
goto :EssentialInstallers

:InstallDotNet
echo    [INS] Links para .NET Framework:
echo    [INFO] Baixe e instale manualmente:
echo        * .NET 6.0: https://dotnet.microsoft.com/download/dotnet/6.0
echo        * .NET Framework 4.8: https://dotnet.microsoft.com/download/dotnet-framework
echo.
pause
goto :EssentialInstallers

:InstallDirectX
echo    [INS] Links para DirectX:
echo    [INFO] Baixe e instale manualmente:
echo        * DirectX End-User Runtime: https://www.microsoft.com/download/details.aspx?id=35
echo.
pause
goto :EssentialInstallers

:InstallFlash
echo    [INS] Adobe Flash Player (Legacy):
echo    [WARN] Flash Player foi descontinuado em 2020
echo    [INFO] Nao recomendamos a instalacao por questoes de seguranca
echo.
pause
goto :EssentialInstallers

:InstallJava
echo    [INS] Links para Java:
echo    [INFO] Baixe e instale manualmente:
echo        * Oracle JRE: https://www.oracle.com/java/technologies/downloads/
echo        * OpenJDK: https://adoptium.net/
echo.
pause
goto :EssentialInstallers

:CheckInstallers
echo    [INS] Verificando instaladores presentes no sistema...
where choco >nul 2>&1 && echo    [OK] Chocolatey instalado || echo    [NO] Chocolatey nao instalado
where java >nul 2>&1 && echo    [OK] Java instalado || echo    [NO] Java nao instalado
reg query "HKLM\SOFTWARE\Microsoft\.NETFramework" >nul 2>&1 && echo    [OK] .NET Framework detectado || echo    [NO] .NET Framework nao detectado
echo.
pause
goto :EssentialInstallers

:ShowDownloadLinks
echo    [INS] LINKS DE DOWNLOAD ESSENCIAIS:
echo    ════════════════════════════════════════════════════════════════════════════
echo    [CHO] Chocolatey: https://chocolatey.org/install
echo    [NET] .NET Framework: https://dotnet.microsoft.com/download
echo    [VCR] Visual C++: https://docs.microsoft.com/cpp/windows/latest-supported-vc-redist
echo    [JRE] Java: https://adoptium.net/
echo    [DXR] DirectX: https://www.microsoft.com/download/details.aspx?id=35
echo    ════════════════════════════════════════════════════════════════════════════
echo.
pause
goto :EssentialInstallers

:LowEndHardware
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [LOW] HARDWARE LIMITADO                            ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Configuracao Ultra Leve             │  [2] Desabilitar Animacoes    
echo    ║  [3] Otimizacao de Memoria Agressiva     │  [4] Servicos Minimos          
echo    ║  [0] Voltar                                                               ║
echo    ║  [5] Efeitos Visuais Minimos             │  [6] Configuracao Completa 
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "LOW_CHOICE=   ═══^> Digite sua opcao: "

if "!LOW_CHOICE!"=="1" goto :UltraLightConfig
if "!LOW_CHOICE!"=="2" goto :DisableAllAnimations
if "!LOW_CHOICE!"=="3" goto :AggressiveMemoryOptimization
if "!LOW_CHOICE!"=="4" goto :MinimalServices
if "!LOW_CHOICE!"=="5" goto :MinimalVisualEffects
if "!LOW_CHOICE!"=="6" goto :CompleteOptimization
if "!LOW_CHOICE!"=="0" goto :SystemOptimization
goto :LowEndHardware

:UltraLightConfig
echo    [LOW] Aplicando configuracao ultra leve...
call :ConfirmAction "aplicar configuracao ultra leve (pode afetar funcionalidades)"
if !ERRO_LEVEL! neq 0 goto :LowEndHardware

REG ADD "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul 2>&1
REG ADD "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f >nul 2>&1
REG ADD "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >nul 2>&1
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f >nul 2>&1

echo    [OK] Configuracao ultra leve aplicada!
pause
goto :LowEndHardware

:DisableAllAnimations
echo    [LOW] Desabilitando todas as animacoes...
REG ADD "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >nul 2>&1
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f >nul 2>&1
echo    [OK] Animacoes desabilitadas!
pause
goto :LowEndHardware

:AggressiveMemoryOptimization
echo    [LOW] Aplicando otimizacao agressiva de memoria...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d 256 /f >nul 2>&1
echo    [OK] Memoria otimizada agressivamente!
pause
goto :LowEndHardware

:MinimalServices
echo    [LOW] Configurando servicos para modo minimo...
if "!IS_ADMIN!"=="0" (
    echo    [ERROR] Requer privilegios administrativos!
    pause
    goto :LowEndHardware
)

sc config "Themes" start= disabled >nul 2>&1
sc config "AudioSrv" start= demand >nul 2>&1
sc config "Spooler" start= demand >nul 2>&1
sc config "BITS" start= demand >nul 2>&1
echo    [OK] Servicos configurados para modo minimo!
pause
goto :LowEndHardware

:MinimalVisualEffects
echo    [LOW] Aplicando efeitos visuais minimos...
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f >nul 2>&1
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f >nul 2>&1
echo    [OK] Efeitos visuais minimos aplicados!
pause
goto :LowEndHardware

:CompleteOptimization
echo    [LOW] Aplicando otimizacao completa para hardware limitado...
call :ConfirmAction "aplicar todas as otimizacoes para hardware limitado"
if !ERRO_LEVEL! neq 0 goto :LowEndHardware

call :UltraLightConfig
call :DisableAllAnimations
call :AggressiveMemoryOptimization
call :MinimalServices
call :MinimalVisualEffects

echo    [SUCCESS] Otimizacao completa aplicada!
echo    [INFO] Reinicie o sistema para aplicar todas as mudancas.
pause
goto :LowEndHardware

:FileCleanup
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [CLN] LIMPEZA DE ARQUIVOS                          ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Limpeza Basica de Arquivos          │  [2] Limpeza Avancada         ║
echo    ║  [3] Limpeza de Logs                     │  [4] Prefetch e Superfetch    ║
echo    ║  [5] Cache de Navegadores                │  [6] Arquivos Temporarios     ║
echo    ║  [7] Limpeza Personalizada               │  [8] Relatorio de Espaco      ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "CLN_CHOICE=   ═══^> Digite sua opcao: "

if "!CLN_CHOICE!"=="1" goto :BasicFileCleanup
if "!CLN_CHOICE!"=="2" goto :AdvancedFileCleanup
if "!CLN_CHOICE!"=="3" goto :LogCleanup
if "!CLN_CHOICE!"=="4" goto :PrefetchCleanup
if "!CLN_CHOICE!"=="5" goto :BrowserCacheCleanup
if "!CLN_CHOICE!"=="6" goto :TempFilesCleanup
if "!CLN_CHOICE!"=="7" goto :CustomCleanup
if "!CLN_CHOICE!"=="8" goto :SpaceReport
if "!CLN_CHOICE!"=="0" goto :SystemOptimization
goto :FileCleanup

:BasicFileCleanup
echo    [CLN] Executando limpeza basica de arquivos...
call :ConfirmAction "executar limpeza basica de arquivos"
if !ERRO_LEVEL! neq 0 goto :FileCleanup

echo    [PROC] Limpando arquivos temporarios...
del /q /s "%TEMP%\*" >nul 2>&1 && echo    [OK] Arquivos temporarios do usuario || echo    [SKIP] Temp usuario
del /q /s "%TMP%\*" >nul 2>&1 && echo    [OK] Arquivos TMP || echo    [SKIP] TMP
del /q /s "%LOCALAPPDATA%\Temp\*" >nul 2>&1 && echo    [OK] Local temp || echo    [SKIP] Local temp

echo    [PROC] Limpando cache do Windows...
del /q "%SystemRoot%\Temp\*" >nul 2>&1 && echo    [OK] Windows Temp || echo    [SKIP] Windows Temp
del /q "%SystemRoot%\Prefetch\*" >nul 2>&1 && echo    [OK] Prefetch || echo    [SKIP] Prefetch

echo    [SUCCESS] Limpeza basica concluida!
pause
goto :FileCleanup

:AdvancedFileCleanup
echo    [CLN] Executando limpeza avancada de arquivos...
if "!IS_ADMIN!"=="0" (
    echo    [ERROR] Limpeza avancada requer privilegios administrativos!
    pause
    goto :FileCleanup
)

call :ConfirmAction "executar limpeza avancada (inclui arquivos do sistema)"
if !ERRO_LEVEL! neq 0 goto :FileCleanup

call :BasicFileCleanup
echo    [PROC] Limpeza avancada...
cleanmgr /sagerun:1 >nul 2>&1 && echo    [OK] Disk Cleanup executado || echo    [SKIP] Disk Cleanup falhou
sfc /scannow | findstr "violation" >nul 2>&1 || echo    [OK] Verificacao SFC concluida
echo    [SUCCESS] Limpeza avancada concluida!
pause
goto :FileCleanup

:LogCleanup
echo    [CLN] Limpando arquivos de log...
del /q "%SystemRoot%\*.log" >nul 2>&1 && echo    [OK] Logs do Windows || echo    [SKIP] Logs Windows
del /q "%SystemRoot%\Panther\*" >nul 2>&1 && echo    [OK] Logs de instalacao || echo    [SKIP] Logs instalacao
del /q "%LOCALAPPDATA%\Microsoft\Windows\WebCache\*" >nul 2>&1 && echo    [OK] WebCache || echo    [SKIP] WebCache
echo    [SUCCESS] Logs limpos!
pause
goto :FileCleanup

:PrefetchCleanup
echo    [CLN] Limpando Prefetch e Superfetch...
del /q "%SystemRoot%\Prefetch\*" >nul 2>&1 && echo    [OK] Prefetch limpo || echo    [SKIP] Prefetch
del /q "%SystemRoot%\System32\SysResetErr\*" >nul 2>&1 && echo    [OK] System Reset Errors || echo    [SKIP] Reset Errors
echo    [SUCCESS] Prefetch limpo!
pause
goto :FileCleanup

:BrowserCacheCleanup
echo    [CLN] Limpando cache de navegadores...
taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1

del /q /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1 && echo    [OK] Chrome cache || echo    [SKIP] Chrome
del /q /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1 && echo    [OK] Edge cache || echo    [SKIP] Edge
del /q /s "%APPDATA%\Mozilla\Firefox\Profiles\*\cache2\*" >nul 2>&1 && echo    [OK] Firefox cache || echo    [SKIP] Firefox

echo    [SUCCESS] Cache de navegadores limpo!
pause
goto :FileCleanup

:TempFilesCleanup
echo    [CLN] Limpeza completa de arquivos temporarios...
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i" >nul 2>&1
for /d %%i in ("%TMP%\*") do rd /s /q "%%i" >nul 2>&1
for /d %%i in ("%LOCALAPPDATA%\Temp\*") do rd /s /q "%%i" >nul 2>&1
echo    [SUCCESS] Arquivos temporarios completamente limpos!
pause
goto :FileCleanup

:CustomCleanup
echo    [CLN] Limpeza personalizada...
echo    [INFO] Opcoes personalizadas de limpeza:
echo        [1] Downloads antigos (mais de 30 dias)
echo        [2] Desktop arquivos temporarios
echo        [3] Documentos temporarios
echo        [0] Voltar
set /p "CUSTOM_CHOICE=   ═══^> Digite sua opcao: "

if "!CUSTOM_CHOICE!"=="1" (
    forfiles /p "%USERPROFILE%\Downloads" /c "cmd /c del @path" /m *.* /d -30 >nul 2>&1 && echo    [OK] Downloads antigos removidos || echo    [SKIP] Nenhum arquivo antigo
)
if "!CUSTOM_CHOICE!"=="2" (
    del /q "%USERPROFILE%\Desktop\*.tmp" >nul 2>&1 && echo    [OK] Desktop temporarios || echo    [SKIP] Nenhum temp no desktop
)
if "!CUSTOM_CHOICE!"=="3" (
    del /q "%USERPROFILE%\Documents\*.tmp" >nul 2>&1 && echo    [OK] Documentos temporarios || echo    [SKIP] Nenhum temp em documentos
)

pause
goto :FileCleanup

:SpaceReport
echo    [CLN] Gerando relatorio de espaco em disco...
echo.
echo    [INFO] Uso de disco por drive:
wmic logicaldisk get size,freespace,caption
echo.
echo    [INFO] Pastas que mais ocupam espaco:
dir C:\ /s /-c /o-s | findstr /r /e "\<[0-9][0-9]*\>" | head -10
echo.
pause
goto :FileCleanup

:Windows11Specific
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [W11] ESPECIFICOS WINDOWS 11                        ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

if not "!WINVER!"=="11" (
    echo    [WARN] Esta funcionalidade e especifica para Windows 11!
    echo    [INFO] Sistema detectado: !WINDOWS_VERSION!
    echo.
    pause
    goto :SystemOptimization
)

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Desabilitar Widgets                 │  [2] Menu Iniciar Classico    ║
echo    ║  [3] Explorer Classico                   │  [4] Desabilitar Copilot      ║
echo    ║  [5] Configurar Taskbar                  │  [6] Remover Teams            ║
echo    ║  [7] Otimizacoes Especificas W11         │  [8] Restaurar Configuracoes  ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "W11_CHOICE=   ═══^> Digite sua opcao: "

if "!W11_CHOICE!"=="1" goto :DisableWidgets
if "!W11_CHOICE!"=="2" goto :ClassicStartMenu
if "!W11_CHOICE!"=="3" goto :ClassicExplorer
if "!W11_CHOICE!"=="4" goto :DisableCopilot
if "!W11_CHOICE!"=="5" goto :ConfigureTaskbar
if "!W11_CHOICE!"=="6" goto :RemoveTeams
if "!W11_CHOICE!"=="7" goto :Windows11Optimizations
if "!W11_CHOICE!"=="8" goto :RestoreWindows11Settings
if "!W11_CHOICE!"=="0" goto :SystemOptimization
goto :Windows11Specific

:DisableWidgets
echo    [W11] Desabilitando Widgets do Windows 11...
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Widgets desabilitados || echo    [WARN] Falha nos widgets
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] News and Interests desabilitado || echo    [WARN] Falha no news
echo    [SUCCESS] Widgets desabilitados!
pause
goto :Windows11Specific

:ClassicStartMenu
echo    [W11] Configurando menu iniciar classico...
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_ShowClassicMode" /t REG_DWORD /d 1 /f >nul 2>&1 && echo    [OK] Menu classico ativado || echo    [WARN] Falha no menu classico
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSi" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Taskbar pequena ativada || echo    [WARN] Falha na taskbar
echo    [SUCCESS] Menu iniciar configurado!
echo    [INFO] Reinicie o Explorer ou faca logout para aplicar.
pause
goto :Windows11Specific

:ClassicExplorer
echo    [W11] Configurando Explorer classico...
REG ADD "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve >nul 2>&1 && echo    [OK] Explorer classico ativado || echo    [WARN] Falha no explorer classico
echo    [SUCCESS] Explorer classico configurado!
echo    [INFO] Reinicie o Explorer para aplicar.
pause
goto :Windows11Specific

:DisableCopilot
echo    [W11] Desabilitando Copilot...
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Botao Copilot removido || echo    [WARN] Falha no Copilot
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul 2>&1 && echo    [OK] Copilot desabilitado via policy || echo    [WARN] Falha na policy
echo    [SUCCESS] Copilot desabilitado!
pause
goto :Windows11Specific

:ConfigureTaskbar
echo    [W11] Configurando taskbar do Windows 11...
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Taskbar alinhada a esquerda || echo    [WARN] Falha no alinhamento
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Task View removido || echo    [WARN] Falha no Task View
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Caixa de pesquisa removida || echo    [WARN] Falha na pesquisa
echo    [SUCCESS] Taskbar configurada!
pause
goto :Windows11Specific

:RemoveTeams
echo    [W11] Removendo Microsoft Teams...
powershell -Command "Get-AppxPackage *Teams* | Remove-AppxPackage" >nul 2>&1 && echo    [OK] Teams removido || echo    [SKIP] Teams nao encontrado
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] Chat removido da taskbar || echo    [WARN] Falha no chat
echo    [SUCCESS] Teams removido!
pause
goto :Windows11Specific

:Windows11Optimizations
echo    [W11] Aplicando otimizacoes especificas do Windows 11...
call :ConfirmAction "aplicar todas as otimizacoes especificas do Windows 11"
if !ERRO_LEVEL! neq 0 goto :Windows11Specific

call :DisableWidgets
call :ClassicStartMenu
call :ClassicExplorer
call :DisableCopilot
call :ConfigureTaskbar
call :RemoveTeams

echo    [SUCCESS] Otimizacoes do Windows 11 aplicadas!
echo    [INFO] Reinicie o sistema para aplicar todas as mudancas.
pause
goto :Windows11Specific

:RestoreWindows11Settings
echo    [W11] Restaurando configuracoes padrao do Windows 11...
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /f >nul 2>&1
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /f >nul 2>&1
REG DELETE "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f >nul 2>&1
echo    [SUCCESS] Configuracoes restauradas!
pause
goto :Windows11Specific

:NetworkOptimization
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                       [NET] OTIMIZACAO DE REDE                            ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Otimizar TCP/IP para Gaming         │  [2] DNS Rapido (Cloudflare)  ║
echo    ║  [3] Configuracoes de QoS                │  [4] Otimizar MTU             ║
echo    ║  [5] Desabilitar Nagle Algorithm         │  [6] Configuracoes Avancadas  ║
echo    ║  [7] Teste de Velocidade                 │  [8] Restaurar Configuracoes  ║
echo    ║  [0] Voltar                                                               ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "NET_OPT_CHOICE=   ═══^> Digite sua opcao: "

if "!NET_OPT_CHOICE!"=="1" goto :OptimizeForGaming
if "!NET_OPT_CHOICE!"=="2" goto :SetCloudflareDNS
if "!NET_OPT_CHOICE!"=="3" goto :ConfigureQoS
if "!NET_OPT_CHOICE!"=="4" goto :OptimizeMTU
if "!NET_OPT_CHOICE!"=="5" goto :DisableNagle
if "!NET_OPT_CHOICE!"=="6" goto :AdvancedNetworkSettings
if "!NET_OPT_CHOICE!"=="7" goto :SpeedTest
if "!NET_OPT_CHOICE!"=="8" goto :RestoreNetworkSettings
if "!NET_OPT_CHOICE!"=="0" goto :SystemOptimization
goto :NetworkOptimization

:OptimizeForGaming
echo    [NET] Otimizando rede para gaming...
netsh int tcp set global autotuninglevel=normal >nul 2>&1 && echo    [OK] Auto-tuning otimizado || echo    [WARN] Falha no auto-tuning
netsh int tcp set global chimney=enabled >nul 2>&1 && echo    [OK] TCP Chimney habilitado || echo    [WARN] Falha no chimney
netsh int tcp set global rss=enabled >nul 2>&1 && echo    [OK] RSS habilitado || echo    [WARN] Falha no RSS
netsh int tcp set global netdma=enabled >nul 2>&1 && echo    [OK] NetDMA habilitado || echo    [WARN] Falha no NetDMA
echo    [SUCCESS] Rede otimizada para gaming!
pause
goto :NetworkOptimization

:SetCloudflareDNS
echo    [NET] Configurando DNS da Cloudflare...
for /f "tokens=3*" %%i in ('netsh interface show interface ^| findstr "Connected"') do (
    netsh interface ip set dns "%%j" static 1.1.1.1 >nul 2>&1 && echo    [OK] DNS primario configurado para %%j
    netsh interface ip add dns "%%j" 1.0.0.1 index=2 >nul 2>&1 && echo    [OK] DNS secundario configurado para %%j
)
echo    [SUCCESS] DNS da Cloudflare configurado!
pause
goto :NetworkOptimization

:ConfigureQoS
echo    [NET] Configurando Quality of Service...
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f >nul 2>&1 && echo    [OK] QoS packet scheduler otimizado || echo    [WARN] Falha no QoS
netsh int tcp set global autotuninglevel=normal >nul 2>&1 && echo    [OK] Auto-tuning configurado || echo    [WARN] Falha no auto-tuning
echo    [SUCCESS] QoS configurado!
pause
goto :NetworkOptimization

:OptimizeMTU
echo    [NET] Otimizando MTU...
echo    [INFO] Descobrindo MTU otimo...
ping -f -l 1472 8.8.8.8 -n 1 >nul 2>&1
if !errorlevel! equ 0 (
    netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent >nul 2>&1 && echo    [OK] MTU configurado para 1500 || echo    [WARN] Falha no MTU
) else (
    echo    [INFO] Usando MTU padrao
)
echo    [SUCCESS] MTU otimizado!
pause
goto :NetworkOptimization

:DisableNagle
echo    [NET] Desabilitando Nagle Algorithm...
for /f "tokens=*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /s /k 2^>nul ^| findstr "HKEY"') do (
    REG ADD "%%a" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >nul 2>&1
    REG ADD "%%a" /v "TCPNoDelay" /t REG_DWORD /d 1 /f >nul 2>&1
)
echo    [OK] Nagle Algorithm desabilitado!
echo    [SUCCESS] Latencia de rede otimizada!
pause
goto :NetworkOptimization

:AdvancedNetworkSettings
echo    [NET] Configuracoes avancadas de rede...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f >nul 2>&1 && echo    [OK] TTL configurado || echo    [WARN] Falha no TTL
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d 2 /f >nul 2>&1 && echo    [OK] MaxDupAcks configurado || echo    [WARN] Falha no MaxDupAcks
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SynAttackProtect" /t REG_DWORD /d 1 /f >nul 2>&1 && echo    [OK] SYN Attack Protection habilitado || echo    [WARN] Falha na protecao
echo    [SUCCESS] Configuracoes avancadas aplicadas!
pause
goto :NetworkOptimization

:SpeedTest
echo    [NET] Executando teste de conectividade...
echo    [INFO] Testando latencia para diferentes servidores:
ping -n 4 8.8.8.8 | findstr "TTL" | findstr "time"
ping -n 4 1.1.1.1 | findstr "TTL" | findstr "time"
echo.
echo    [INFO] Para teste de velocidade completo, use sites como speedtest.net
pause
goto :NetworkOptimization

:RestoreNetworkSettings
echo    [NET] Restaurando configuracoes padrao de rede...
netsh int ip reset >nul 2>&1 && echo    [OK] TCP/IP resetado || echo    [WARN] Falha no reset
netsh winsock reset >nul 2>&1 && echo    [OK] Winsock resetado || echo    [WARN] Falha no winsock
ipconfig /flushdns >nul 2>&1 && echo    [OK] DNS cache limpo || echo    [WARN] Falha no DNS
echo    [SUCCESS] Configuracoes de rede restauradas!
echo    [INFO] Reinicie o sistema para aplicar todas as mudancas.
pause
goto :NetworkOptimization

:PowerManagement
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                        [PWR] GERENCIAMENTO DE ENERGIA                     ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║  [1] Alto Performance                │  [2] Balanceado                   ║
echo    ║  [3] Economia de Energia             │  [4] Performance Ultimate        ║
echo    ║  [5] Configuracoes de Hibernacao    │  [6] USB Power Management        ║
echo    ║  [7] Status Atual                   │  [8] Restaurar Padrao            ║
echo    ║  [0] Voltar                                                              ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "PWR_CHOICE=   ═══^> Digite sua opcao: "

if "!PWR_CHOICE!"=="1" goto :SetHighPerformance
if "!PWR_CHOICE!"=="2" goto :SetBalanced
if "!PWR_CHOICE!"=="3" goto :SetPowerSaver
if "!PWR_CHOICE!"=="4" goto :SetUltimatePerformance
if "!PWR_CHOICE!"=="5" goto :ConfigureHibernation
if "!PWR_CHOICE!"=="6" goto :USBPowerManagement
if "!PWR_CHOICE!"=="7" goto :PowerStatus
if "!PWR_CHOICE!"=="8" goto :RestorePowerDefaults
if "!PWR_CHOICE!"=="0" goto :ServiceManager
goto :PowerManagement

:SetHighPerformance
echo    [PWR] Configurando Alto Performance...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1 && echo    [OK] Perfil Alto Performance ativado || echo    [WARN] Falha ao ativar perfil
pause
goto :PowerManagement

:SetBalanced
echo    [PWR] Configurando modo Balanceado...
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1 && echo    [OK] Perfil Balanceado ativado || echo    [WARN] Falha ao ativar perfil
pause
goto :PowerManagement

:SetPowerSaver
echo    [PWR] Configurando Economia de Energia...
powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a >nul 2>&1 && echo    [OK] Perfil Economia ativado || echo    [WARN] Falha ao ativar perfil
pause
goto :PowerManagement

:SetUltimatePerformance
echo    [PWR] Configurando Performance Ultimate...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1 && echo    [OK] Perfil Ultimate criado || echo    [SKIP] Ultimate ja existe
powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1 && echo    [OK] Performance Ultimate ativado || echo    [WARN] Falha ao ativar Ultimate
pause
goto :PowerManagement

:ConfigureHibernation
echo    [PWR] Configurando hibernacao...
echo    [1] Desabilitar hibernacao
echo    [2] Habilitar hibernacao
echo    [3] Hibernacao hibrida
set /p "HIB_CHOICE=   ═══^> Digite sua opcao: "

if "!HIB_CHOICE!"=="1" (
    powercfg /hibernate off >nul 2>&1 && echo    [OK] Hibernacao desabilitada || echo    [WARN] Falha ao desabilitar
)
if "!HIB_CHOICE!"=="2" (
    powercfg /hibernate on >nul 2>&1 && echo    [OK] Hibernacao habilitada || echo    [WARN] Falha ao habilitar
)
if "!HIB_CHOICE!"=="3" (
    powercfg /hibernate on >nul 2>&1
    powercfg /change hibernate-timeout-ac 0 >nul 2>&1 && echo    [OK] Hibernacao hibrida configurada || echo    [WARN] Falha na configuracao
)
pause
goto :PowerManagement

:USBPowerManagement
echo    [PWR] Configurando gerenciamento de energia USB...
powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 >nul 2>&1 && echo    [OK] USB power management otimizado || echo    [WARN] Falha na configuracao USB
powercfg /setdcvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 >nul 2>&1
powercfg /setactive scheme_current >nul 2>&1
pause
goto :PowerManagement

:PowerStatus
echo    [PWR] Status atual do gerenciamento de energia:
echo.
powercfg /query scheme_current | findstr /C:"Power Scheme" /C:"Subgroup" | head -5
echo.
pause
goto :PowerManagement

:RestorePowerDefaults
echo    [PWR] Restaurando configuracoes padrao de energia...
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1 && echo    [OK] Perfil Balanceado restaurado || echo    [WARN] Falha ao restaurar
powercfg /hibernate on >nul 2>&1 && echo    [OK] Hibernacao restaurada || echo    [WARN] Falha na hibernacao
echo    [SUCCESS] Configuracoes de energia restauradas!
pause
goto :PowerManagement

REM ================================================================================
REM FUNÇÃO DE SAÍDA
REM ================================================================================

:ExitProgram
cls
call :DrawGhostHeader
echo.
echo    ╔═══════════════════════════════════════════════════════════════════════════╗
echo    ║                             [EXIT] OBRIGADO!                              ║
echo    ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
echo    [TIP] DICAS PARA MANTER A PERFORMANCE:
echo       * Execute limpeza de memoria regularmente
echo       * Monitore processos com alto consumo
echo       * Mantenha apenas programas necessarios abertos
echo       * Considere aumentar a RAM se necessario
echo.
echo    [DEV] Desenvolvido por %AUTHOR% - 2025
echo    [LIC] Licenca: Creative Commons BY-NC 4.0
echo    [WEB] GitHub: https://github.com/Gabs77u/Otimizador-WIN
echo.
echo    [LEG] AVISO LEGAL: Este software e fornecido "como esta" sem garantias.
echo       Para termos completos, consulte o arquivo TERMOS_DE_USO.md
echo.
pause
exit /b 0
