@echo off
color 0A

:: Request admin privilege if not already
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Set compact window size
mode con: cols=60 lines=20

cls
echo.
echo             ::: Windows KMS Activator v1.2
echo.
echo        -----------------------------------------
echo         Trying KMS Servers One by One...
echo        -----------------------------------------
echo.

setlocal enabledelayedexpansion
set servers=kms.digiboy.ir kms.msguides.com kms8.msguides.com kms.loli.best
set activated=0

for %%s in (%servers%) do (
    echo         Trying KMS Server: %%s
    cscript //nologo slmgr.vbs /skms %%s >nul
    cscript //nologo slmgr.vbs /ato >nul

    for /f "tokens=*" %%i in ('cscript //nologo slmgr.vbs /xpr') do (
        echo %%i | findstr /i "The machine is permanently activated" >nul
        if !errorlevel! EQU 0 (
            echo.
            echo         Activated Successfully using: %%s
            set activated=1
            goto after_activation
        )
    )
)

if !activated! EQU 0 (
    echo.
    echo        -----------------------------------------
    echo         All KMS servers failed to activate.
    echo         Trying alternative online method...
    echo        -----------------------------------------
    powershell -Command "irm https://get.activated.win | iex"
)

:after_activation
echo.
echo        ==========================================
echo         Windows Activation Process Completed!
echo         You may restart your PC if needed.
echo        ==========================================
echo.
pause
exit
