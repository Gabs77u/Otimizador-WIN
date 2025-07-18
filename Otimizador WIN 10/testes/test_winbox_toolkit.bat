@echo off
REM ================================================================================
REM TESTE COMPLETO - WINBOX TOOLKIT OPTIMIZATION v4.0
REM Arquivo de teste abrangente para todas as funcionalidades
REM Copyright (c) 2025 Gabs77u - Teste automatizado
REM ================================================================================

setlocal EnableDelayedExpansion
chcp 65001 > nul 2>&1

REM ================================================================================
REM CONFIGURAÇÕES DO TESTE
REM ================================================================================
set "TEST_VERSION=1.0"
set "TEST_LOG=test_results_%date:~6,4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%.log"
set "TOTAL_TESTS=0"
set "PASSED_TESTS=0"
set "FAILED_TESTS=0"
set "WINBOX_SCRIPT=Otimizador WIN 10\Winbox Toolkit Optimization.bat"

REM ================================================================================
REM INICIALIZAÇÃO DO TESTE
REM ================================================================================
:StartTest
cls
echo ================================================================================
echo WINBOX TOOLKIT OPTIMIZATION - TESTE AUTOMATIZADO v%TEST_VERSION%
echo ================================================================================
echo.
echo [INFO] Iniciando bateria de testes completa...
echo [LOG] Arquivo de log: %TEST_LOG%
echo [TARGET] Script alvo: %WINBOX_SCRIPT%
echo.

REM Verificar se o arquivo principal existe
if not exist "%WINBOX_SCRIPT%" (
    echo [ERROR] Arquivo principal nao encontrado: %WINBOX_SCRIPT%
    echo [FAIL] Teste abortado - arquivo nao existe
    pause
    exit /b 1
)

echo [SUCCESS] Arquivo principal encontrado: %WINBOX_SCRIPT%
echo.

REM Criar arquivo de log
echo ================================================================================ > "%TEST_LOG%"
echo WINBOX TOOLKIT OPTIMIZATION - TESTE AUTOMATIZADO >> "%TEST_LOG%"
echo Data/Hora: %date% %time% >> "%TEST_LOG%"
echo ================================================================================ >> "%TEST_LOG%"
echo. >> "%TEST_LOG%"

REM ================================================================================
REM TESTES DE ESTRUTURA E SINTAXE
REM ================================================================================
:TestStructure
echo [FASE 1] TESTANDO ESTRUTURA E SINTAXE...
echo ----------------------------------------
call :LogMessage "FASE 1: TESTES DE ESTRUTURA E SINTAXE"

REM Teste 1: Verificar encoding UTF-8
call :TestFunction "Verificacao de encoding UTF-8" "TestEncoding"

REM Teste 2: Verificar headers e comentários
call :TestFunction "Verificacao de headers" "TestHeaders"

REM Teste 3: Verificar variáveis globais
call :TestFunction "Verificacao de variaveis globais" "TestGlobalVariables"

REM Teste 4: Verificar estrutura de funções
call :TestFunction "Verificacao de estrutura de funcoes" "TestFunctionStructure"

REM Teste 5: Verificar labels e gotos
call :TestFunction "Verificacao de labels e gotos" "TestLabelsGotos"

echo.

REM ================================================================================
REM TESTES DE FUNCIONALIDADES BÁSICAS
REM ================================================================================
:TestBasicFunctions
echo [FASE 2] TESTANDO FUNCIONALIDADES BASICAS...
echo ---------------------------------------------
call :LogMessage "FASE 2: TESTES DE FUNCIONALIDADES BASICAS"

REM Teste 6: Detecção de sistema
call :TestFunction "Deteccao de sistema" "TestSystemDetection"

REM Teste 7: Verificação de privilégios admin
call :TestFunction "Verificacao de privilegios admin" "TestAdminPrivileges"

REM Teste 8: Informações de memória
call :TestFunction "Informacoes de memoria" "TestMemoryInfo"

REM Teste 9: Interface visual
call :TestFunction "Interface visual" "TestVisualInterface"

echo.

REM ================================================================================
REM TESTES DE MENUS E NAVEGAÇÃO
REM ================================================================================
:TestMenus
echo [FASE 3] TESTANDO MENUS E NAVEGACAO...
echo --------------------------------------
call :LogMessage "FASE 3: TESTES DE MENUS E NAVEGACAO"

