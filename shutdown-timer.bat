@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)


title Shutdown Timer Menu
color 0A

:: Set window size to a smaller size (columns = 50, lines = 20)
mode con: cols=50 lines=20

:menu
cls
echo          ::: Shutdown Timer v0.8
echo.
echo          ---------------------------------------------
echo.
echo          [1] Shutdown in 5 minutes
echo          [2] Shutdown in 10 minutes
echo          [3] Shutdown in 15 minutes
echo          [4] Shutdown in 30 minutes
echo          [5] Shutdown in 1 hour
echo          [6] Custom Shutdown Time
echo          [7] Cancel Scheduled Shutdown
echo          [8] Exit
echo.
echo          ---------------------------------------------
echo.
set /p choice=Enter a menu option [1-8]: 

if "%choice%"=="1" set seconds=300 & set label=5 minutes & goto confirm
if "%choice%"=="2" set seconds=600 & set label=10 minutes & goto confirm
if "%choice%"=="3" set seconds=900 & set label=15 minutes & goto confirm
if "%choice%"=="4" set seconds=1800 & set label=30 minutes & goto confirm
if "%choice%"=="5" set seconds=3600 & set label=1 hour & goto confirm
if "%choice%"=="6" goto customTime
if "%choice%"=="7" goto cancel
if "%choice%"=="8" exit
goto menu

:customTime
cls
echo          ::: Custom Shutdown Timer
echo.
echo Please enter the shutdown time:
set /p hours=Enter hours: 
set /p minutes=Enter minutes: 

:: Convert hours and minutes to seconds
set /a seconds=(%hours%*3600) + (%minutes%*60)
set label=%hours% hour(s) and %minutes% minute(s)

goto confirm

:confirm
cls
echo.
echo Are you sure you want to shutdown in %label%? (Y/N)
set /p confirmChoice=Your choice: 
if /I "%confirmChoice%"=="Y" goto doShutdown
if /I "%confirmChoice%"=="N" goto menu
goto confirm

:doShutdown
cls
shutdown -s -t %seconds%
echo.
echo Shutdown scheduled in %label%.
echo.
echo Press any key within 10 seconds to CANCEL shutdown...
timeout /t 5 /nobreak >nul
if errorlevel 1 (
    shutdown -a
    echo Shutdown cancelled by user!
)
goto end

:cancel
cls
shutdown -a
echo.
echo Shutdown schedule has been cancelled.
goto end

:end
echo.
pause
goto menu
