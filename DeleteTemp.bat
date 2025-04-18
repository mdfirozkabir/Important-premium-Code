@echo off
:: Deletes temporary files

echo Cleaning temporary files...

:: Deletes files in the system temp folder
del /s /q %temp%\*.* 2>nul
rd /s /q %temp% 2>nul

:: Deletes files in the Windows temp folder (C:\Windows\Temp)
del /s /q C:\Windows\Temp\*.* 2>nul
rd /s /q C:\Windows\Temp 2>nul

:: Uncomment these lines to delete temp files for all users
del /s /q "C:\Users\*\AppData\Local\Temp\*.*" 2>nul
rd /s /q "C:\Users\*\AppData\Local\Temp" 2>nul

:: Uncomment these lines to delete temp files for all users
del /s /q "C:\Users\%USERNAME%\AppData\Local\Temp\*.*" 2>nul
rd /s /q "C:\Users\%USERNAME%\AppData\Local\Temp" 2>nul

:: Target the Recent Files folder
del /s /q "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Recent\*.*" 2>nul

:: Remove empty subfolders (optional)
for /d %%i in ("C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Recent\*") do rd /s /q "%%i" 2>nul

echo Temporary files cleaned successfully!
exit