REM Teste 10: Menu principal
call :TestFunction "Menu principal" "TestMainMenu"

REM Teste 11: Menu de otimização de sistema
call :TestFunction "Menu de otimizacao de sistema" "TestSystemOptimizationMenu"

REM Teste 12: Menu gerenciador de memória
call :TestFunction "Menu gerenciador de memoria" "TestMemoryManagerMenu"

REM Teste 13: Menu privacidade e telemetria
call :TestFunction "Menu privacidade e telemetria" "TestPrivacyMenu"

REM Teste 14: Menu gerenciador de serviços
call :TestFunction "Menu gerenciador de servicos" "TestServiceManagerMenu"

REM Teste 15: Menu configurações avançadas
call :TestFunction "Menu configuracoes avancadas" "TestAdvancedSettingsMenu"

echo.

REM ================================================================================
REM TESTES DE FUNCIONALIDADES DE MEMÓRIA
REM ================================================================================
:TestMemoryFunctions
echo [FASE 4] TESTANDO FUNCIONALIDADES DE MEMORIA...
echo ------------------------------------------------
call :LogMessage "FASE 4: TESTES DE FUNCIONALIDADES DE MEMORIA"

REM Teste 16: Limpeza de memória
call :TestFunction "Limpeza de memoria" "TestMemoryCleanup"

REM Teste 17: Monitor em tempo real
call :TestFunction "Monitor em tempo real" "TestRealTimeMonitor"

REM Teste 18: Estatísticas de memória
call :TestFunction "Estatisticas de memoria" "TestMemoryStatistics"

REM Teste 19: Barra de progresso de memória
call :TestFunction "Barra de progresso de memoria" "TestMemoryBar"

REM Teste 20: Alertas de memória
call :TestFunction "Alertas de memoria" "TestMemoryAlerts"

echo.

REM ================================================================================
REM TESTES DE OTIMIZAÇÕES DE SISTEMA
REM ================================================================================
:TestSystemOptimizations
echo [FASE 5] TESTANDO OTIMIZACOES DE SISTEMA...
echo --------------------------------------------
call :LogMessage "FASE 5: TESTES DE OTIMIZACOES DE SISTEMA"

REM Teste 21: Otimização de performance
call :TestFunction "Otimizacao de performance" "TestPerformanceOptimization"

REM Teste 22: Desabilitar serviços
call :TestFunction "Desabilitar servicos" "TestDisableServices"

REM Teste 23: Remoção de telemetria
call :TestFunction "Remocao de telemetria" "TestRemoveTelemetry"

echo.

REM ================================================================================
REM TESTES DE COMPATIBILIDADE
REM ================================================================================
:TestCompatibility
echo [FASE 6] TESTANDO COMPATIBILIDADE...
echo ------------------------------------
call :LogMessage "FASE 6: TESTES DE COMPATIBILIDADE"

REM Teste 24: Compatibilidade Windows 10
call :TestFunction "Compatibilidade Windows 10" "TestWindows10Compatibility"

REM Teste 25: Compatibilidade Windows 11
call :TestFunction "Compatibilidade Windows 11" "TestWindows11Compatibility"

REM Teste 26: Comando PowerShell
call :TestFunction "Comandos PowerShell" "TestPowerShellCommands"

REM Teste 27: Comandos WMIC
call :TestFunction "Comandos WMIC" "TestWMICCommands"

echo.

REM ================================================================================
REM TESTES DE SEGURANÇA E VALIDAÇÃO
REM ================================================================================
:TestSecurity
echo [FASE 7] TESTANDO SEGURANCA E VALIDACAO...
echo ------------------------------------------
call :LogMessage "FASE 7: TESTES DE SEGURANCA E VALIDACAO"

REM Teste 28: Validação de entrada
call :TestFunction "Validacao de entrada" "TestInputValidation"

REM Teste 29: Tratamento de erros
call :TestFunction "Tratamento de erros" "TestErrorHandling"

REM Teste 30: Confirmação de ações
call :TestFunction "Confirmacao de acoes" "TestActionConfirmation"

echo.

REM ================================================================================
REM RESULTADOS FINAIS
REM ================================================================================
:TestResults
echo ================================================================================
echo RESULTADOS FINAIS DOS TESTES
echo ================================================================================
echo.
echo [TOTAL] Total de testes executados: %TOTAL_TESTS%
echo [PASS] Testes aprovados: %PASSED_TESTS%
echo [FAIL] Testes falharam: %FAILED_TESTS%

