@echo off
chcp 1252 > Nul
set Intervalo=10
mode 30,13
color 0a
title Otimizacao WIN 10 By Gabs
:menu
cls
echo Otimizacao WIN 10 Beta v1
echo.
echo Escolha uma opcao:
echo.
echo [1] Desabilitar Servicos
echo [2] Tarefas Agendadas
echo [3] Remover Telemetria
echo [4] Desabilitar Configuracoes Diversas
echo [5] Tweaks Variados
echo [6] Otimizacao de Tela
echo [7] Desabilitar Cortana
echo [8] Parametros de Rede
echo [9] Desabilitar Hibernacao do HD/SSD e configs de energia
echo [10] Otimizacao EDGE
echo [11] Features nao usadas
echo [12] Remover Apps da Msstore
echo [13] Otimizacao do Sistema
echo [14] Instaladores
echo [0] Sair
echo.

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
if %menu% equ 0 exit

pause
goto :menu

chcp 65001

:Desabilitar.Serviços
*** Desabilitar alguns serviços ***
sc config DiagTrack start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config dmwappushservice start= disabled
sc config RemoteREGistry start= disabled
sc config TrkWks start= disabled
sc config SysMain start= disabled
sc config lmhosts start= disabled
sc config VSS start= disabled
sc config RemoteAccess start= disabled
sc config WSearch start= disabled
sc config iphlpsvc start= disabled
sc config DoSvc start= disabled
sc config ICEsoundService start= disabled
sc config RtkAudioUniversalService start= disabled
sc config BDESVC start= disabled
sc config TabletInputService start= disabled
sc config SstpSvc start= disabled
sc config NvTelemetryContainer start= disabled
sc config HomeGroupListener start= disabled
sc config HomeGroupProvider start= disabled
sc config lfsvc start= disabled
sc config WbioSrvc start= disabled
sc config wisvc start= disabled
sc config TapiSrv start= disabled
sc config SmsRouter start= disabled
sc config SharedRealitySvc start= disabled
sc config ScDeviceEnum start= disabled
sc config SCardSvr start= disabled
sc config RetailDemo start= disabled
sc config PhoneSvc start= disabled
sc config perceptionsimulation start= disabled
sc config BTAGService start= disabled
sc config AJRouter start= disabled
sc config CDPSvc start= disabled
sc config ShellHWDetection start= disabled
sc config RstMwService start= disabled
sc config DusmSvc start= disabled
sc config BthAvctpSvc start= disabled
sc config BITS start= demand
sc config DPS start= disabled
cls
pause
goto :menu
echo.


:Tarefas.Agendadas
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Enable
pause
goto :menu
echo.


:Remover.Telemetria
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
REG ADD "HKLM\Software\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Off /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "SmartScreenEnabled" /t "REG_SZ" /d "Off" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowFullControl /t REG_DWORD /d 0 /f
cls
pause
goto :menu
echo.



:Desabilitar.Configurações.Diversas
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f
REG ADD "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "UxOption" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\deleteiveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\deleteiveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /fREM 0 = esconder completamente, 1 = mostrar apenas ícone, 2 = Mostrar caixa completa
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f
REM 1 = Este Computador, 2 = Acesso Rápido
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 2 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
powercfg -h off
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 00000000 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 00000000 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "WaitToKillServiceTimeout" /t REG_SZ /d 2000 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explore" /v "EnableAutoTray" /t REG_DWORD /d 0 /f
cls
pause
goto :menu
echo.


:Tweaks.Variados
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d 1 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d 2000 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowdeleteay" /t REG_SZ /d 5 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d 3000 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d 2000 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ActiveWndTrackTimeout" /t REG_DWORD /d 00000000 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d 00000001 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d 00000001 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d 00000001 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d 00000001 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d 00000001 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DesktopLivePreviewHoverTime" /t REG_DWORD /d 00000001 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_ShowRun" /t REG_DWORD /d 00000001 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d 2000 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d 2000 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d 2000 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnails" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FolderContentsInfoTip" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowEncryptCompressedColor" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowInfoTip /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowPreviewHandlers" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableFirstLogonAnimation" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "EnableFirstLogonAnimation" /t REG_DWORD /d 0 /f
cls
pause
goto :menu
echo.

