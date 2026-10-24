@echo off
TITLE Free Fire Optimizer - Temporary Runtime Priority Boost
COLOR 0D

:: 1. Auto-Elevate to Administrator
NET SESSION >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

cls
echo ========================================================
echo      APPLYING TEMPORARY HIGH PRIORITY TO ACTIVE GAMES
echo ========================================================
echo.

echo [+] Searching for active emulator processes...

:: Target BlueStacks / MSI App Player
wmic process where name="HD-Player.exe" CALL setpriority 128 >nul 2>&1

:: Target LDPlayer
wmic process where name="dnplayer.exe" CALL setpriority 128 >nul 2>&1
wmic process where name="Ld9BoxHeadless.exe" CALL setpriority 128 >nul 2>&1

:: Target MEmu Play / Nox
wmic process where name="MEmu.exe" CALL setpriority 128 >nul 2>&1
wmic process where name="Nox.exe" CALL setpriority 128 >nul 2>&1

echo.
echo ========================================================
echo [SUCCESS] Temporary High Priority applied to running processes!
echo ========================================================
echo [!] This priority boost will end automatically when you
echo     close the emulator. No permanent registry keys added.
echo ========================================================
echo.
pause