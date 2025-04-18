@echo off
setlocal EnableDelayedExpansion

:: Get the current month number
for /F "tokens=2 delims= " %%i in ('date /t') do set date=%%i
for /F "tokens=1 delims=/" %%a in ("%date%") do set month=%%a

:: Map month number to month name
set "monthName="
if %month%==01 set monthName=January
if %month%==02 set monthName=February
if %month%==03 set monthName=March
if %month%==04 set monthName=April
if %month%==05 set monthName=May
if %month%==06 set monthName=June
if %month%==07 set monthName=July
if %month%==08 set monthName=August
if %month%==09 set monthName=September
if %month%==10 set monthName=October
if %month%==11 set monthName=November
if %month%==12 set monthName=December

:: Create folder with month name
if defined monthName (
    mkdir %monthName%
) else (
    echo Could not determine month name.
)

endlocal