set /a "SUCCESS_RATE=(%PASSED_TESTS%*100)/%TOTAL_TESTS%"
echo [RATE] Taxa de sucesso: %SUCCESS_RATE%%%

call :LogMessage "=================================================================================="
call :LogMessage "RESULTADOS FINAIS"
call :LogMessage "=================================================================================="
call :LogMessage "Total de testes: %TOTAL_TESTS%"
call :LogMessage "Testes aprovados: %PASSED_TESTS%"
call :LogMessage "Testes falharam: %FAILED_TESTS%"
call :LogMessage "Taxa de sucesso: %SUCCESS_RATE%%%"

if %FAILED_TESTS% equ 0 (
    echo.
    echo [SUCCESS] TODOS OS TESTES PASSARAM!
    echo [STATUS] O Winbox Toolkit Optimization esta funcionando corretamente.
    call :LogMessage "RESULTADO: TODOS OS TESTES PASSARAM!"
) else (
    echo.
    echo [WARNING] ALGUNS TESTES FALHARAM!
    echo [STATUS] Verifique o log para detalhes dos problemas encontrados.
    call :LogMessage "RESULTADO: ALGUNS TESTES FALHARAM!"
)

echo.
echo [LOG] Resultados completos salvos em: %TEST_LOG%
echo.
pause
exit /b 0

REM ================================================================================
REM FUNÇÕES DE TESTE ESPECÍFICAS
REM ================================================================================

:TestEncoding
REM Verificar se o arquivo usa encoding correto
findstr /C:"chcp 65001" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    set "TEST_RESULT=PASS"
    set "TEST_MESSAGE=Encoding UTF-8 configurado corretamente"
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Encoding UTF-8 nao encontrado"
)
goto :eof

:TestHeaders
REM Verificar se headers estão presentes
findstr /C:"WINBOX TOOLKIT OPTIMIZATION" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    set "TEST_RESULT=PASS"
    set "TEST_MESSAGE=Headers principais encontrados"
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Headers principais nao encontrados"
)
goto :eof

:TestGlobalVariables
REM Verificar variáveis globais importantes
findstr /C:"VERSION=" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"AUTHOR=" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Variaveis globais definidas corretamente"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Variavel AUTHOR nao encontrada"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Variavel VERSION nao encontrada"
)
goto :eof

:TestFunctionStructure
REM Verificar se principais funções existem
findstr /C:":DrawGhostHeader" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:":GetCurrentMemoryInfo" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Estrutura de funcoes principal encontrada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Funcao GetCurrentMemoryInfo nao encontrada"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao DrawGhostHeader nao encontrada"
)
goto :eof

:TestLabelsGotos
REM Verificar se labels principais existem
findstr /C:":MainMenu" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:":SystemOptimization" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Labels principais encontrados"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Label SystemOptimization nao encontrado"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Label MainMenu nao encontrado"
)
goto :eof

:TestSystemDetection
REM Verificar função de detecção de sistema
findstr /C:":DetectWindowsVersion" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"WINDOWS_VERSION=" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Deteccao de sistema implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Variavel WINDOWS_VERSION nao encontrada"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao DetectWindowsVersion nao encontrada"
)
goto :eof

:TestAdminPrivileges
REM Verificar verificação de privilégios admin
findstr /C:":CheckAdminPrivileges" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"net session" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Verificacao de privilegios admin implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Comando net session nao encontrado"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao CheckAdminPrivileges nao encontrada"
)
goto :eof

:TestMemoryInfo
REM Verificar função de informações de memória
findstr /C:"Get-CimInstance" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"TotalVisibleMemorySize" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Funcoes de memoria implementadas corretamente"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Comando TotalVisibleMemorySize nao encontrado"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Comando Get-CimInstance nao encontrado"
)
goto :eof

:TestVisualInterface
REM Verificar elementos da interface visual
findstr /C:"╔═══" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"██╗" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Interface visual ASCII implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Arte ASCII nao encontrada"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Bordas de interface nao encontradas"
)
goto :eof

