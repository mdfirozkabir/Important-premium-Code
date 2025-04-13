@echo off
title  System Utility Toolbox - By Firoz
color 0B
mode con: cols=70 lines=25

:: Admin rights check
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo  Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:menu
cls
echo ==================================================
echo              SYSTEM UTILITY TOOLBOX             
echo ==================================================
echo  1.  Clean Junk Files (Temp, %temp%, Prefetch)
echo  2.  Flush DNS and Reset Network
echo  3.  Disable Windows Defender (Temporary)
echo  4.  Restart Explorer
echo  5.  Exit
echo ==================================================
set /p choice=> Enter your choice [1-5]: 

if "%choice%"=="1" goto cleanjunk
if "%choice%"=="2" goto resetnet
if "%choice%"=="3" goto disabledef
if "%choice%"=="4" goto restartexplorer
if "%choice%"=="5" exit
goto menu

:cleanjunk
echo  Cleaning junk files...
del /f /s /q %temp%\* >nul 2>&1
del /f /s /q C:\Windows\Temp\* >nul 2>&1
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1
echo  Junk cleaned successfully!
pause
goto menu

:resetnet
echo  Flushing DNS and resetting network...
ipconfig /flushdns
netsh winsock reset
netsh int ip reset
echo  Network reset done. A restart is recommended.
pause
goto menu

:disabledef
echo  Disabling Windows Defender (Temporary)...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
echo  Windows Defender real-time protection is now OFF.
pause
goto menu

:restartexplorer
echo  Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul
start explorer.exe
echo  Explorer restarted!
pause
goto menu
