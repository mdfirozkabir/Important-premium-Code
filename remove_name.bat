@echo off
setlocal enabledelayedexpansion

rem Loop through all files starting with "old_"
for %%f in (old_*) do (
    set filename=%%f
    rem Remove "old_" from filename
    set newname=!filename:old_=!
    ren "%%f" "!newname!"
)

pause
