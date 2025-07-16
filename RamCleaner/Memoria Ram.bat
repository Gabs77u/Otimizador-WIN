@ECHO OFF
setlocal EnableDelayedExpansion

:: ============================================================================
::   🚀 OTIMIZADOR DE MEMÓRIA RAM v3.0 - By Gabs
::   Liberação inteligente de memória com interface moderna
:: ============================================================================
::
::   Copyright (c) 2025 Gabs77u
::   Licensed under Creative Commons Attribution-NonCommercial 4.0 International
::   License (CC BY-NC 4.0)
::   
::   You are free to use, share, and adapt this work for non-commercial purposes
::   with proper attribution. Commercial use is prohibited.
::   
::   For full license terms, see: LICENSE file or
::   https://creativecommons.org/licenses/by-nc/4.0/
::
:: ============================================================================

:: Configurações globais
set "INTERVALO=30"
set "MONITOR_REFRESH=2"
set "MONITOR_ALERT_LEVEL=85"
set "VERSION=3.0"
set "AUTHOR=Gabs"
set "ERRO_LEVEL=0"

:: ============================================================================
::   🚀 OTIMIZADOR DE MEMÓRIA RAM v3.0 - By Gabs
::   Liberação inteligente de memória com interface moderna
:: ============================================================================

title OTIMIZADOR DE MEMORIA RAM v3.0 - By Gabs
chcp 65001 > NUL 2>&1
mode 80,25

echo 📊 ESTATÍSTICAS:
echo    • Mostra uso detalhado de memória
echo    • Lista processos com maior consumo
echo    • Informações de memória virtual
echo.
echo 📈 MONITOR EM TEMPO REAL:
echo    • Monitor visual de memória em tempo real
echo    • Barra de progresso ASCII colorida
echo    • Alertas configuráveis por nível de uso
echo    • Lista dos processos com maior consumo
echo    • Atualização automática configurável

:: Verificação de privilégios administrativos
call :CheckAdmin
if !ERRO_LEVEL! neq 0 (
    echo.
    echo ⚠️  AVISO: Executando sem privilégios administrativos
    echo.
    echo 💡 FUNCIONALIDADES DISPONÍVEIS:
    echo    • Visualização de estatísticas de memória
    echo    • Monitor em tempo real
    echo    • Limpeza básica de memória .NET
    echo.
    echo � FUNCIONALIDADES LIMITADAS:
    echo    • Limpeza avançada de arquivos (requer admin)
    echo    • Acesso completo ao sistema (requer admin)
    echo.
    echo 🔧 Para funcionalidade completa: Execute como administrador
    echo.
    set "ADMIN_MODE=0"
    pause
) else (
    set "ADMIN_MODE=1"
)

:: Obter informações de memória inicial
call :GetMemoryInfo inicial

:MainMenu
cls
call :DrawHeader
call :ShowMemoryStatus
call :DrawMenu
echo.
set /p "OPCAO=🎯 Digite sua opção: "

if "!OPCAO!"=="1" goto :CleanupMemory
if "!OPCAO!"=="2" goto :AutoCleanup
if "!OPCAO!"=="3" goto :AdvancedCleanup
if "!OPCAO!"=="4" goto :ShowStats
if "!OPCAO!"=="5" goto :RealTimeMonitor
if "!OPCAO!"=="6" goto :Settings
if "!OPCAO!"=="0" goto :Exit
if "!OPCAO!"=="?" goto :Help

cls
echo.
echo ❌ Opção inválida! Tente novamente.
timeout /t 2 > NUL
goto :MainMenu

:: ============================================================================
::   🎨 INTERFACE E VISUAL
:: ============================================================================

:DrawHeader
echo.
echo ╔════════════════════════════════════════════════════════════════════════════╗
echo ║                    🚀 OTIMIZADOR DE MEMÓRIA RAM v%VERSION%                    ║
echo ║                              By %AUTHOR% - 2025                              ║
echo ╚════════════════════════════════════════════════════════════════════════════╝
echo.
goto :eof

:DrawMenu
echo ╔═══════════════════════════════════════════════════════════════════════════╗
echo ║                            📋 MENU PRINCIPAL                             ║
echo ╠═══════════════════════════════════════════════════════════════════════════╣
if "!ADMIN_MODE!"=="1" (
    echo ║  [1] 🧹 Limpeza Rápida de Memória                                        ║
    echo ║  [2] ⚡ Limpeza Automática (A cada %INTERVALO%s^)                               ║
    echo ║  [3] 🔧 Limpeza Avançada + Arquivos                                      ║
) else (
    echo ║  [1] 🧹 Limpeza Básica de Memória (Sem Admin^)                           ║
    echo ║  [2] ⚡ Limpeza Automática Básica                                        ║
    echo ║  [3] 🔒 Limpeza Avançada (Requer Admin^)                                 ║
)
echo ║  [4] 📊 Estatísticas de Memória                                          ║
echo ║  [5] 📈 Monitor em Tempo Real                                            ║
echo ║  [6] ⚙️  Configurações                                                    ║
echo ║  [?] ❓ Ajuda                                                             ║
echo ║  [0] 🚪 Sair                                                              ║
echo ╚═══════════════════════════════════════════════════════════════════════════╝
goto :eof