:Otimizacao.De.tela
cls
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d 00000064 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "VisualFXSetting" /t REG_DWORD /d 3 /f
REG ADD "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d 9032078010000000 /f
REG ADD "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" REG_SZ /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "DisablePreviewDesktop" /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM " /V "DisablePreviewDesktop" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "IconsOnly" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "ListviewAlphaSelect" /T REG_DWORD /D 1 /F
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d 2 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "ListviewShadow" /T REG_DWORD /D 1 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /V "AlwaysHibernateThumbnails" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "AutoColorization " /t REG_DWORD/d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /d 4096 /t REG_SZ /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /V "EnablePerProcessSystemDP"/T REG_DWORD /D 1 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /V "AppsUseLightTheme" /T REG_DWORD /D 0 /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /V "ScreenSaveActive" /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /V "ScreenSaveActive" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "AutoColorization" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d 171717 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "AccentColorInactive" /t REG_DWORD /d 444444 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "AutoColorization" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\0\2093230218" /v "EnabledState" /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FeatureManagement\Overrides\0\2093230218" /v "EnabledStateOptions" /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /V "EnableAutoTray" /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Wisp\Touch" /V "TouchGate" /T REG_DWORD /D 0 /F
cls
pause
goto :menu
echo.

:Desabilitar.Cortana
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingOutlook" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingEmailAttachments" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AutoIndexSharedFolders" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
cls
pause
goto :menu
echo.


:Parametros.De.Rede
netsh interface teredo set state disable
netsh interface 6to4 set state disable disable
netsh interface isatap set state disable
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v "EnableICSIPv6" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 255 /f
cls
pause
goto :menu
echo.


:Desabilitar.hibernação.HD/SSD.e.demais.configs.de.energia
ECHO Esquema Balanceado
powercfg -SETACTIVE 381b4222-f694-41f0-9685-ff5bb260df2e
ECHO Marcando configurações na bateria como nunca
powercfg.exe -change -monitor-timeout-dc 5
powercfg.exe -change -standby-timeout-dc 15
powercfg.exe -change -hibernate-timeout-dc 0
ECHO Marcando configurações na tomada como nunca
powercfg.exe -change -monitor-timeout-ac 15
powercfg.exe -change -standby-timeout-ac 0
powercfg.exe -change -hibernate-timeout-ac 0
ECHO Não mexer no brilho do monitor
powercfg -SETDCVALUEINDEX SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg -SETACVALUEINDEX SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
ECHO Ao fechar a tampa. Na tomada nada e na bateria adormecer
powercfg -SETACVALUEINDEX SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -SETDCVALUEINDEX SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 3
ECHO Ao apertar o botão de desligar, desligar e não adormecer
powercfg -SETACVALUEINDEX SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -SETDCVALUEINDEX SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
ECHO Desabilitar hibernação de HD/SSD
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
cls
pause
goto :menu
echo.


:Otimizacao.EDGE
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnabledState" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "SyncFavoritesBetweenIEAndMicrosoftEdge" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "PreventLiveTileDataCollection" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "AllowPrelaunch" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "PreventTabPreloading" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "AllowTabPreloading" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "VideoCaptureAllowed" /d 0 /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultGeolocationSetting" /d 2 /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AudioCaptureAllowed" /d 0 /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultSensorsSetting" /d 2 /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultNotificationsSetting" /d 2 /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyMode" /d 0 /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /d 0 /t REG_DWORD /f
cls
pause
goto :menu
echo.


