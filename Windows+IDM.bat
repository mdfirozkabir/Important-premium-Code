@echo off
title  Windows + IDM Activator (Firoz Pro Edition)
color 0A

:: Run as Admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo  Requesting administrator access...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: ========================
:: Windows Activation
:: ========================
cls
echo  Activating Windows...

setlocal enabledelayedexpansion
set servers=kms.digiboy.ir kms.msguides.com kms8.msguides.com kms.loli.best

for %%s in (%servers%) do (
    echo  Trying KMS Server: %%s
    cscript //nologo slmgr.vbs /skms %%s >nul
    cscript //nologo slmgr.vbs /ato >nul

    :: Check activation status
    for /f "tokens=*" %%i in ('cscript //nologo slmgr.vbs /xpr') do (
        echo %%i | findstr /i "The machine is permanently activated" >nul
        if !errorlevel! EQU 0 (
            echo.
            echo  Activated Successfully using: %%s
            goto IDM
        )
    )
)

echo.
echo  Activation failed with all servers.
goto done

:: ========================
:: IDM Activation (PowerShell Script)
:: ========================
:IDM
echo.
echo  Activating IDM...

:: Run PowerShell command to activate IDM
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm -useb https://naeembolchhi.github.io/IDM-Activator/IDMA.ps1 | iex"

echo  IDM Activation Done!
echo.
echo  All Activation Complete!
pause
exit

:: Done
:done
echo ============================================
echo  Activation failed with all servers.
echo  Try again later or check your connection.
echo ============================================
pause
exit