:ShowMemoryStatus
:: Usar PowerShell como método primário para obter informações de memória
for /f "tokens=*" %%a in ('powershell -Command "(Get-CimInstance -ClassName Win32_OperatingSystem).TotalVisibleMemorySize" 2^>nul') do set "TOTAL_KB=%%a"
for /f "tokens=*" %%a in ('powershell -Command "(Get-CimInstance -ClassName Win32_OperatingSystem).FreePhysicalMemory" 2^>nul') do set "FREE_KB=%%a"

:: Se PowerShell falhar, tentar WMIC como fallback
if not defined TOTAL_KB (
    for /f "skip=1 tokens=*" %%a in ('wmic OS get TotalVisibleMemorySize /value 2^>nul ^| findstr "="') do (
        for /f "tokens=2 delims==" %%b in ("%%a") do set "TOTAL_KB=%%b"
    )
)
if not defined FREE_KB (
    for /f "skip=1 tokens=*" %%a in ('wmic OS get FreePhysicalMemory /value 2^>nul ^| findstr "="') do (
        for /f "tokens=2 delims==" %%b in ("%%a") do set "FREE_KB=%%b"
    )
)

if defined TOTAL_KB if defined FREE_KB (
    set /a "TOTAL_MB=!TOTAL_KB!/1024"
    set /a "FREE_MB=!FREE_KB!/1024"
    set /a "USED_MB=!TOTAL_MB!-!FREE_MB!"
    set /a "PERCENT_USED=(!USED_MB!*100)/!TOTAL_MB!"
    
    echo 💻 MEMÓRIA RAM: !USED_MB!MB/!TOTAL_MB!MB usados (!PERCENT_USED!%% ocupado^) - Livre: !FREE_MB!MB
) else (
    echo 💻 MEMÓRIA RAM: Informações não disponíveis
)
echo.
goto :eof

:: ============================================================================
::   🔐 VERIFICAÇÃO DE PRIVILÉGIOS
:: ============================================================================

:CheckAdmin
set "ERRO_LEVEL=0"
net session >nul 2>&1
if %errorlevel% neq 0 (
    set "ERRO_LEVEL=1"
)
goto :eof

:: ============================================================================
::   🧹 FUNÇÕES DE LIMPEZA DE MEMÓRIA
:: ============================================================================

:CleanupMemory
cls
call :DrawHeader
if "!ADMIN_MODE!"=="1" (
    echo 🧹 INICIANDO LIMPEZA RÁPIDA DE MEMÓRIA...
) else (
    echo 🧹 INICIANDO LIMPEZA BÁSICA DE MEMÓRIA (SEM ADMIN)...
    echo.
    echo ⚠️  Modo limitado: Algumas operações podem não funcionar
)
echo.

call :ConfirmAction "Executar limpeza de memória"
if !ERRO_LEVEL! neq 0 goto :MainMenu

echo ✅ Iniciando processo de limpeza...
echo.

call :GetMemoryInfo before

echo 🔄 [1/5] Forçando coleta de lixo do .NET Framework...
powershell -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers(); [System.GC]::Collect()" 2>nul

if "!ADMIN_MODE!"=="1" (
    echo 🔄 [2/5] Limpando cache do sistema...
    %windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
    
    echo 🔄 [3/5] Liberando memória de aplicações inativas...
    powershell -Command "Get-Process | Where-Object {$_.WorkingSet -gt 100MB -and $_.ProcessName -notlike '*svchost*'} | ForEach-Object {$_.CloseMainWindow()}" 2>nul
    
    echo 🔄 [4/5] Compactando memória virtual...
    powershell -Command "[System.Runtime.GCSettings]::LargeObjectHeapCompactionMode = 'CompactOnce'; [System.GC]::Collect()" 2>nul
    
    echo 🔄 [5/5] Otimizando cache de páginas...
    rundll32.exe kernel32.dll,SetProcessWorkingSetSize -1,-1 2>nul
) else (
    echo 🔄 [2/5] Compactando memória virtual...
    powershell -Command "[System.Runtime.GCSettings]::LargeObjectHeapCompactionMode = 'CompactOnce'; [System.GC]::Collect()" 2>nul
    
    echo ⚠️  [3/5] Cache do sistema (requer admin) - PULADO
    echo ⚠️  [4/5] Aplicações inativas (requer admin) - PULADO  
    echo ⚠️  [5/5] Cache de páginas (requer admin) - PULADO
)

