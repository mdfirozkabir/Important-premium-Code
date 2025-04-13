@echo off
title Scheduled Shutdown/Restart
color 0C

:: Admin rights check
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo  Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo ========================================
echo      Scheduling Shutdown/Restart
echo ========================================
set /p action=Enter action [shutdown/restart]: 
set /p time=Enter time (e.g. 00:30 for 12:30 AM): 

echo Scheduled to %action% at %time%.

:: Schedule shutdown/restart
if "%action%"=="shutdown" (
    at %time% /interactive shutdown.exe /s /f /t 0
) else if "%action%"=="restart" (
    at %time% /interactive shutdown.exe /r /f /t 0
) else (
    echo Invalid action. Please choose 'shutdown' or 'restart'.
)

echo ========================================
echo  Action Scheduled Successfully!
pause