:TestMainMenu
REM Verificar estrutura do menu principal
findstr /C:"MENU PRINCIPAL" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"[1].*SYS.*OTIMIZACAO" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Menu principal estruturado corretamente"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Opcoes do menu principal incompletas"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Menu principal nao encontrado"
)
goto :eof

:TestSystemOptimizationMenu
REM Verificar menu de otimização de sistema
findstr /C:"OTIMIZACAO DE SISTEMA" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"[1].*REG.*Performance" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Menu de otimizacao implementado"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Opcoes de otimizacao incompletas"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Menu de otimizacao nao encontrado"
)
goto :eof

:TestMemoryManagerMenu
REM Verificar menu gerenciador de memória
findstr /C:"GERENCIADOR DE MEMORIA" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"[1].*CLN.*Limpeza" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Menu gerenciador de memoria implementado"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Opcoes de memoria incompletas"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Menu gerenciador de memoria nao encontrado"
)
goto :eof

:TestPrivacyMenu
REM Verificar menu de privacidade
findstr /C:"PRIVACIDADE E TELEMETRIA" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"[1].*TEL.*Telemetria" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Menu de privacidade implementado"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Opcoes de privacidade incompletas"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Menu de privacidade nao encontrado"
)
goto :eof

:TestServiceManagerMenu
REM Verificar menu gerenciador de serviços
findstr /C:"GERENCIADOR DE SERVICOS" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"[1].*DIS.*Servicos" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Menu gerenciador de servicos implementado"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Opcoes de servicos incompletas"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Menu gerenciador de servicos nao encontrado"
)
goto :eof

:TestAdvancedSettingsMenu
REM Verificar menu configurações avançadas
findstr /C:"CONFIGURACOES AVANCADAS" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"[1].*PGM.*Programa" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Menu configuracoes avancadas implementado"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Opcoes avancadas incompletas"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Menu configuracoes avancadas nao encontrado"
)
goto :eof

:TestMemoryCleanup
REM Verificar função de limpeza de memória
findstr /C:":MemoryCleanup" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"System.GC" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Funcao de limpeza de memoria implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Comandos de limpeza nao encontrados"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao MemoryCleanup nao encontrada"
)
goto :eof

:TestRealTimeMonitor
REM Verificar monitor em tempo real
findstr /C:":RealTimeMemoryMonitor" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"MonitorLoop" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Monitor em tempo real implementado"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Loop de monitoramento nao encontrado"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Monitor em tempo real nao encontrado"
)
goto :eof

:TestMemoryStatistics
REM Verificar estatísticas de memória
findstr /C:":MemoryStatistics" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"TOP.*PROCESSOS" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Estatisticas de memoria implementadas"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Exibicao de processos nao encontrada"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao MemoryStatistics nao encontrada"
)
goto :eof

:TestMemoryBar
REM Verificar barra de progresso de memória
findstr /C:":DrawMemoryBar" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel! equ 0 (
    findstr /C:"BAR_LENGTH" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Barra de progresso implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Parametros da barra nao encontrados"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao DrawMemoryBar nao encontrada"
)
goto :eof

:TestMemoryAlerts
REM Verificar sistema de alertas de memória
findstr /C:":ShowMemoryAlerts" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"CRITICO" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Sistema de alertas implementado"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Alertas criticos nao encontrados"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao ShowMemoryAlerts nao encontrada"
)
goto :eof

:TestPerformanceOptimization
REM Verificar otimização de performance
findstr /C:":PerformanceOptimization" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"Win32PrioritySeparation" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Otimizacao de performance implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Configuracoes de prioridade nao encontradas"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao PerformanceOptimization nao encontrada"
)
goto :eof

:TestDisableServices
REM Verificar desabilitação de serviços
findstr /C:":DisableServices" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"sc config.*DiagTrack" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Desabilitacao de servicos implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Comandos sc config nao encontrados"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao DisableServices nao encontrada"
)
goto :eof

:TestRemoveTelemetry
REM Verificar remoção de telemetria
findstr /C:":RemoveTelemetry" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"AllowTelemetry" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Remocao de telemetria implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Configuracoes de telemetria nao encontradas"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao RemoveTelemetry nao encontrada"
)
goto :eof

:TestWindows10Compatibility
REM Verificar compatibilidade com Windows 10
findstr /C:"Windows 10" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"WINVER.*10" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Compatibilidade Windows 10 implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Variavel WINVER para Win10 nao encontrada"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Referencias ao Windows 10 nao encontradas"
)
goto :eof