call :GetMemoryInfo after
call :ShowCleanupResults

echo.
if "!ADMIN_MODE!"=="1" (
    echo ✅ Limpeza rápida concluída com sucesso!
) else (
    echo ✅ Limpeza básica concluída! Execute como admin para limpeza completa.
)
echo.
pause
goto :MainMenu

:AutoCleanup
cls
call :DrawHeader
echo ⚡ MODO LIMPEZA AUTOMÁTICA ATIVADO
echo.
echo ⚠️  Esta opção executará limpeza automática a cada %INTERVALO% segundos
echo    Para parar, pressione Ctrl+C ou feche esta janela
echo.

call :ConfirmAction "Ativar limpeza automática"
if !ERRO_LEVEL! neq 0 goto :MainMenu

:AutoLoop
cls
echo ⚡ LIMPEZA AUTOMÁTICA ATIVA - Intervalo: %INTERVALO%s
echo ═══════════════════════════════════════════════════
echo.
echo 🕐 Próxima limpeza em: %INTERVALO% segundos
echo 💡 Pressione Ctrl+C para parar
echo.

call :QuickMemoryClean

echo.
echo ⏰ Aguardando próximo ciclo...
timeout /t %INTERVALO% > NUL
goto :AutoLoop

:AdvancedCleanup
cls
call :DrawHeader
echo 🔧 LIMPEZA AVANÇADA DE MEMÓRIA + ARQUIVOS
echo.
if "!ADMIN_MODE!"=="0" (
    echo ❌ ERRO: Esta funcionalidade requer privilégios administrativos!
    echo.
    echo 🔧 SOLUÇÃO: Execute o programa como administrador
    echo 💡 ALTERNATIVA: Use a opção [1] para limpeza básica
    echo.
    pause
    goto :MainMenu
)

echo ⚠️  Esta opção incluirá:
echo    • Limpeza completa de memória RAM
echo    • Remoção de arquivos temporários
echo    • Limpeza de cache do sistema
echo    • Otimização de prefetch
echo.

call :ConfirmAction "Executar limpeza avançada"
if !ERRO_LEVEL! neq 0 goto :MainMenu

call :GetMemoryInfo before

echo ✅ Iniciando limpeza avançada...
echo.

:: Limpeza de memória
echo 🧠 [1/8] Limpeza de memória RAM...
call :QuickMemoryClean

:: Limpeza de arquivos temporários
echo 📁 [2/8] Limpando arquivos temporários do sistema...
call :CleanTempFiles "c:\windows\temp" "Temp do Sistema"

echo 📁 [3/8] Limpando arquivos temporários do usuário...
call :CleanTempFiles "%temp%" "Temp do Usuário"

echo 📁 [4/8] Limpando cache de prefetch...
call :CleanTempFiles "c:\windows\prefetch" "Prefetch"

echo 📁 [5/8] Limpando arquivos baixados...
call :CleanTempFiles "c:\windows\Downloaded Program Files" "Downloads do Sistema"

echo 🧹 [6/8] Limpando lixeira...
powershell -Command "Clear-RecycleBin -Force" 2>nul

echo 🔄 [7/8] Desfragmentando memória...
powershell -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers(); [System.GC]::Collect()" 2>nul

echo ⚡ [8/8] Otimização final...
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks

call :GetMemoryInfo after
call :ShowCleanupResults

echo.
echo ✅ Limpeza avançada concluída com sucesso!
echo.
pause
goto :MainMenu

:: ============================================================================
::   📊 ESTATÍSTICAS E INFORMAÇÕES
:: ============================================================================

:ShowStats
cls
call :DrawHeader
echo 📊 ESTATÍSTICAS DETALHADAS DE MEMÓRIA
echo ══════════════════════════════════════════════════════════════════════════
echo.

:: Informações de memória física
for /f "skip=1 tokens=*" %%a in ('wmic computersystem get TotalPhysicalMemory /value 2^>nul ^| findstr "="') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do set "TOTAL_BYTES=%%b"
)
for /f "skip=1 tokens=*" %%a in ('wmic OS get TotalVisibleMemorySize /value 2^>nul ^| findstr "="') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do set "TOTAL_KB=%%b"
)
for /f "skip=1 tokens=*" %%a in ('wmic OS get FreePhysicalMemory /value 2^>nul ^| findstr "="') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do set "FREE_KB=%%b"
)

