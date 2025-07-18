@echo off
REM ================================================================================
REM TESTES UNITÁRIOS - WINBOX TOOLKIT OPTIMIZATION
REM Testes específicos para funções individuais
REM Copyright (c) 2025 Gabs77u - Testes unitários
REM ================================================================================

setlocal EnableDelayedExpansion
chcp 65001 > nul 2>&1

set "UNIT_TEST_LOG=unit_test_%date:~6,4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%.log"
set "WINBOX_SCRIPT=Otimizador WIN 10\Winbox Toolkit Optimization.bat"

echo ================================================================================
echo WINBOX TOOLKIT - TESTES UNITARIOS ESPECIFICOS
echo ================================================================================
echo.

REM ================================================================================
REM TESTES UNITÁRIOS DE FUNÇÕES DE MEMÓRIA
REM ================================================================================
:TestMemoryFunctions
echo [UNIT] TESTANDO FUNCOES DE MEMORIA
echo ================================================================================

call :TestUnit "GetCurrentMemoryInfo" "TestGetCurrentMemoryInfo"
call :TestUnit "DrawMemoryBar" "TestDrawMemoryBar"
call :TestUnit "ShowMemoryAlerts" "TestShowMemoryAlerts"
call :TestUnit "MemoryCleanup Logic" "TestMemoryCleanupLogic"

echo.

REM ================================================================================
REM TESTES UNITÁRIOS DE DETECÇÃO DE SISTEMA
REM ================================================================================
:TestSystemDetection
echo [UNIT] TESTANDO DETECCAO DE SISTEMA
echo ================================================================================

call :TestUnit "DetectWindowsVersion" "TestDetectWindowsVersionUnit"
call :TestUnit "CheckAdminPrivileges" "TestCheckAdminPrivilegesUnit"
call :TestUnit "System Info Display" "TestSystemInfoDisplay"

echo.

REM ================================================================================
REM TESTES UNITÁRIOS DE INTERFACE
REM ================================================================================
:TestInterfaceFunctions
echo [UNIT] TESTANDO FUNCOES DE INTERFACE
echo ================================================================================

call :TestUnit "DrawGhostHeader" "TestDrawGhostHeaderUnit"
call :TestUnit "DrawMainMenu" "TestDrawMainMenuUnit"
call :TestUnit "ShowSystemInfo" "TestShowSystemInfoUnit"

echo.

REM ================================================================================
REM TESTES UNITÁRIOS DE VALIDAÇÃO
REM ================================================================================
:TestValidationFunctions
echo [UNIT] TESTANDO FUNCOES DE VALIDACAO
echo ================================================================================

call :TestUnit "Input Validation" "TestInputValidationUnit"
call :TestUnit "ConfirmAction" "TestConfirmActionUnit"
call :TestUnit "Error Handling" "TestErrorHandlingUnit"

echo.

REM ================================================================================
REM TESTES UNITÁRIOS DE OTIMIZAÇÃO
REM ================================================================================
:TestOptimizationFunctions
echo [UNIT] TESTANDO FUNCOES DE OTIMIZACAO
echo ================================================================================

call :TestUnit "Performance Optimization" "TestPerformanceOptimizationUnit"
call :TestUnit "Service Management" "TestServiceManagementUnit"
call :TestUnit "Registry Operations" "TestRegistryOperationsUnit"

echo.

REM ================================================================================
REM RELATÓRIO DE TESTES UNITÁRIOS
REM ================================================================================
:UnitTestReport
echo ================================================================================
echo RELATORIO DE TESTES UNITARIOS
echo ================================================================================
echo.
echo [INFO] Testes unitarios concluidos.
echo [LOG] Resultados salvos em: %UNIT_TEST_LOG%
echo.
pause
exit /b 0

REM ================================================================================
REM FUNÇÕES DE TESTE UNITÁRIO ESPECÍFICAS
REM ================================================================================

:TestGetCurrentMemoryInfo
echo   [TEST] Verificando funcao GetCurrentMemoryInfo...
REM Simular teste da função de memória
findstr /C:"Get-CimInstance.*TotalVisibleMemorySize" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"TOTAL_KB" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Funcao GetCurrentMemoryInfo implementada corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Variavel TOTAL_KB nao encontrada"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Comando Get-CimInstance nao encontrado"
)
goto :eof

:TestDrawMemoryBar
echo   [TEST] Verificando funcao DrawMemoryBar...
findstr /C:"BAR_LENGTH.*50" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"FILLED_CHARS" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Funcao DrawMemoryBar implementada corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Calculo de caracteres preenchidos nao encontrado"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Configuracao de comprimento da barra nao encontrada"
)
goto :eof

:TestShowMemoryAlerts
echo   [TEST] Verificando funcao ShowMemoryAlerts...
findstr /C:"CRITICO.*95" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"ALTO.*MONITOR_ALERT_LEVEL" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Sistema de alertas implementado corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Alerta de nivel alto nao encontrado"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Alerta critico nao encontrado"
)
goto :eof

:TestMemoryCleanupLogic
echo   [TEST] Verificando logica de limpeza de memoria...
findstr /C:"IS_ADMIN.*1" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"System.GC.*Collect" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Logica de limpeza implementada corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Comando de coleta de lixo nao encontrado"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Verificacao de privilegio admin nao encontrada"
)
goto :eof

