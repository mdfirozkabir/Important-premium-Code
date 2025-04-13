@echo off
echo =========================================
echo   Automatic Software Installer Script
echo =========================================
echo.

:: Checking for winget
winget --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Winget not found. Please update your Windows or install App Installer from Microsoft Store.
    pause
    exit /b
)

echo Installing Google Chrome...
winget install --id=Google.Chrome -e --accept-package-agreements --accept-source-agreements

echo Installing Brave Browser...
winget install --id=Brave.Brave -e --accept-package-agreements --accept-source-agreements

echo Installing Internet Download Manager (IDM)...
winget install --id=Tonec.InternetDownloadManager -e --accept-package-agreements --accept-source-agreements

echo Installing Lightshot...
winget install --id=Skillbrains.Lightshot -e --accept-package-agreements --accept-source-agreements

echo Installing Messenger...
winget install --id=Meta.Messenger -e --accept-package-agreements --accept-source-agreements

echo Installing WhatsApp...
winget install --id=WhatsApp.WhatsApp -e --accept-package-agreements --accept-source-agreements

echo Installing Telegram Desktop...
winget install --id=Telegram.TelegramDesktop -e --accept-package-agreements --accept-source-agreements

echo Installing BlueStacks 5...
winget install --id=BlueStack.BlueStacks -e --accept-package-agreements --accept-source-agreements

echo Installing VLC Media Player...
start /wait https://get.videolan.org/vlc/3.0.11.1/win64/vlc-3.0.11.1-win64.exe
