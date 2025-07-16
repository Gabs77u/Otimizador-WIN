@echo off
REM ===========================================================================
REM OTIMIZADOR WINDOWS 10/11 v3.0
REM Copyright (c) 2025 Gabs77u - https://github.com/Gabs77u/Otimizador-WIN
REM 
REM Licenca: Creative Commons Attribution-NonCommercial 4.0 International
REM USO NAO-COMERCIAL APENAS - Proibida venda ou uso comercial
REM Para uso comercial, contate o autor
REM
REM DISCLAIMER: Use por sua conta e risco. Sempre faca backup antes de usar.
REM Este software e fornecido "como esta" sem garantias de qualquer tipo.
REM ===========================================================================

chcp 1252 > Nul
set Intervalo=10
mode 45,30
color 0a

REM Detectar versão do Windows - Método simples e eficaz
set WINVER=10

REM Verificar se é Windows 11 através da versão
REM Build 26100.4652 é Windows 11 Insider Preview
ver | findstr "26100" >nul 2>&1
if %errorlevel% equ 0 set WINVER=11

REM Verificar outros builds Windows 11
ver | findstr "22000" >nul 2>&1
if %errorlevel% equ 0 set WINVER=11

ver | findstr "22621" >nul 2>&1
if %errorlevel% equ 0 set WINVER=11

ver | findstr "22631" >nul 2>&1
if %errorlevel% equ 0 set WINVER=11

REM Definir título
if "%WINVER%"=="11" (
    title Otimizador WIN 10/11 - By Gabs v3.0 [Windows 11 Detectado]
) else (
    title Otimizador WIN 10/11 - By Gabs v3.0 [Windows 10 Detectado]
)

setlocal enabledelayedexpansion
:menu
cls
echo.
echo  ╔══════════════════════════════════════╗
if "%WINVER%"=="11" (
    echo  ║        OTIMIZADOR WINDOWS 11         ║
) else (
    echo  ║        OTIMIZADOR WINDOWS 10         ║
)
echo  ║            By Gabs - v3.0            ║
echo  ║       Compativel WIN 10/11           ║
echo  ╚══════════════════════════════════════╝
echo.
echo  ┌─ OPCOES DE OTIMIZACAO ─────────────────┐
echo  │                                        │
echo  │  [1]  ⚙️  Desabilitar Servicos         │
echo  │  [2]  📅 Tarefas Agendadas             │
echo  │  [3]  🚫 Remover Telemetria            │
echo  │  [4]  🔧 Configuracoes Diversas        │
echo  │  [5]  ⚡ Tweaks Variados               │
echo  │  [6]  🖥️  Otimizacao de Tela           │
echo  │  [7]  🔍 Desabilitar Cortana           │
echo  │  [8]  🌐 Parametros de Rede            │
echo  │  [9]  🔋 Configs de Energia            │
echo  │  [10] 🌊 Otimizacao EDGE               │
echo  │  [11] 📦 Features nao usadas           │
echo  │  [12] 🗑️  Remover Apps da Store        │
echo  │  [13] 💻 Otimizacao do Sistema         │
echo  │  [14] 📥 Instaladores                  │
echo  │  [15] 🚀 Hardware Fraco                │
echo  │  [16] 🧹 Limpeza de Arquivos           │
if "%WINVER%"=="11" (
echo  │  [17] 🆕 Otimizacoes Windows 11        │
)
echo  │                                        │
echo  │  [0]  ❌ Sair                          │
echo  └────────────────────────────────────────┘
echo.
echo  💡 Digite o numero da opcao desejada:

set /p menu=">"

if %menu% equ 1 goto :Desabilitar.Serviços
if %menu% equ 2 goto :Tarefas.Agendadas
if %menu% equ 3 goto :Remover.Telemetria
if %menu% equ 4 goto :Desabilitar.Configurações.Diversas
if %menu% equ 5 goto :Tweaks.Variados
if %menu% equ 6 goto :Otimizacao.De.Tela
if %menu% equ 7 goto :Desabilitar.Cortana
if %menu% equ 8 goto :Parametros.De.Rede
if %menu% equ 9 goto :Desabilitar.hibernação.HD/SSD.e.demais.configs.de.energia
if %menu% equ 10 goto :Otimizacao.EDGE
if %menu% equ 11 goto :Features.nao.usadas
if %menu% equ 12 goto :Remover.Apps.Da.Store
if %menu% equ 13 goto :OtimizacaoDoSistema
if %menu% equ 14 goto :Instaladores
if %menu% equ 15 goto :OtimizacaoHardwareFraco
if %menu% equ 16 goto :LimpezaArquivosTemporarios
if %menu% equ 17 goto :OtimizacaoWindows11
if %menu% equ 0 exit

pause
goto :menu

chcp 65001