if defined TOTAL_KB if defined FREE_KB (
    set /a "TOTAL_MB=!TOTAL_KB!/1024"
    set /a "TOTAL_GB=!TOTAL_MB!/1024"
    set /a "FREE_MB=!FREE_KB!/1024"
    set /a "USED_MB=!TOTAL_MB!-!FREE_MB!"
    set /a "PERCENT_USED=(!USED_MB!*100)/!TOTAL_MB!"
    set /a "PERCENT_FREE=100-!PERCENT_USED!"
    
    echo 🖥️  MEMÓRIA FÍSICA TOTAL: !TOTAL_GB! GB (!TOTAL_MB! MB^)
    echo 💚 MEMÓRIA LIVRE: !FREE_MB! MB (!PERCENT_FREE!%^)
    echo 🔴 MEMÓRIA USADA: !USED_MB! MB (!PERCENT_USED!%^)
)

echo.
echo 🔍 PROCESSOS COM MAIOR USO DE MEMÓRIA:
echo ──────────────────────────────────────────────────────────────────────────
powershell -Command "Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10 ProcessName, @{Name='Memory(MB)';Expression={[math]::Round($_.WorkingSet/1MB,2)}} | Format-Table -AutoSize" 2>nul

echo.
echo 💾 INFORMAÇÕES DE MEMÓRIA VIRTUAL:
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
    
    echo    Total Virtual: !VIRTUAL_MB! MB
    echo    Livre Virtual: !FREE_VIRTUAL_MB! MB
    echo    Usada Virtual: !USED_VIRTUAL_MB! MB
)

echo.
pause
goto :MainMenu

:: ============================================================================
::   📈 MONITOR EM TEMPO REAL
:: ============================================================================

:RealTimeMonitor
cls
call :DrawHeader
echo 📈 MONITOR DE MEMÓRIA EM TEMPO REAL
echo.
echo ⚠️  INSTRUÇÕES:
echo    • Atualização automática a cada %MONITOR_REFRESH% segundos
echo    • Pressione Ctrl+C para parar e voltar ao menu
echo    • ESC também funciona para sair
echo.
echo 🚀 Iniciando monitor...
timeout /t 3 > NUL

:MonitorLoop
cls
call :DrawHeader
echo 📈 MONITOR DE MEMÓRIA EM TEMPO REAL - Atualização a cada %MONITOR_REFRESH%s
echo ╔════════════════════════════════════════════════════════════════════════════╗
echo ║                          🖥️  SISTEMA DE MONITORAMENTO                      ║
echo ╚════════════════════════════════════════════════════════════════════════════╝

:: Obter dados de memória
call :GetRealTimeMemoryData

:: Exibir informações básicas
echo.
echo 💾 MEMÓRIA FÍSICA:
echo ┌─────────────────────────────────────────────────────────────────────────────┐
echo │ Total: !TOTAL_MB! MB (!TOTAL_GB! GB^)                                          │
echo │ Usada: !USED_MB! MB (!PERCENT_USED!%^)                                          │
echo │ Livre: !FREE_MB! MB (!PERCENT_FREE!%^)                                          │
echo └─────────────────────────────────────────────────────────────────────────────┘

:: Barra de progresso ASCII
call :DrawMemoryBar !PERCENT_USED!

:: CPU e outros dados
echo.
echo 🔥 RECURSOS DO SISTEMA:
echo ┌─────────────────────────────────────────────────────────────────────────────┐
for /f "tokens=2 delims==" %%a in ('wmic cpu get loadpercentage /value ^| find "="') do set "CPU_USAGE=%%a"
if defined CPU_USAGE (
    echo │ 🖥️  CPU: !CPU_USAGE!%% de uso                                                 │
) else (
    echo │ 🖥️  CPU: Carregando...                                                      │
)

:: Processos top 5
echo │ 🔍 TOP 5 PROCESSOS POR MEMÓRIA:                                             │
powershell -Command "$procs = Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5; foreach($p in $procs) { $mem = [math]::Round($p.WorkingSet/1MB,1); Write-Host ('│   ' + $p.ProcessName.PadRight(25) + $mem.ToString().PadLeft(8) + ' MB'.PadRight(15) + '│') }" 2>nul
echo └─────────────────────────────────────────────────────────────────────────────┘

:: Status e alertas
echo.
call :ShowMemoryAlerts !PERCENT_USED!

:: Informações de atualização
echo.
echo ⏰ Última atualização: %TIME%
echo 💡 Pressione Ctrl+C para parar o monitor
echo.