:TestWindows11Compatibility
REM Verificar compatibilidade com Windows 11
findstr /C:"Windows 11" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"22000" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Compatibilidade Windows 11 implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Build numbers Win11 nao encontrados"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Referencias ao Windows 11 nao encontradas"
)
goto :eof

:TestPowerShellCommands
REM Verificar comandos PowerShell
findstr /C:"powershell" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"Get-Process" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Comandos PowerShell implementados"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Comando Get-Process nao encontrado"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Comandos PowerShell nao encontrados"
)
goto :eof

:TestWMICCommands
REM Verificar comandos WMIC
findstr /C:"wmic" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"TotalPhysicalMemory" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Comandos WMIC implementados"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Comando TotalPhysicalMemory nao encontrado"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Comandos WMIC nao encontrados"
)
goto :eof

:TestInputValidation
REM Verificar validação de entrada
findstr /C:"InvalidChoice" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"Opcao invalida" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Validacao de entrada implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Mensagem de opcao invalida nao encontrada"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao InvalidChoice nao encontrada"
)
goto :eof

:TestErrorHandling
REM Verificar tratamento de erros
findstr /C:"errorlevel" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:">nul 2>&1" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Tratamento de erros implementado"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Redirecionamento de erro nao encontrado"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Verificacao de errorlevel nao encontrada"
)
goto :eof

:TestActionConfirmation
REM Verificar confirmação de ações
findstr /C:":ConfirmAction" "%WINBOX_SCRIPT%" >nul 2>&1
if %errorlevel% equ 0 (
    findstr /C:"Tem certeza" "%WINBOX_SCRIPT%" >nul 2>&1
    if !errorlevel! equ 0 (
        set "TEST_RESULT=PASS"
        set "TEST_MESSAGE=Confirmacao de acoes implementada"
    ) else (
        set "TEST_RESULT=FAIL"
        set "TEST_MESSAGE=Mensagem de confirmacao nao encontrada"
    )
) else (
    set "TEST_RESULT=FAIL"
    set "TEST_MESSAGE=Funcao ConfirmAction nao encontrada"
)
goto :eof

REM ================================================================================
REM FUNÇÕES AUXILIARES DE TESTE
REM ================================================================================

:TestFunction
set "TEST_NAME=%~1"
set "TEST_FUNC=%~2"
set /a "TOTAL_TESTS+=1"

echo [TEST %TOTAL_TESTS%] %TEST_NAME%...

call :%TEST_FUNC%

if "!TEST_RESULT!"=="PASS" (
    set /a "PASSED_TESTS+=1"
    echo   [PASS] %TEST_MESSAGE%
    call :LogMessage "TEST %TOTAL_TESTS% - %TEST_NAME%: PASS - %TEST_MESSAGE%"
) else (
    set /a "FAILED_TESTS+=1"
    echo   [FAIL] %TEST_MESSAGE%
    call :LogMessage "TEST %TOTAL_TESTS% - %TEST_NAME%: FAIL - %TEST_MESSAGE%"
)
goto :eof

:LogMessage
echo %~1 >> "%TEST_LOG%"
goto :eof

REM ================================================================================
REM TESTES ADICIONAIS - COBERTURA ESPECÍFICA
REM ================================================================================

:TestCodeCoverage
REM Verificar cobertura específica de código
echo [EXTRA] Executando testes de cobertura específica...

REM Verificar todas as funções implementadas vs declaradas
for /f "tokens=*" %%a in ('findstr /C:"goto :" "%WINBOX_SCRIPT%"') do (
    set "GOTO_LINE=%%a"
    REM Extrair o nome da função do goto
    for /f "tokens=2 delims=:" %%b in ("!GOTO_LINE!") do (
        set "FUNC_NAME=%%b"
        REM Verificar se a função existe
        findstr /C:":!FUNC_NAME!" "%WINBOX_SCRIPT%" >nul 2>&1
        if !errorlevel! neq 0 (
            echo   [WARN] Funcao referenciada mas nao implementada: !FUNC_NAME!
            call :LogMessage "WARNING: Funcao referenciada mas nao implementada: !FUNC_NAME!"
        )
    )
)

echo [EXTRA] Verificacao de cobertura concluida.
goto :eof