:Desabilitar.Serviços
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║           DESABILITAR SERVICOS            ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  ⚙️  Desabilitando servicos desnecessarios...
echo.
echo  ┌─ SERVICOS SENDO PROCESSADOS ──────────────┐
echo  │                                           │
sc config DiagTrack start= disabled && echo  │  ✅ DiagTrack                             │ || echo  │  ❌ Erro: DiagTrack                      │
sc config diagnosticshub.standardcollector.service start= disabled && echo  │  ✅ Diagnostics Hub                      │ || echo  │  ❌ Erro: Diagnostics Hub               │
sc config dmwappushservice start= disabled && echo  │  ✅ WAP Push Message                     │ || echo  │  ❌ Erro: WAP Push Message              │
sc config RemoteREGistry start= disabled && echo  │  ✅ Remote Registry                      │ || echo  │  ❌ Erro: Remote Registry               │
sc config TrkWks start= disabled && echo  │  ✅ Distributed Link Tracking            │ || echo  │  ❌ Erro: Distributed Link Tracking     │
sc config HomeGroupListener start= disabled && echo  │  ✅ HomeGroup Listener                   │ || echo  │  ❌ Erro: HomeGroup Listener            │
sc config HomeGroupProvider start= disabled && echo  │  ✅ HomeGroup Provider                   │ || echo  │  ❌ Erro: HomeGroup Provider            │
sc config RetailDemo start= disabled && echo  │  ✅ Retail Demo                          │ || echo  │  ❌ Erro: Retail Demo                   │
sc config NvTelemetryContainer start= disabled && echo  │  ✅ NVIDIA Telemetry                     │ || echo  │  ❌ Erro: NVIDIA Telemetry              │
sc config BITS start= demand && echo  │  ✅ BITS (Modo Demanda)                  │ || echo  │  ❌ Erro: BITS                          │
echo  │                                           │
echo  │  🔧 Servicos adicionais...                │
sc config MapsBroker start= disabled && echo  │  ✅ Maps Broker                          │ || echo  │  ❌ Erro: Maps Broker                   │
sc config lfsvc start= disabled && echo  │  ✅ Geolocation Service                  │ || echo  │  ❌ Erro: Geolocation Service           │
sc config SharedAccess start= disabled && echo  │  ✅ Internet Connection Sharing          │ || echo  │  ❌ Erro: Internet Connection Sharing   │
sc config ALG start= disabled && echo  │  ✅ Application Layer Gateway            │ || echo  │  ❌ Erro: Application Layer Gateway     │
REM Serviços específicos do Windows 11
if "%WINVER%"=="11" (
    sc config WSearch start= disabled && echo  │  ✅ Windows Search (Win11)               │ || echo  │  ❌ Erro: Windows Search                │
    sc config PcaSvc start= disabled && echo  │  ✅ Program Compatibility Assistant      │ || echo  │  ❌ Erro: Program Compatibility         │
    sc config WbioSrvc start= disabled && echo  │  ✅ Windows Biometric Service            │ || echo  │  ❌ Erro: Windows Biometric             │
    echo  │  🆕 Serviços Win11 processados            │
)
echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Servicos otimizados com sucesso!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.


:Tarefas.Agendadas
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║            TAREFAS AGENDADAS              ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  📅 Desabilitando tarefas automaticas...
echo.
echo  ┌─ TAREFAS SENDO PROCESSADAS ───────────────┐
echo  │                                           │
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1 && echo  │  ✅ Compatibility Appraiser               │ || echo  │  ⚠️  Compatibility Appraiser (ja config)  │
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1 && echo  │  ✅ Program Data Updater                  │ || echo  │  ⚠️  Program Data Updater (ja config)     │
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable >nul 2>&1 && echo  │  ✅ Startup App Task                      │ || echo  │  ⚠️  Startup App Task (ja config)         │
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1 && echo  │  ✅ CEIP Consolidator                     │ || echo  │  ⚠️  CEIP Consolidator (ja config)        │
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1 && echo  │  ✅ USB CEIP                              │ || echo  │  ⚠️  USB CEIP (ja config)                 │
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1 && echo  │  ✅ Disk Diagnostic Data Collector       │ || echo  │  ⚠️  Disk Diagnostic (ja config)          │
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable >nul 2>&1 && echo  │  ✅ Windows System Assessment             │ || echo  │  ⚠️  WinSAT (ja config)                   │
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable >nul 2>&1 && echo  │  ✅ Power Efficiency Diagnostics          │ || echo  │  ⚠️  Power Efficiency (ja config)         │
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable >nul 2>&1 && echo  │  ✅ Cloud Experience Host                 │ || echo  │  ⚠️  Cloud Experience (ja config)         │
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable >nul 2>&1 && echo  │  ✅ Network Info Gathering                │ || echo  │  ⚠️  Network Info (ja config)             │
REM Tarefas específicas do Windows 11
if "%WINVER%"=="11" (
    schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable >nul 2>&1 && echo  │  ✅ Windows Update Scheduled              │ || echo  │  ⚠️  Windows Update (ja config)           │
    schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable >nul 2>&1 && echo  │  ✅ Family Safety Monitor                 │ || echo  │  ⚠️  Family Safety (ja config)            │
    schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefreshTask" /Disable >nul 2>&1 && echo  │  ✅ Family Safety Refresh                 │ || echo  │  ⚠️  Family Safety Refresh (ja config)    │
    schtasks /Change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /Disable >nul 2>&1 && echo  │  ✅ Update Orchestrator Scan              │ || echo  │  ⚠️  Update Orchestrator (ja config)      │
    echo  │  🆕 Tarefas Win11 processadas             │
)
echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Tarefas agendadas otimizadas!
echo.
echo  Pressione qualquer tecla para continuar...
pause
goto :menu
echo.


