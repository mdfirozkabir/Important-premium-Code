@echo off
REG ADD "HKCU\Control Panel\Desktop" /v "PaintDesktopVersion" /t REG_DWORD /d 0 /f
taskkill /F /IM explorer.exe
start explorer.exe
exit