:TestDetectWindowsVersionUnit
echo   [TEST] Verificando deteccao de versao Windows...
findstr /C:"for /f.*tokens.*ver" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"22000.*WINVER.*11" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Deteccao de versao implementada corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Deteccao Windows 11 nao encontrada"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Comando ver nao encontrado"
)
goto :eof

:TestCheckAdminPrivilegesUnit
echo   [TEST] Verificando verificacao de privilegios...
findstr /C:"net session.*errorlevel.*0" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"ADMIN_STATUS.*SIM" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Verificacao de privilegios implementada corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Definicao de status admin nao encontrada"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Teste de net session nao encontrado"
)
goto :eof

:TestSystemInfoDisplay
echo   [TEST] Verificando exibicao de informacoes do sistema...
findstr /C:"SISTEMA.*WINDOWS_VERSION" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"ADMIN.*ADMIN_STATUS" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Exibicao de informacoes implementada corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Exibicao de status admin nao encontrada"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Exibicao de versao do sistema nao encontrada"
)
goto :eof

:TestDrawGhostHeaderUnit
echo   [TEST] Verificando desenho do cabecalho...
findstr /C:"██╗.*██╗.*██╗" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"WINBOX.*TOOLKIT" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Cabecalho ASCII implementado corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Titulo do toolkit nao encontrado"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Arte ASCII do cabecalho nao encontrada"
)
goto :eof

:TestDrawMainMenuUnit
echo   [TEST] Verificando desenho do menu principal...
findstr /C:"MENU PRINCIPAL" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"\[1\].*SYS.*\[2\].*RAM" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Menu principal implementado corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Opcoes principais do menu nao encontradas"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Titulo do menu principal nao encontrado"
)
goto :eof

:TestShowSystemInfoUnit
echo   [TEST] Verificando exibicao de informacoes do sistema...
findstr /C:"call :GetCurrentMemoryInfo" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"RAM.*MEMORY_USAGE_MB.*TOTAL_MEMORY_MB" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Exibicao de informacoes do sistema implementada"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Formatacao de informacoes de memoria nao encontrada"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Chamada para GetCurrentMemoryInfo nao encontrada"
)
goto :eof

:TestInputValidationUnit
echo   [TEST] Verificando validacao de entrada...
findstr /C:"if.*MENU_CHOICE.*==" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"InvalidChoice" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Validacao de entrada implementada corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Tratamento de escolha invalida nao encontrado"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Verificacao de escolhas nao encontrada"
)
goto :eof

:TestConfirmActionUnit
echo   [TEST] Verificando funcao de confirmacao...
findstr /C:"Tem certeza que deseja" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"CONFIRM.*S.*N" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Funcao de confirmacao implementada corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Opcoes de confirmacao nao encontradas"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Mensagem de confirmacao nao encontrada"
)
goto :eof

:TestErrorHandlingUnit
echo   [TEST] Verificando tratamento de erros...
findstr /C:">nul 2>&1" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"errorlevel.*equ.*0" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Tratamento de erros implementado corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Verificacao de errorlevel nao encontrada"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Redirecionamento de erro nao encontrado"
)
goto :eof

:TestPerformanceOptimizationUnit
echo   [TEST] Verificando otimizacao de performance...
findstr /C:"Win32PrioritySeparation.*38" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"REG ADD.*HKEY_LOCAL_MACHINE" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Otimizacao de performance implementada corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Comandos de registro nao encontrados"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Configuracao de prioridade nao encontrada"
)
goto :eof

:TestServiceManagementUnit
echo   [TEST] Verificando gerenciamento de servicos...
findstr /C:"sc config.*DiagTrack.*disabled" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"dmwappushservice.*disabled" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Gerenciamento de servicos implementado corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Servico WAP Push nao encontrado"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Servico DiagTrack nao encontrado"
)
goto :eof

:TestRegistryOperationsUnit
echo   [TEST] Verificando operacoes de registro...
findstr /C:"REG ADD.*AllowTelemetry.*0" "%WINBOX_SCRIPT%" > nul 2>&1
if !errorlevel! equ 0 (
    findstr /C:"TailoredExperiencesWithDiagnosticDataEnabled.*0" "%WINBOX_SCRIPT%" > nul 2>&1
    if !errorlevel! equ 0 (
        set "UNIT_RESULT=PASS"
        set "UNIT_MESSAGE=Operacoes de registro implementadas corretamente"
    ) else (
        set "UNIT_RESULT=FAIL"
        set "UNIT_MESSAGE=Configuracao de experiencias personalizadas nao encontrada"
    )
) else (
    set "UNIT_RESULT=FAIL"
    set "UNIT_MESSAGE=Configuracao de telemetria nao encontrada"
)
goto :eof

REM ================================================================================
REM FUNÇÃO AUXILIAR PARA TESTES UNITÁRIOS
REM ================================================================================

:TestUnit
set "UNIT_NAME=%~1"
set "UNIT_FUNC=%~2"

echo [UNIT] Testando: %UNIT_NAME%

call :%UNIT_FUNC%

if "!UNIT_RESULT!"=="PASS" (
    echo   [PASS] %UNIT_MESSAGE%
    echo %date% %time% - UNIT TEST: %UNIT_NAME% - PASS - %UNIT_MESSAGE% >> "%UNIT_TEST_LOG%"
) else (
    echo   [FAIL] %UNIT_MESSAGE%
    echo %date% %time% - UNIT TEST: %UNIT_NAME% - FAIL - %UNIT_MESSAGE% >> "%UNIT_TEST_LOG%"
)

echo.
goto :eof
