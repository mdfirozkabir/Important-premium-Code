@echo off
:: Check if the script is already running as Administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

:: PC Health scanning
DISM /Online /Cleanup-image /restorehealth