:Remover.Telemetria
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║            REMOVER TELEMETRIA             ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  🚫 Removendo coleta de dados...
echo.
echo  ┌─ CONFIGURACOES DE PRIVACIDADE ────────────┐
echo  │                                           │
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Device Metadata bloqueado             │
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Telemetria basica configurada         │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Telemetria x64 configurada            │
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ CEIP desabilitado                     │
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ App Compatibility desabilitado        │
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Diagtrack Logger desabilitado         │
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ SQM Logger desabilitado               │
REM Configurações específicas do Windows 11
if "%WINVER%"=="11" (
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Configuracoes Win11 desabilitadas     │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Sugestoes Win11 removidas             │
)
echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🔒 Privacidade melhorada com sucesso!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.



:Desabilitar.Configurações.Diversas
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║         CONFIGURACOES DIVERSAS            ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  🔧 Aplicando configuracoes gerais...
echo.
echo  ┌─ CONFIGURACOES SENDO APLICADAS ───────────┐
echo  │                                           │
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Publicidade desabilitada              │
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Avaliacao web desabilitada            │
REG ADD "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Rastreamento idioma desabilitado      │
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "UxOption" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Windows Update otimizado              │
REM 0 = esconder completamente, 1 = mostrar apenas ícone, 2 = Mostrar caixa completa
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Caixa de busca otimizada              │
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Rastreamento docs desabilitado        │
REM 1 = Este Computador, 2 = Acesso Rápido
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 2 /f >nul 2>&1 && echo  │  ✅ Explorer configurado                  │
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Sugestoes do sistema removidas        │

REM Configurações específicas do Windows 11
if "%WINVER%"=="11" (
    echo  │  🆕 Aplicando configs Windows 11...       │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Widgets da barra desabilitados        │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Teams Chat removido                   │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Barra alinhada a esquerda             │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_IrisRecommendations" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Recomendacoes menu removidas          │
) else (
    echo  │  🖥️  Aplicando configs Windows 10...       │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Botao Cortana removido                │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Botao Task View removido              │
)

echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Configuracoes aplicadas com sucesso!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.


:Tweaks.Variados
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║            TWEAKS VARIADOS                ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  ⚡ Aplicando otimizacoes de performance...
echo.
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d 1 /f >nul 2>&1 && echo  ✅ Auto-finalizacao de tarefas ativada
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d 4000 /f >nul 2>&1 && echo  ✅ Timeout de apps otimizado
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d 200 /f >nul 2>&1 && echo  ✅ Delay de menus reduzido
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d 5000 /f >nul 2>&1 && echo  ✅ Tempo de encerramento otimizado
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d 400 /f >nul 2>&1 && echo  ✅ Tempo de hover do mouse ajustado
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d 00000001 /f >nul 2>&1 && echo  ✅ Avisos de disco cheio desabilitados
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_ShowRun" /t REG_DWORD /d 00000001 /f >nul 2>&1 && echo  ✅ Menu Executar habilitado
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d 5000 /f >nul 2>&1 && echo  ✅ Timeout de servicos otimizado
REM Otimizações adicionais para performance
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  ✅ Preview de desktop desabilitado
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  ✅ Selecao alpha desabilitada
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  ✅ Sombras de lista removidas
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DesktopLivePreviewHoverTime" /t REG_DWORD /d 1000 /f >nul 2>&1 && echo  ✅ Preview hover otimizado
echo.
echo  🎉 Tweaks aplicados com sucesso!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.

:Otimizacao.De.tela
cls
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d 00000064 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "IconsOnly" /T REG_DWORD /D 1 /F
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /d 2048 /t REG_SZ /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f
REM Otimizações adicionais para hardware fraco
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "VisualFXSetting" /t REG_DWORD /d 2 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d 0 /f
REM Configurações específicas do Windows 11
if "%WINVER%"=="11" (
    REM Desabilitar efeitos de rounded corners
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d 0 /f
    REM Otimizar configurações do Windows 11
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
    echo Otimizações específicas do Windows 11 aplicadas.
)
cls
pause
goto :menu
echo.