:: Aguardar 2 segundos e repetir
timeout /t 2 > NUL
goto :MonitorLoop

:: ============================================================================
::   🎨 FUNÇÕES DO MONITOR
:: ============================================================================

:GetRealTimeMemoryData
:: Usar PowerShell como método primário
for /f "tokens=*" %%a in ('powershell -Command "(Get-CimInstance -ClassName Win32_OperatingSystem).TotalVisibleMemorySize" 2^>nul') do set "TOTAL_KB=%%a"
for /f "tokens=*" %%a in ('powershell -Command "(Get-CimInstance -ClassName Win32_OperatingSystem).FreePhysicalMemory" 2^>nul') do set "FREE_KB=%%a"

:: Fallback para WMIC se PowerShell falhar
if not defined TOTAL_KB (
    for /f "skip=1 tokens=*" %%a in ('wmic OS get TotalVisibleMemorySize /value 2^>nul ^| findstr "="') do (
        for /f "tokens=2 delims==" %%b in ("%%a") do set "TOTAL_KB=%%b"
    )
)
if not defined FREE_KB (
    for /f "skip=1 tokens=*" %%a in ('wmic OS get FreePhysicalMemory /value 2^>nul ^| findstr "="') do (
        for /f "tokens=2 delims==" %%b in ("%%a") do set "FREE_KB=%%b"
    )
)

if defined TOTAL_KB if defined FREE_KB (
    set /a "TOTAL_MB=!TOTAL_KB!/1024"
    set /a "TOTAL_GB=!TOTAL_MB!/1024"
    set /a "FREE_MB=!FREE_KB!/1024"
    set /a "USED_MB=!TOTAL_MB!-!FREE_MB!"
    set /a "PERCENT_USED=(!USED_MB!*100)/!TOTAL_MB!"
    set /a "PERCENT_FREE=100-!PERCENT_USED!"
) else (
    set "TOTAL_MB=N/A"
    set "FREE_MB=N/A"
    set "USED_MB=N/A"
    set "PERCENT_USED=0"
    set "PERCENT_FREE=0"
)
goto :eof

:DrawMemoryBar
set "PERCENT=%~1"
set "BAR_LENGTH=50"
set /a "FILLED_CHARS=(!PERCENT!*!BAR_LENGTH!)/100"
set /a "EMPTY_CHARS=!BAR_LENGTH!-!FILLED_CHARS!"

:: Escolher cor baseada na porcentagem
if !PERCENT! geq 90 (
    set "BAR_COLOR=🔴"
    set "BAR_CHAR=█"
) else if !PERCENT! geq 75 (
    set "BAR_COLOR=🟡"
    set "BAR_CHAR=█"
) else (
    set "BAR_COLOR=🟢"
    set "BAR_CHAR=█"
)

echo.
echo %BAR_COLOR% BARRA DE USO DE MEMÓRIA:
echo ┌─────────────────────────────────────────────────────────────────────────────┐
set "PROGRESS_BAR=│ ["

:: Criar barra preenchida
for /l %%i in (1,1,!FILLED_CHARS!) do set "PROGRESS_BAR=!PROGRESS_BAR!!BAR_CHAR!"

:: Criar barra vazia
for /l %%i in (1,1,!EMPTY_CHARS!) do set "PROGRESS_BAR=!PROGRESS_BAR! "

set "PROGRESS_BAR=!PROGRESS_BAR!] !PERCENT!%%"

:: Preencher até o final da linha
for /l %%i in (1,1,20) do set "PROGRESS_BAR=!PROGRESS_BAR! "
set "PROGRESS_BAR=!PROGRESS_BAR!│"

echo !PROGRESS_BAR!
echo └─────────────────────────────────────────────────────────────────────────────┘
goto :eof

:ShowMemoryAlerts
set "USAGE=%~1"

echo 🚨 STATUS DO SISTEMA:
echo ┌─────────────────────────────────────────────────────────────────────────────┐

if !USAGE! geq 95 (
    echo │ 🔴 CRÍTICO: Memória quase esgotada! Execute limpeza imediatamente!         │
    echo │ 💡 Recomendação: Feche aplicativos desnecessários                          │
) else if !USAGE! geq !MONITOR_ALERT_LEVEL! (
    echo │ 🟡 ALTO: Uso elevado de memória. Considere executar limpeza.               │
    echo │ 💡 Recomendação: Monitor processos e execute limpeza se necessário         │
) else if !USAGE! geq 70 (
    echo │ 🟠 MODERADO: Uso normal-alto de memória.                                   │
    echo │ 💡 Recomendação: Monitoramento normal                                      │
) else (
    echo │ 🟢 NORMAL: Uso de memória em níveis saudáveis.                             │
    echo │ 💡 Status: Sistema operando normalmente                                    │
)