:Features.nao.usadas
DISM.exe /Online /norestart /Disable-Feature /featurename:SimpleTCP /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:SNMP /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WMISnmpProvider /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Windows-Identity-Foundation /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:DirectoryServices-ADAM-Client /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-WebServerRole /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-WebServer /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-CommonHttpFeatures /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-HttpErrors /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-HttpRedirect /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ApplicationDevelopment /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-NetFxExtensibility /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-NetFxExtensibility45 /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-HealthAndDiagnostics /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-HttpLogging /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-LoggingLibraries /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-RequestMonitor /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-HttpTracing /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-Security /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-URLAuthorization /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-RequestFiltering /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-IPSecurity /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-Performance /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-HttpCompressionDynamic /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-WebServerManagementTools /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ManagementScriptingTools /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-IIS6ManagementCompatibility /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-Metabase /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WAS-WindowsActivationService /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WAS-ProcessModelete /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WAS-NetFxEnvironment /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WAS-ConfigurationAPI /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-HostableWebCore /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-CertProvider /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-WindowsAuthentication /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-DigestAuthentication /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ClientCertificateMappingAuthentication /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-IISCertificateMappingAuthentication /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ODBCLogging /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-StaticContent /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-DefaultDocument /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-DirectoryBrowsing /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-WebDAV /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-WebSockets /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ApplicationInit /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ASPNET /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ASPNET45 /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ASP /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-CGI /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ISAPIExtensions /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ISAPIFilter /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ServerSideIncludes /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-CustomLogging /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-BasicAuthentication /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-HttpCompressionStatic /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ManagementConsole /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-ManagementService /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-WMICompatibility /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-LegacyScripts /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-LegacySnapIn /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-FTPServer /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-FTPSvc /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:IIS-FTPExtensibility /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:MSMQ-Container /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:MSMQ-Server /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:MSMQ-Triggers /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:MSMQ-ADIntegration /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:MSMQ-HTTP /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:MSMQ-Multicast /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:MSMQ-DCOMProxy /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WCF-HTTP-Activation45 /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WCF-TCP-Activation45 /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WCF-Pipe-Activation45 /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WCF-MSMQ-Activation45 /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WCF-HTTP-Activation /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WCF-NonHTTP-Activation /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:NetFx4Extended-ASPNET45 /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:MediaPlayback /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WindowsMediaPlayer /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Microsoft-Windows-MobilePC-Client-Premium-Package-net /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Printing-XPSServices-Features /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:RasCMAK /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:RasRip /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:MSRDC-Infrastructure /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:TelnetClient /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:TelnetServer /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:TFTP /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:TIFFIFilter /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WorkFolders-Client /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:SMB1Protocol /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Microsoft-Hyper-V-All /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Microsoft-Hyper-V-Tools-All /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Microsoft-Hyper-V /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Microsoft-Hyper-V-Management-Clients /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Microsoft-Hyper-V-Management-PowerShell /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:SearchEngine-Client-Package /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:WCF-TCP-PortSharing45 /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:SmbDirect /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Internet-Explorer-Optional-amd64 /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Printing-Foundation-Features /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:FaxServicesClientPackage /Remove
DISM.exe /Online /norestart /Disable-Feature /featurename:Printing-Foundation-InternetPrinting-Client /Remove
DISM /Online /norestart /Remove-Capability /CapabilityName:App.StepsRecorder~~~~0.0.1.0
DISM /Online /norestart /Remove-Capability /CapabilityName:App.Support.QuickAssist~~~~0.0.1.0
DISM /Online /norestart /Remove-Capability /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0
DISM /Online /norestart /Remove-Capability /CapabilityName:Hello.Face.18967~~~~0.0.1.0
DISM /Online /norestart /Remove-Capability /CapabilityName:Hello.Face.Migration.18967~~~~0.0.1.0
DISM /Online /norestart /Remove-Capability /CapabilityName:MathRecognizer~~~~0.0.1.0
DISM /Online /norestart /Remove-Capability /CapabilityName:Media.WindowsMediaPlayer~~~~0.0.12.0
DISM /Online /norestart /Remove-Capability /CapabilityName:Microsoft.Windows.MSPaint~~~~0.0.1.0
DISM /Online /norestart /Remove-Capability /CapabilityName:Microsoft.Windows.WordPad~~~~0.0.1.0
cls
pause
goto :menu
echo.


:Remover.Apps.Da.Store
Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-AppxPackage | where-object {$_.name -notlike '*GamingApp*'} | where-object {$_.name -notlike '*Winget*'} |where-object {$_.name -notlike '*store*'} | where-object {$_.name -notlike '*DesktopAppInstaller*'} |where-object {$_.name -notlike '*xbox*'} | where-object {$_.name -notlike '*terminal*'} |Remove-AppxPackage"
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "ContentdeleteiveryAllowed" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContent-314559Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContent-314563Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f
cls
pause
goto :menu
echo.