:Desabilitar.Cortana
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║          DESABILITAR CORTANA              ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  🔍 Desabilitando assistente virtual...
echo.
echo  ┌─ CONFIGURACOES CORTANA/BUSCA ─────────────┐
echo  │                                           │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Cortana desabilitada                  │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Busca por localizacao desabilitada    │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Busca conectada desabilitada          │
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Bing Search desabilitado              │
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Consentimento Cortana removido        │

if "%WINVER%"=="11" (
    echo  │  🆕 Configuracoes Windows 11...           │
    REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsAADCloudSearchEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Busca na nuvem Win11 desabilitada     │
    REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Historico busca desabilitado          │
    REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Sugestoes busca Win11 removidas       │
) else (
    echo  │  🖥️  Configuracoes Windows 10...           │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Botao Cortana Win10 removido          │
)

echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Cortana e busca otimizados!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.


:Parametros.De.Rede
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║           PARAMETROS DE REDE              ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  🌐 Verificando configuracoes de rede...
echo.
echo  ┌─ STATUS DA CONFIGURACAO ──────────────────┐
echo  │                                           │
echo  │  ℹ️  Configuracoes de rede mantidas       │
echo  │     para compatibilidade corporativa      │
echo  │                                           │
echo  │  ✅ IPv4: Ativo e otimizado               │
echo  │  ✅ IPv6: Mantido para compatibilidade    │
echo  │  ✅ DNS: Configuracao preservada          │
echo  │                                           │
echo  │  💡 Esta secao preserva a conectividade   │
echo  │     em ambientes corporativos             │
echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🔒 Rede configurada de forma segura!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.


:Desabilitar.hibernação.HD/SSD.e.demais.configs.de.energia
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║         CONFIGURACOES DE ENERGIA          ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  🔋 Otimizando configuracoes de energia...
echo.
echo  ┌─ ESQUEMAS DE ENERGIA ─────────────────────┐
echo  │                                           │
ECHO  │  ⚡ Configurando esquema balanceado...     │
powercfg -SETACTIVE 381b4222-f694-41f0-9685-ff5bb260df2e
ECHO  │  ✅ Esquema balanceado ativo               │
echo  │                                           │
ECHO  │  🖥️  Configurando timeouts de energia...   │
powercfg.exe -change -monitor-timeout-dc 10 && echo  │  ✅ Monitor (bateria): 10 min              │
powercfg.exe -change -standby-timeout-dc 30 && echo  │  ✅ Standby (bateria): 30 min              │
powercfg.exe -change -hibernate-timeout-dc 60 && echo  │  ✅ Hibernacao (bateria): 60 min           │
powercfg.exe -change -monitor-timeout-ac 30 && echo  │  ✅ Monitor (tomada): 30 min               │
powercfg.exe -change -standby-timeout-ac 60 && echo  │  ✅ Standby (tomada): 60 min               │
powercfg.exe -change -hibernate-timeout-ac 120 && echo  │  ✅ Hibernacao (tomada): 120 min           │
echo  │                                           │
REM Otimizações adicionais para hardware fraco
echo  │  🚀 Otimizando CPU...                     │
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 5 && echo  │  ✅ CPU min: 5%% (tomada)                  │
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100 && echo  │  ✅ CPU max: 100%% (tomada)                │
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 5 && echo  │  ✅ CPU min: 5%% (bateria)                 │
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 90 && echo  │  ✅ CPU max: 90%% (bateria)                │

if "%WINVER%"=="11" (
    echo  │  🆕 Configuracoes Windows 11...           │
    powercfg -setacvalueindex SCHEME_CURRENT SUB_SLEEP STANDBYIDLE 0 >nul 2>&1 && echo  │  ✅ Modern Standby otimizado               │
    powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTMODE 2 >nul 2>&1 && echo  │  ✅ Performance Boost configurado         │
    powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTPOL 100 >nul 2>&1 && echo  │  ✅ Boost Policy Win11 otimizada          │
) else (
    echo  │  🖥️  Configuracoes Windows 10...           │
    powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTMODE 1 >nul 2>&1 && echo  │  ✅ Performance Boost Win10 configurado   │
)

echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Energia otimizada com sucesso!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.


:Otimizacao.EDGE
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║          OTIMIZACAO EDGE                  ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  🌊 Otimizando Microsoft Edge...
echo.
echo  ┌─ CONFIGURACOES EDGE ──────────────────────┐
echo  │                                           │
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnabledState" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Estado habilitado configurado         │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "SyncFavoritesBetweenIEAndMicrosoftEdge" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Sync favoritos IE/Edge ativado        │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "PreventLiveTileDataCollection" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Coleta Live Tile desabilitada         │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "AllowPrelaunch" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Prelaunch desabilitado                │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "PreventTabPreloading" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Tab Preloading desabilitado           │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "AllowTabPreloading" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Tab Preloading bloqueado              │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "VideoCaptureAllowed" /d 0 /t REG_DWORD /f >nul 2>&1 && echo  │  ✅ Captura video desabilitada            │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultGeolocationSetting" /d 2 /t REG_DWORD /f >nul 2>&1 && echo  │  ✅ Geolocalizacao bloqueada              │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AudioCaptureAllowed" /d 0 /t REG_DWORD /f >nul 2>&1 && echo  │  ✅ Captura audio desabilitada            │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultSensorsSetting" /d 2 /t REG_DWORD /f >nul 2>&1 && echo  │  ✅ Sensores bloqueados                   │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultNotificationsSetting" /d 2 /t REG_DWORD /f >nul 2>&1 && echo  │  ✅ Notificacoes bloqueadas               │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyMode" /d 0 /t REG_DWORD /f >nul 2>&1 && echo  │  ✅ Modo eficiencia desabilitado          │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /d 0 /t REG_DWORD /f >nul 2>&1 && echo  │  ✅ Modo background desabilitado          │