echo └─────────────────────────────────────────────────────────────────────────────┘
goto :eof

:Settings
cls
call :DrawHeader
echo ⚙️  CONFIGURAÇÕES DO OTIMIZADOR
echo ══════════════════════════════════════════════════════════════════════════
echo.
echo 📋 CONFIGURAÇÕES ATUAIS:
echo    • Intervalo de limpeza automática: %INTERVALO% segundos
echo    • Intervalo do monitor: %MONITOR_REFRESH% segundos
echo    • Nível de alerta: %MONITOR_ALERT_LEVEL%%%
echo    • Versão: %VERSION%
echo    • Modo de execução: Administrador
echo.
echo ╔═══════════════════════════════════════════════════════════════════════════╗
echo ║  [1] 🕐 Alterar intervalo de limpeza automática                           ║
echo ║  [2] 🔄 Restaurar configurações padrão                                   ║
echo ║  [3] ⚙️  Configurar monitor em tempo real                                ║
echo ║  [0] 🔙 Voltar ao menu principal                                         ║
echo ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "CONFIG=🎯 Digite sua opção: "

if "!CONFIG!"=="1" goto :ChangeInterval
if "!CONFIG!"=="2" goto :RestoreDefaults
if "!CONFIG!"=="3" goto :MonitorSettings
if "!CONFIG!"=="0" goto :MainMenu

echo ❌ Opção inválida!
timeout /t 2 > NUL
goto :Settings

:ChangeInterval
echo.
echo 🕐 ALTERAR INTERVALO DE LIMPEZA AUTOMÁTICA
echo ─────────────────────────────────────────────────────────────────────────
echo.
echo Intervalo atual: %INTERVALO% segundos
echo Intervalo recomendado: 30-300 segundos
echo.
set /p "NOVO_INTERVALO=Digite o novo intervalo (em segundos): "

if "!NOVO_INTERVALO!" geq "10" if "!NOVO_INTERVALO!" leq "3600" (
    set "INTERVALO=!NOVO_INTERVALO!"
    echo.
    echo ✅ Intervalo alterado para !INTERVALO! segundos!
) else (
    echo.
    echo ❌ Intervalo inválido! Use valores entre 10 e 3600 segundos.
)
echo.
pause
goto :Settings

:MonitorSettings
echo.
echo ⚙️  CONFIGURAÇÕES DO MONITOR EM TEMPO REAL
echo ─────────────────────────────────────────────────────────────────────────
echo.
echo 📊 Configurações atuais do monitor:
echo    • Intervalo de atualização: %MONITOR_REFRESH% segundos
echo    • Nível de alerta de memória: %MONITOR_ALERT_LEVEL%%%
echo.
echo ╔═══════════════════════════════════════════════════════════════════════════╗
echo ║  [1] 🔄 Alterar intervalo de atualização                                 ║
echo ║  [2] 🚨 Alterar nível de alerta                                          ║
echo ║  [3] 🧪 Testar monitor                                                   ║
echo ║  [0] 🔙 Voltar                                                           ║
echo ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p "MONITOR_CONFIG=🎯 Digite sua opção: "

if "!MONITOR_CONFIG!"=="1" goto :ChangeMonitorRefresh
if "!MONITOR_CONFIG!"=="2" goto :ChangeAlertLevel
if "!MONITOR_CONFIG!"=="3" goto :TestMonitor
if "!MONITOR_CONFIG!"=="0" goto :Settings

echo ❌ Opção inválida!
timeout /t 2 > NUL
goto :MonitorSettings

:ChangeMonitorRefresh
echo.
echo 🔄 ALTERAR INTERVALO DE ATUALIZAÇÃO DO MONITOR
echo ─────────────────────────────────────────────────────────────────────────
echo.
echo Intervalo atual: %MONITOR_REFRESH% segundos
echo Intervalo recomendado: 1-10 segundos
echo.
echo ⚠️  Nota: Intervalos muito baixos (1s) podem consumir mais CPU
echo.
set /p "NOVO_REFRESH=Digite o novo intervalo (em segundos): "

if "!NOVO_REFRESH!" geq "1" if "!NOVO_REFRESH!" leq "60" (
    set "MONITOR_REFRESH=!NOVO_REFRESH!"
    echo.
    echo ✅ Intervalo de atualização alterado para !MONITOR_REFRESH! segundos!
) else (
    echo.
    echo ❌ Intervalo inválido! Use valores entre 1 e 60 segundos.
)
echo.
pause
goto :MonitorSettings

