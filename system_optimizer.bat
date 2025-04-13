@echo off
title System Optimization
color 0A

:: Admin rights check
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo  Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo ========================================
echo        Optimizing Your System
echo ========================================

:: Clean up temp files
echo Cleaning up temp files...
del /f /s /q %temp%\* >nul
del /f /s /q C:\Windows\Temp\* >nul

:: Disk Cleanup
echo Running Disk Cleanup...
cleanmgr /sagerun:1

:: Defrag
echo Running Disk Defragmentation...
defrag C: /O

echo ========================================
echo  System Optimized Successfully!
pause