:OtimizacaoDoSistema
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutoTrayNotify" /d 1 /t REG_DWORD /f
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /d 1 /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /d 0 /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /d 2 /t REG_DWORD /f
REG delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\deleteegateFolders\{3936E9E4-D92C-4EEE-A85A-BC16D5EA0819}" /f
REG delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\deleteegateFolders\{3936E9E4-D92C-4EEE-A85A-BC16D5EA0819}" /f
REG delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\deleteegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
REG delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\deleteegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Keyboard" /v"PrintScreenKeyForSnippingEnabled" /d 1 /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "EnableDynamicContentInWSB" /d 0 /t REG_DWORD /f
taskkill /f /im msedge.exe
REM Google Chrome
del /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache"
icacls "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache" /deny *S-1-1-0:(F)
REM Opera
del /s /q "%userprofile%\AppData\Local\Opera Software\Opera Stable\Cache"
icacls "%userprofile%\AppData\Local\Opera Software\Opera Stable\Cache" /deny *S-1-1-0:(F)
REM Microsoft Edge
del /s /q "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cache"
icacls "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cache" /deny *S-1-1-0:(F)
REM Mozilla Firefox
cd "%userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*default-release"
del /s /q cache2
icacls cache2 /deny *S-1-1-0:(F)
REM Spotify
del /s /q "%LocalAppData%\Spotify\Storage"
icacls "%LocalAppData%\Spotify\Storage" /deny *S-1-1-0:(F)
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\Dnscache" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI" /v "DisableMFUTracking" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" /v "DisableMFUTracking" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v Value /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\InputPersonalization" /v" RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "EnableDynamicContentInWSB" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsSyncWithDevices" /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsSyncWithDevices_UserInControlOfTheseApps" /t REG_MULTI_SZ /d 00,00 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsSyncWithDevices_ForceAllowTheseApps" /t REG_MULTI_SZ /d 00,00 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsSyncWithDevices_ForceDenyTheseApps" /t REG_MULTI_SZ /d 00,00 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /d 0 /t REG_DWORD /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "RestartApps" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power\PowerThrottling" /V "PowerThrottlingOff" /T REG_DWORD /D 1 /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /V "GPU Priority" /T REG_DWORD /D 8 /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /V "Priority" /T REG_DWORD /D 6 /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /V "Scheduling Category" /T REG_SZ /D High /F
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /V "AppCaptureEnabled" /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /V "GameDVR_Enabled" /T REG_DWORD /D 0 /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /V "AllowgameDVR" /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /V "AllowAutoGameMode" /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /V "AutoGameModeEnabled" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DontUsePowerShellOnWinX" /T REG_DWORD /D 1 /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /V "EnableSmartScreen" /T REG_DWORD /D 0 /F
REG delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /V "ShellSmartScreenLevel" /F
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d Deny /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "LetAppsRunInBackground" /t REG_DWORD /d 2 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentdeleteiveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d 506 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d 122 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d 58 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d 0 /f
PowerShell -Command "Set-WindowsSearchSetting -EnableWebResultsSetting $false"
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 0 /f
REG ADD "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Type" /t REG_SZ /d LooselyCoupled /f
REG ADD "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d Deny /f
REG ADD "SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "InitialAppValue" /t REG_SZ /d 0 /f
REG ADD "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" /v "WiFiSenseCredShared" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" /v "WiFiSenseOpen" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "Startupdeleteayinmsec" /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXvhc4p7vz4b485xfp46hhk3fq3grkdgjg" /v "NoOpenWith" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXvhc4p7vz4b485xfp46hhk3fq3grkdgjg" /v "NoStaticDefaultVerb" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppX4hxtad77fbk3jkkeerkrm0ze94wjf3s9" /v "NoOpenWith" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppX4hxtad77fbk3jkkeerkrm0ze94wjf3s9" /v "NoStaticDefaultVerb" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723" /v "NoOpenWith" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723" /v "NoStaticDefaultVerb" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXde74bfzw9j31bzhcvsrxsyjnhhbq66cs" /v "NoOpenWith" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXde74bfzw9j31bzhcvsrxsyjnhhbq66cs" /v "NoStaticDefaultVerb" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXcc58vyzkbjbs4ky0mxrmxf8278rk9b3t" /v "NoOpenWith" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXcc58vyzkbjbs4ky0mxrmxf8278rk9b3t" /v "NoStaticDefaultVerb" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXk0g4vb8gvt7b93tg50ybcy892pge6jmt" /v "NoOpenWith" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXk0g4vb8gvt7b93tg50ybcy892pge6jmt" /v "NoStaticDefaultVerb" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc" /v "NoOpenWith" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc" /v "NoStaticDefaultVerb" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppX9rkaq77s0jzh1tyccadx9ghba15r6t3h" /v "NoOpenWith" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppX9rkaq77s0jzh1tyccadx9ghba15r6t3h" /v "NoStaticDefaultVerb" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" /v "NoOpenWith" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" /v "NoStaticDefaultVerb" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" /v "NoOpenWith" /t REG_SZ /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" /v "NoStaticDefaultVerb" /t REG_SZ /d 0 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /V "HiberbootEnabled" /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "EnableBalloonTips" /T REG_DWORD /D 0 /F
cls
pause
goto :menu
echo.