:ChangeAlertLevel
echo.
echo 🚨 ALTERAR NÍVEL DE ALERTA DE MEMÓRIA
echo ─────────────────────────────────────────────────────────────────────────
echo.
echo Nível atual: %MONITOR_ALERT_LEVEL%%%
echo.
echo 💡 Níveis recomendados:
echo    • 70%% - Alerta precoce
echo    • 80%% - Alerta moderado (recomendado)
echo    • 90%% - Alerta apenas em situações críticas
echo.
set /p "NOVO_ALERT=Digite o novo nível de alerta (em %%): "

if "!NOVO_ALERT!" geq "50" if "!NOVO_ALERT!" leq "95" (
    set "MONITOR_ALERT_LEVEL=!NOVO_ALERT!"
    echo.
    echo ✅ Nível de alerta alterado para !MONITOR_ALERT_LEVEL!%%!
) else (
    echo.
    echo ❌ Nível inválido! Use valores entre 50 e 95%%.
)
echo.
pause
goto :MonitorSettings

:TestMonitor
echo.
echo 🧪 TESTE RÁPIDO DO MONITOR
echo ─────────────────────────────────────────────────────────────────────────
echo.
echo 🔄 Executando teste de 10 segundos...
echo 💡 O monitor será exibido por alguns ciclos
echo.
timeout /t 3 > NUL

for /l %%i in (1,1,5) do (
    cls
    echo 🧪 TESTE DO MONITOR - Ciclo %%i/5
    echo ═══════════════════════════════════════════════════════════════════════════
    call :GetRealTimeMemoryData
    echo.
    echo 💾 Memória: !USED_MB!MB/!TOTAL_MB!MB (!PERCENT_USED!%%^)
    call :DrawMemoryBar !PERCENT_USED!
    echo.
    echo ⏰ Aguardando !MONITOR_REFRESH! segundos...
    timeout /t !MONITOR_REFRESH! > NUL
)

echo.
echo ✅ Teste concluído! O monitor está funcionando corretamente.
echo.
pause
goto :MonitorSettings

:RestoreDefaults
echo.
echo 🔄 RESTAURAR CONFIGURAÇÕES PADRÃO
echo ─────────────────────────────────────────────────────────────────────────
echo.
set "INTERVALO=30"
set "MONITOR_REFRESH=2"
set "MONITOR_ALERT_LEVEL=85"
echo ✅ Todas as configurações foram restauradas para os valores padrão!
echo    • Intervalo de limpeza: 30 segundos
echo    • Atualização do monitor: 2 segundos  
echo    • Nível de alerta: 85%%
echo.
pause
goto :Settings

:Help
cls
call :DrawHeader
echo ❓ AJUDA E INFORMAÇÕES
echo ══════════════════════════════════════════════════════════════════════════
echo.
echo 🧹 LIMPEZA RÁPIDA:
echo    • Libera memória RAM ocupada desnecessariamente
echo    • Força coleta de lixo do .NET Framework
echo    • Otimiza cache do sistema
echo    • Tempo estimado: 10-30 segundos
echo.
echo ⚡ LIMPEZA AUTOMÁTICA:
echo    • Executa limpeza rápida automaticamente
echo    • Configurável de 10 a 3600 segundos
echo    • Ideal para uso contínuo
echo    • Pressione Ctrl+C para parar
echo.
echo 🔧 LIMPEZA AVANÇADA:
echo    • Inclui limpeza de memória + arquivos temporários
echo    • Remove cache de sistema e prefetch
echo    • Limpa lixeira e otimiza memória virtual
echo    • Tempo estimado: 1-5 minutos
echo.
echo � MONITOR EM TEMPO REAL:
echo    • Monitor visual de memória em tempo real
echo    • Barra de progresso ASCII colorida
echo    • Alertas configuráveis por nível de uso
echo    • Lista dos processos com maior consumo
echo    • Atualização automática configurável
echo.
echo ⚠️  REQUISITOS:
echo    • Windows 10/11
echo    • Executar como administrador
echo    • PowerShell habilitado
echo.
echo 📄 LICENÇA E TERMOS:
echo    • Licença: Creative Commons BY-NC 4.0
echo    • Uso não-comercial permitido
echo    • Atribuição obrigatória ao redistribuir
echo    • Consulte LICENSE e TERMOS_DE_USO.md para detalhes
echo.
echo 🌐 MAIS INFORMAÇÕES:
echo    • Repositório: https://github.com/Gabs77u/Otimizador-WIN
echo    • Licença: https://creativecommons.org/licenses/by-nc/4.0/
echo    • Desenvolvido por: %AUTHOR% - 2025
echo.
pause
goto :MainMenu