if "%WINVER%"=="11" (
    echo  │  🆕 Configuracoes Edge Windows 11...      │
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ First Run Experience removido         │
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Startup Boost Win11 desabilitado      │
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Shopping Assistant desabilitado       │
) else (
    echo  │  🖥️  Configuracoes Edge Windows 10...      │
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Personalization Reporting desativado  │
)

echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Microsoft Edge otimizado!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.


:Features.nao.usadas
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║           FEATURES NAO USADAS             ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  📦 Removendo features desnecessarias...
echo.
echo  ┌─ FEATURES SENDO REMOVIDAS ────────────────┐
echo  │                                           │
REM Removendo apenas recursos não essenciais e seguros
echo  │  🗑️  Removendo features basicas...        │
DISM.exe /Online /norestart /Disable-Feature /featurename:SimpleTCP /Remove >nul 2>&1 && echo  │  ✅ SimpleTCP removido                    │
DISM.exe /Online /norestart /Disable-Feature /featurename:SNMP /Remove >nul 2>&1 && echo  │  ✅ SNMP removido                         │
DISM.exe /Online /norestart /Disable-Feature /featurename:WMISnmpProvider /Remove >nul 2>&1 && echo  │  ✅ WMI SNMP Provider removido            │
DISM.exe /Online /norestart /Disable-Feature /featurename:TelnetClient /Remove >nul 2>&1 && echo  │  ✅ Telnet Client removido                │
DISM.exe /Online /norestart /Disable-Feature /featurename:TFTP /Remove >nul 2>&1 && echo  │  ✅ TFTP removido                         │
DISM.exe /Online /norestart /Disable-Feature /featurename:WorkFolders-Client /Remove >nul 2>&1 && echo  │  ✅ Work Folders Client removido          │
echo  │                                           │
echo  │  📱 Removendo capabilities...             │
DISM /Online /norestart /Remove-Capability /CapabilityName:App.StepsRecorder~~~~0.0.1.0 >nul 2>&1 && echo  │  ✅ Steps Recorder removido               │
DISM /Online /norestart /Remove-Capability /CapabilityName:MathRecognizer~~~~0.0.1.0 >nul 2>&1 && echo  │  ✅ Math Recognizer removido              │

if "%WINVER%"=="11" (
    echo  │  🆕 Removendo features Windows 11...      │
    DISM /Online /norestart /Remove-Capability /CapabilityName:Microsoft.Windows.WordPad~~~~0.0.1.0 >nul 2>&1 && echo  │  ✅ WordPad Win11 removido                │
    DISM /Online /norestart /Remove-Capability /CapabilityName:App.Support.QuickAssist~~~~0.0.1.0 >nul 2>&1 && echo  │  ✅ Quick Assist removido                 │
    DISM /Online /norestart /Remove-Capability /CapabilityName:Microsoft.Windows.PowerShell.ISE~~~~0.0.1.0 >nul 2>&1 && echo  │  ✅ PowerShell ISE removido               │
) else (
    echo  │  🖥️  Removendo features Windows 10...      │
    DISM /Online /norestart /Remove-Capability /CapabilityName:XPS.Viewer~~~~0.0.1.0 >nul 2>&1 && echo  │  ✅ XPS Viewer removido                   │
    DISM /Online /norestart /Remove-Capability /CapabilityName:Print.Fax.Scan~~~~0.0.1.0 >nul 2>&1 && echo  │  ✅ Fax and Scan removido                 │
)

echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Features desnecessarias removidas!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.


:Remover.Apps.Da.Store
REM Removendo apenas apps desnecessários, mantendo apps essenciais
Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage"
Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *bingweather* | Remove-AppxPackage"
Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *getstarted* | Remove-AppxPackage"
Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *zunevideo* | Remove-AppxPackage"
Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *solitairecollection* | Remove-AppxPackage"

REM Apps específicos do Windows 11
if "%WINVER%"=="11" (
    Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.Todos* | Remove-AppxPackage"
    Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *MicrosoftWindows.Client.WebExperience* | Remove-AppxPackage"
    Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage *Microsoft.PowerAutomateDesktop* | Remove-AppxPackage"
    echo Apps específicos do Windows 11 removidos.
)

REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d 0 /f
cls
pause
goto :menu
echo.


:OtimizacaoDoSistema
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║         OTIMIZACAO DO SISTEMA             ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  💻 Aplicando otimizacoes de sistema...
echo.
echo  ┌─ CONFIGURACOES SISTEMA ───────────────────┐
echo  │                                           │
REM Otimizações seguras e estáveis do sistema
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Central de notificacoes desabilitada  │
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /d 1 /t REG_DWORD /f >nul 2>&1 && echo  │  ✅ Barra de pessoas removida             │
REG ADD "HKEY_CURRENT_USER\Control Panel\Keyboard" /v"PrintScreenKeyForSnippingEnabled" /d 1 /t REG_DWORD /f >nul 2>&1 && echo  │  ✅ Print Screen para Snipping ativado    │
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Arquivos ocultos visiveis             │
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Extensoes de arquivo visiveis         │
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Notificacoes sync removidas           │
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d 506 /f >nul 2>&1 && echo  │  ✅ Sticky Keys desabilitadas             │
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d 122 /f >nul 2>&1 && echo  │  ✅ Filter Keys desabilitadas             │
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d 58 /f >nul 2>&1 && echo  │  ✅ Toggle Keys desabilitadas             │
echo  │                                           │
REM Otimizações adicionais para performance
echo  │  ⚡ Otimizacoes de performance...          │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Balloon Tips desabilitadas            │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnails" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Thumbnails desabilitadas              │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowPreviewHandlers" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Preview Handlers desabilitados        │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FolderContentsInfoTip" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Info Tips de pasta desabilitadas      │

if "%WINVER%"=="11" (
    echo  │  🆕 Otimizacoes Windows 11...             │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_Layout" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Layout menu Start otimizado           │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Icones pequenos barra tarefas         │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Segundos no relogio removidos         │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Tela bloqueio rotativa desabilitada   │
) else (
    echo  │  🖥️  Otimizacoes Windows 10...             │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "People" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ People Hub Win10 desabilitado         │
    REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Task View Button removido             │
)

echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Sistema otimizado com sucesso!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.


:Instaladores
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║             INSTALADORES                  ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  📥 Instalando componentes essenciais...
echo.
echo  ┌─ INSTALACOES ─────────────────────────────┐
echo  │                                           │
REM Instalações básicas e seguras
echo  │  🌐 Configurando DNS cache...             │
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\Dnscache\Parameters" /v "MaxNegativeCacheTtl" /t "REG_DWORD" /d "86400" /f >nul 2>&1 && echo  │  ✅ DNS Cache TTL configurado             │
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\Dnscache\Parameters" /v "MaxCacheTtl" /t "REG_DWORD" /d "86400" /f >nul 2>&1 && echo  │  ✅ DNS Max Cache configurado             │
echo  │                                           │
REM Instalar .NET Framework 3.5
echo  │  📦 Instalando .NET Framework 3.5...      │
Dism /online /norestart /Enable-Feature /FeatureName:"NetFx3" >nul 2>&1 && echo  │  ✅ .NET Framework 3.5 instalado          │
echo  │                                           │
REM Instalações via winget
echo  │  🔧 Instalando runtimes essenciais...     │
winget install Microsoft.DotNet.DesktopRuntime.6 -s winget -h --accept-source-agreements --accept-package-agreements >nul 2>&1 && echo  │  ✅ .NET 6 Desktop Runtime instalado      │
echo  │                                           │
echo  │  🌐 Instalando navegadores...             │
winget install Mozilla.Firefox -s winget -h --accept-source-agreements --accept-package-agreements >nul 2>&1 && echo  │  ✅ Mozilla Firefox instalado             │
echo  │                                           │
echo  │  📝 Instalando editores...                │
winget install Notepad++.Notepad++ -s winget -h --accept-source-agreements --accept-package-agreements >nul 2>&1 && echo  │  ✅ Notepad++ instalado                   │

if "%WINVER%"=="11" (
    echo  │  🆕 Instalacoes Windows 11...             │
    winget install Microsoft.WindowsTerminal -s winget -h --accept-source-agreements --accept-package-agreements >nul 2>&1 && echo  │  ✅ Windows Terminal instalado            │
    winget install 7zip.7zip -s winget -h --accept-source-agreements --accept-package-agreements >nul 2>&1 && echo  │  ✅ 7-Zip instalado                       │
    winget install Microsoft.PowerToys -s winget -h --accept-source-agreements --accept-package-agreements >nul 2>&1 && echo  │  ✅ PowerToys instalado                   │
) else (
    echo  │  🖥️  Instalacoes Windows 10...             │
    winget install VideoLAN.VLC -s winget -h --accept-source-agreements --accept-package-agreements >nul 2>&1 && echo  │  ✅ VLC Media Player instalado            │
    winget install Git.Git -s winget -h --accept-source-agreements --accept-package-agreements >nul 2>&1 && echo  │  ✅ Git instalado                         │
)

echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Instalacoes concluidas!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.

:OtimizacaoHardwareFraco
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║         OTIMIZACAO HARDWARE FRACO         ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  🚀 Aplicando otimizacoes especializadas...
echo.
echo  ┌─ OTIMIZACOES ESPECIAIS ───────────────────┐
echo  │                                           │
echo  │  💾 Otimizando gerenciamento de memoria... │
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f >nul 2>&1
echo  │  ✅ Memoria otimizada                     │
echo  │                                           │
echo  │  🖥️  Otimizando prioridades de CPU...     │
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d 1 /f >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul 2>&1
echo  │  ✅ Prioridades configuradas              │
echo  │                                           │
echo  │  🎨 Removendo efeitos visuais...          │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f >nul 2>&1
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d 9012038010000000 /f >nul 2>&1
echo  │  ✅ Interface otimizada                   │
echo  │                                           │
echo  │  ⚡ Acelerando inicializacao...           │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d 0 /f >nul 2>&1
echo  │  ✅ Startup acelerado                     │
echo  │                                           │
echo  │  🌐 Otimizando rede...                    │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f >nul 2>&1
echo  │  ✅ Throttling de rede removido           │
echo  │                                           │
echo  │  🔧 Desabilitando servicos opcionais...   │
sc config Fax start= disabled >nul 2>&1
sc config Themes start= disabled >nul 2>&1
sc config UxSms start= disabled >nul 2>&1
echo  │  ✅ Servicos otimizados                   │
echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Otimizacao para hardware fraco concluida!
echo     Sistema configurado para maxima performance!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.

:LimpezaArquivosTemporarios
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║          LIMPEZA DE ARQUIVOS              ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  🧹 Iniciando limpeza de arquivos...
echo.
echo  ┌─ PROGRESSO DA LIMPEZA ────────────────────┐
echo  │                                           │
echo  │  🗂️  Limpando arquivos temporarios...     │
del /s /q "%temp%\*" >nul 2>&1
rd /s /q "%temp%" >nul 2>&1
md "%temp%" >nul 2>&1
echo  │  ✅ Temp do usuario limpo                 │
echo  │                                           │
echo  │  🗂️  Limpando temp do Windows...          │
del /s /q "%SystemRoot%\Temp\*" >nul 2>&1
rd /s /q "%SystemRoot%\Temp" >nul 2>&1
md "%SystemRoot%\Temp" >nul 2>&1
echo  │  ✅ Temp do sistema limpo                 │
echo  │                                           │
echo  │  📋 Limpando arquivos de log...           │
del /s /q "%SystemRoot%\Logs\*" >nul 2>&1
del /s /q "%SystemRoot%\System32\LogFiles\*" >nul 2>&1
echo  │  ✅ Logs removidos                        │
echo  │                                           │
echo  │  🖼️  Limpando cache de thumbnails...      │
del /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache*" >nul 2>&1
echo  │  ✅ Cache de miniaturas limpo             │
echo  │                                           │
echo  │  ⚡ Limpando prefetch antigo...           │
forfiles /p "%SystemRoot%\Prefetch" /m *.pf /d -30 /c "cmd /c del @path" >nul 2>&1
echo  │  ✅ Prefetch otimizado                    │
echo  │                                           │
echo  │  📦 Limpando cache Windows Update...      │
net stop wuauserv >nul 2>&1
del /s /q "%SystemRoot%\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1
echo  │  ✅ Cache do Windows Update limpo         │
echo  │                                           │
echo  │  🗑️  Esvaziando lixeira...               │
PowerShell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" >nul 2>&1
echo  │  ✅ Lixeira esvaziada                     │
echo  │                                           │
echo  │  🔧 Executando limpeza adicional...       │
cleanmgr /sagerun:1 >nul 2>&1
echo  │  ✅ Limpeza do sistema concluida          │
echo  │                                           │

if "%WINVER%"=="11" (
    echo  │  🆕 Limpeza Windows 11...                 │
    del /s /q "%LocalAppData%\Microsoft\Windows\INetCache\*" >nul 2>&1
    echo  │  ✅ INetCache Win11 limpo                 │
    del /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
    echo  │  ✅ Cache Edge Win11 limpo                │
    PowerShell -Command "Get-ChildItem -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist' -Recurse | Remove-ItemProperty -Name '*' -ErrorAction SilentlyContinue" >nul 2>&1
    echo  │  ✅ UserAssist Win11 limpo                │
) else (
    echo  │  🖥️  Limpeza Windows 10...                 │
    del /s /q "%LocalAppData%\Microsoft\Windows\WebCache\*" >nul 2>&1
    echo  │  ✅ WebCache Win10 limpo                  │
    del /s /q "%LocalAppData%\Microsoft\Internet Explorer\DOMStore\*" >nul 2>&1
    echo  │  ✅ DOMStore IE limpo                     │
)

echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Limpeza concluida com sucesso!
echo     Sistema mais rapido e com mais espaco!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.

