@echo off
echo %USERNAME% = userName
if exist firozishere (
        rmdir /s /q "C:\Users\%userName%\Desktop\firozishere"
)
exit