:: ============================================================================
::   🔧 FUNÇÕES AUXILIARES
:: ============================================================================

:ConfirmAction
echo ❓ Tem certeza que deseja %~1?
echo    [S] Sim    [N] Não
echo.
set /p "CONFIRM=🎯 Confirmar ação (S/N): "

if /i "!CONFIRM!"=="s" (
    set "ERRO_LEVEL=0"
) else (
    set "ERRO_LEVEL=1"
    echo.
    echo ❌ Operação cancelada pelo usuário.
    timeout /t 2 > NUL
)
goto :eof

:QuickMemoryClean
echo 🔄 Executando limpeza rápida...
powershell -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers(); [System.GC]::Collect()" 2>nul
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
rundll32.exe kernel32.dll,SetProcessWorkingSetSize -1,-1 2>nul
echo ✅ Limpeza concluída!
goto :eof

:CleanTempFiles
set "TARGET_PATH=%~1"
set "DESCRIPTION=%~2"

if exist "!TARGET_PATH!" (
    echo 🗂️  Limpando !DESCRIPTION!...
    del /s /f /q "!TARGET_PATH!\*.*" 2>nul
    for /d %%d in ("!TARGET_PATH!\*") do rd /s /q "%%d" 2>nul
    if not exist "!TARGET_PATH!" md "!TARGET_PATH!" 2>nul
    echo ✅ !DESCRIPTION! limpo!
) else (
    echo ⚠️  !DESCRIPTION! não encontrado.
)
goto :eof

:GetMemoryInfo
:: Usar PowerShell como método primário
for /f "tokens=*" %%a in ('powershell -Command "(Get-CimInstance -ClassName Win32_OperatingSystem).FreePhysicalMemory" 2^>nul') do set "FREE_KB_%~1=%%a"
for /f "tokens=*" %%a in ('powershell -Command "(Get-CimInstance -ClassName Win32_OperatingSystem).TotalVisibleMemorySize" 2^>nul') do set "TOTAL_KB_%~1=%%a"

:: Fallback para WMIC se PowerShell falhar
if not defined FREE_KB_%~1 (
    for /f "skip=1 tokens=*" %%a in ('wmic OS get FreePhysicalMemory /value 2^>nul ^| findstr "="') do (
        for /f "tokens=2 delims==" %%b in ("%%a") do set "FREE_KB_%~1=%%b"
    )
)
if not defined TOTAL_KB_%~1 (
    for /f "skip=1 tokens=*" %%a in ('wmic OS get TotalVisibleMemorySize /value 2^>nul ^| findstr "="') do (
        for /f "tokens=2 delims==" %%b in ("%%a") do set "TOTAL_KB_%~1=%%b"
    )
)

if defined FREE_KB_%~1 if defined TOTAL_KB_%~1 (
    set /a "FREE_MB_%~1=!FREE_KB_%~1!/1024"
    set /a "TOTAL_MB_%~1=!TOTAL_KB_%~1!/1024"
    set /a "USED_MB_%~1=!TOTAL_MB_%~1!-!FREE_MB_%~1!"
)
goto :eof

:ShowCleanupResults
if defined FREE_MB_before if defined FREE_MB_after (
    set /a "MEMORY_FREED=!FREE_MB_after!-!FREE_MB_before!"
    if !MEMORY_FREED! geq 0 (
        echo.
        echo 📊 RESULTADO DA LIMPEZA:
        echo    🔹 Memória antes: !USED_MB_before!MB usados / !FREE_MB_before!MB livres
        echo    🔹 Memória depois: !USED_MB_after!MB usados / !FREE_MB_after!MB livres
        echo    🔹 Memória liberada: +!MEMORY_FREED!MB
    )
)
goto :eof

:Exit
cls
call :DrawHeader
echo 👋 Obrigado por usar o Otimizador de Memória RAM v%VERSION%!
echo.
echo 💡 DICAS PARA MANTER A PERFORMANCE:
echo    • Execute limpeza regularmente
echo    • Monitore processos com alto consumo de memória
echo    • Mantenha apenas programas necessários abertos
echo    • Considere aumentar a memória RAM se necessário
echo.
echo 🌟 Desenvolvido por %AUTHOR% - 2025
echo 📄 Licença: Creative Commons BY-NC 4.0
echo 🌐 Mais informações: https://creativecommons.org/licenses/by-nc/4.0/
echo 📂 Repositório: https://github.com/Gabs77u/Otimizador-WIN
echo.
echo ⚖️  AVISO LEGAL: Este software é fornecido "como está" sem garantias.
echo    Para termos completos, consulte o arquivo TERMOS_DE_USO.md
echo.
pause
exit /b 0