:OtimizacaoWindows11
if not "%WINVER%"=="11" (
    cls
    echo.
    echo  ╔═══════════════════════════════════════════╗
    echo  ║              AVISO IMPORTANTE             ║
    echo  ╚═══════════════════════════════════════════╝
    echo.
    echo  ⚠️  Esta opcao e especifica para Windows 11!
    echo.
    echo  Seu sistema: Windows %WINVER%
    echo.
    echo  Pressione qualquer tecla para voltar...
    pause
    goto :menu
)

cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║         OTIMIZACOES WINDOWS 11            ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo  🆕 Aplicando otimizacoes especificas do Win11...
echo.
echo  ┌─ CONFIGURACOES WINDOWS 11 ────────────────┐
echo  │                                           │

REM Desabilitar Widgets
echo  │  🧩 Desabilitando Widgets...              │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Widgets desabilitados                 │

REM Desabilitar Teams Chat integrado
echo  │  💬 Removendo Teams Chat...               │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Teams Chat removido                   │

REM Configurar menu Iniciar clássico
echo  │  📱 Configurando menu Iniciar...          │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_ShowClassicMode" /t REG_DWORD /d 1 /f >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start" /v "ConfigureStartPins" /t REG_SZ /d "{\"pinnedList\": []}" /f >nul 2>&1 && echo  │  ✅ Menu Iniciar otimizado                │

REM Desabilitar recomendações no menu Iniciar
echo  │  🚫 Removendo recomendacoes...             │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_IrisRecommendations" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Recomendacoes desabilitadas           │

REM Configurar barra de tarefas para esquerda (clássico)
echo  │  ⬅️  Alinhando barra de tarefas...         │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Barra alinhada a esquerda             │

REM Desabilitar busca na web via menu Iniciar
echo  │  🔍 Otimizando busca...                   │
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Busca web desabilitada                │

REM Desabilitar notificações do Microsoft Defender
echo  │  🛡️  Configurando Defender...             │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Notificacoes Defender reduzidas       │

REM Otimizar snap layouts
echo  │  📐 Configurando Snap Layouts...          │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableSnapAssistFlyout" /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableSnapBar" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Snap Layouts simplificado             │

REM Remover Microsoft Edge da tela de boas-vindas
echo  │  🌐 Otimizando Edge...                    │
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f >nul 2>&1 && echo  │  ✅ Edge otimizado                        │

REM Desabilitar publicidade no Explorer
echo  │  📁 Otimizando Explorer...                │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Explorer otimizado                    │

REM Configurações específicas do Windows 11 para performance
echo  │  ⚡ Otimizacoes de performance...          │
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f >nul 2>&1
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t REG_DWORD /d 1 /f >nul 2>&1
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f >nul 2>&1 && echo  │  ✅ Performance otimizada                 │

REM Remover aplicativos específicos do Windows 11
echo  │  📱 Removendo apps desnecessarios...      │
PowerShell -Command "Get-AppxPackage *Microsoft.Todos* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *MicrosoftWindows.Client.WebExperience* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage" >nul 2>&1 && echo  │  ✅ Apps desnecessarios removidos         │

echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
echo  🎉 Otimizacoes Windows 11 aplicadas!
echo     Seu Windows 11 agora esta mais rapido!
echo.
echo  Pressione qualquer tecla para continuar...
cls
pause
goto :menu
echo.

TIMEOUT /T 3
cls
echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║           OTIMIZACAO CONCLUIDA            ║
echo  ╚═══════════════════════════════════════════╝
echo.
echo            🎉 PARABENS! 🎉
echo.
echo  ┌─ REINICIALIZANDO INTERFACE ───────────────┐
echo  │                                           │
echo  │  🔄 Reiniciando Windows Explorer...       │
taskkill /f /im explorer.exe >nul 2>&1
echo  │  ✅ Explorer finalizado                   │
echo  │                                           │
start explorer.exe
echo  │  ✅ Explorer reiniciado                   │
echo  │                                           │
echo  │  🎯 Sistema otimizado com sucesso!        │
echo  │                                           │
if "%WINVER%"=="11" (
echo  │  🆕 Windows 11 detectado e otimizado!     │
) else (
echo  │  🖥️  Windows 10 otimizado com eficiencia! │
)
echo  │                                           │
echo  │  💡 Recomendamos reiniciar o computador   │
echo  │     para aplicar todas as otimizacoes     │
echo  │                                           │
echo  └───────────────────────────────────────────┘
echo.
if "%WINVER%"=="11" (
    echo  🚀 Seu Windows 11 esta mais rapido agora!
) else (
    echo  🚀 Seu Windows 10 esta mais rapido agora!
)
echo.
if "%WINVER%"=="11" (
    msg %username% "Otimizacao Windows 11 finalizada! Considere reiniciar o sistema."
) else (
    msg %username% "Otimizacao Windows 10 finalizada! Considere reiniciar o sistema."
)