:Instaladores
Rem***Instalar MVPS HOSTS (Desabilita propagandas e rastreadores)***
rem Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/robledosm/update-mvpsHosts/master/update-mvpsHosts.ps1'))"
rem Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/W4RH4WK/Debloat-Windows-10/master/scripts/block-telemetry.ps1'))"
rem ipconfig /flushdns
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\Dnscache\Parameters" /v "MaxNegativeCacheTtl" /t "REG_DWORD" /d "0" /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\Dnscache\Parameters" /v "MaxCacheTtl" /t "REG_DWORD" /d "1" /f
***Instalar Winget***
rem Powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Add-AppxPackage -Path https://github.com/microsoft/winget-cli/releases/download/v1.2.3411-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
rem*** Instalar .NET Framework 3.5 ***
Dism /online /norestart /Enable-Feature /FeatureName:"NetFx3"
***Instalar Frameworks ***
winget install Microsoft.DotNet.DesktopRuntime.3_1 -s winget -h --accept-source-agreements --accept-package-agreements
winget install Microsoft.DotNet.DesktopRuntime.5 -s winget -h --accept-source-agreements --accept-package-agreements
winget install Microsoft.DotNet.DesktopRuntime.6 -s winget -h --accept-source-agreements --accept-package-agreements
rem***Instalar Drivers***
rem cinst intel-chipset-device-software -y
rem cinst intel-graphics-driver -y
rem cinst intel-rst-driver -y
rem cinst nvidia-display-driver -y
rem cinst realtek-s winget -h --accept-source-agreements --accept-package-agreementsd-audio-driver -y
winget install AMD.RyzenMaster -s winget -h --accept-source-agreements --accept-package-agreements
rem***Instalar Navegadores e Programas para Internet***
rem winget install eloston.ungoogled-chromium -s winget -h --accept-source-agreements --accept-package-agreements
rem winget install Dropbox.Dropbox -s winget -h --accept-source-agreements --accept-package-agreements
winget install Mozilla.Firefox -s winget -h --accept-source-agreements --accept-package-agreements
winget install Opera.Opera -s winget -h --accept-source-agreements --accept-package-agreements
winget install Microsoft.OneDrive -s winget -h --accept-source-agreements --accept-package-agreements
***Instalar Aplicativos***
rem winget install Files-Community.Files -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install calibre.calibre -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install PeterPawlowski.foobar2000 -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install IrfanSkiljan.IrfanView -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst kis -y
REM winget install XBMCFoundation.Kodi -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install CodeJelly.Launchy -s winget -h --accept-source-agreements --accept-package-agreements
winget install LibreOffice.LibreOffice -s winget -h --accept-source-agreements --accept-package-agreements
winget install 9PD88QB3BGKN -s msstore -h --accept-source-agreements --accept-package-agreements & rem mpc-be
winget install Notepad++.Notepad++ -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst oldcalc -y
REM cinst openal -y
REM winget install 9NBHCS1LX4R0 -s msstore -h --accept-source-agreements --accept-package-agreements & rem paint.net
REM winget install QL-Win.QuickLook -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install QuiteRSS.QuiteRSS -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install PunkLabs.RocketDock -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Piriform.Speccy -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install SumatraPDF.SumatraPDF -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install RandomEngy.VidCoder -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst windowblinds -y
REM winget install Microsoft.winfile -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install 9NBLGGH404XM -s msstore -h --accept-source-agreements --accept-package-agreements & rem xplorer² lite
REM winget install ModernFlyouts.ModernFlyouts -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Files-Community.Files -s winget -h --accept-source-agreements --accept-package-agreements
winget install Open-Shell.Open-Shell-Menu -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install t1m0thyj.WinDynamicDesktop -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install File-New-Project.EarTrumpet -s winget -h --accept-source-agreements --accept-package-agreements
rem***Instalar Utilitários***
REM winget install 7zip.7zip -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install 7zip.7zipAlpha -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Piriform.CCleaner -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst compactgui -y
REM winget install CPUID.CPU-Z -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Piriform.Defraggler -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install ESET.Nod32 -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install ESET.Security -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install flux.flux -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install TechPowerUp.GPU-Z -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install REALiX.HWiNFO -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Microsoft.PowerToys -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Rainmeter.Rainmeter -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Piriform.Recuva -s winget -h --accept-source-agreements --accept-package-agreements
REM cinst REGscanner -y
REM winget install den4b.ReNamer -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install AntibodySoftware.WizTree -s winget -h --accept-source-agreements --accept-package-agreements
winget install Microsoft.WindowsTerminal -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install Lexikos.AutoHotkey -s winget -h --accept-source-agreements --accept-package-agreements
REM winget install CodeSector.TeraCopy -s winget -h --accept-source-agreements --accept-package-agreements
cls
pause
goto :menu
echo.

TIMEOUT /T 5
taskkill /f /im explorer.exe
start explorer.exe
msg %username% Otimizacao Finalizada com Sucesso