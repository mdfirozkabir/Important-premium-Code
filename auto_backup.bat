@echo off
title Automated Backup System
color 0B

:: Admin rights check
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo  Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo ========================================
echo     Automating Backup Process
echo ========================================

:: Set source and destination folder
set source="C:\Users\Firoz\Documents"
set destination="D:\Backup\Documents_Backup"

:: Create backup
echo Starting backup...
xcopy %source% %destination% /e /i /y

echo ========================================
echo  Backup Completed Successfully!
pause
