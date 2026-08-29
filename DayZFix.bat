@echo off
setlocal EnableDelayedExpansion
title DayZFix - Ultimate DayZ Cleaner and Optimizer
mode con: cols=80 lines=26
color 0B

:MAIN_MENU
cls
echo ==============================================================================
echo                          DAYZFIX - CLEANER ^& OPTIMIZER
echo                   Safe Cache, Logs and Crash Dumps Cleaner
echo ==============================================================================
echo.
echo   [1] Quick Clean       - Logs, Reports and Crash Dumps (.RPT, .log, .mdmp)
echo   [2] Launcher Cache    - Bohemia and DayZ Launcher temporary files
echo   [3] Shader Cache      - DirectX and GPU Cache (Fixes FPS drops / Stutter)
echo   [4] FULL CLEANUP      - Complete Optimization (Recommended)
echo   [5] Open DayZ Folder  - Opens AppData Local DayZ folder
echo   [0] Exit
echo.
echo ==============================================================================
set /p "choice=Select an option [0-5] and press ENTER: "

if "%choice%"=="1" goto CLEAN_LOGS
if "%choice%"=="2" goto CLEAN_LAUNCHER
if "%choice%"=="3" goto CLEAN_SHADERS
if "%choice%"=="4" goto CLEAN_ALL
if "%choice%"=="5" goto OPEN_FOLDER
if "%choice%"=="0" goto EXIT_SCRIPT
goto MAIN_MENU

:CHECK_PROCESSES
echo.
echo [*] Checking for running DayZ processes...
tasklist /FI "IMAGENAME eq DayZ_x64.exe" 2>NUL | find /I /N "DayZ_x64.exe" >NUL
if "%ERRORLEVEL%"=="0" (
    echo [!] WARNING: DayZ is currently running.
    echo Closing DayZ to release locked files...
    taskkill /F /IM DayZ_x64.exe >nul 2>&1
    echo [+] DayZ process closed.
)

tasklist /FI "IMAGENAME eq DayZLauncher.exe" 2>NUL | find /I /N "DayZLauncher.exe" >NUL
if "%ERRORLEVEL%"=="0" (
    echo [!] DayZ Launcher is running. Closing launcher...
    taskkill /F /IM DayZLauncher.exe >nul 2>&1
    echo [+] Launcher process closed.
)
goto :eof

:CLEAN_LOGS
cls
echo ==============================================================================
echo                    CLEANING DAYZ LOGS AND CRASH DUMPS
echo ==============================================================================
call :CHECK_PROCESSES
echo.
set "DAYZ_PATH=%localappdata%\DayZ"

if exist "%DAYZ_PATH%" (
    echo [*] Removing .log files...
    del /f /s /q "%DAYZ_PATH%\*.log" >nul 2>&1
    echo [*] Removing .RPT report files...
    del /f /s /q "%DAYZ_PATH%\*.RPT" >nul 2>&1
    echo [*] Removing .mdmp, .bidmp, .dmp crash dumps...
    del /f /s /q "%DAYZ_PATH%\*.mdmp" >nul 2>&1
    del /f /s /q "%DAYZ_PATH%\*.bidmp" >nul 2>&1
    del /f /s /q "%DAYZ_PATH%\*.dmp" >nul 2>&1
    echo [*] Removing .ADM admin and diagnostic logs...
    del /f /s /q "%DAYZ_PATH%\*.ADM" >nul 2>&1
    echo [*] Cleaning crash dump subfolders...
    for /d %%p in ("%DAYZ_PATH%\crash_*") do rmdir /s /q "%%p" >nul 2>&1
    echo.
    echo ==============================================================================
    echo [SUCCESS] DayZ logs and crash dumps have been cleaned successfully!
    echo ==============================================================================
) else (
    echo [!] No DayZ folder found at %DAYZ_PATH%
)
echo.
pause
goto MAIN_MENU

:CLEAN_LAUNCHER
cls
echo ==============================================================================
echo                    CLEANING LAUNCHER TEMPORARY CACHE
echo ==============================================================================
call :CHECK_PROCESSES
echo.
set "LAUNCHER_PATH=%localappdata%\DayZ Launcher"
set "BOHEMIA_PATH=%localappdata%\Bohemia Interactive"

if exist "%LAUNCHER_PATH%" (
    echo [*] Cleaning DayZ Launcher cache and logs...
    del /f /s /q "%LAUNCHER_PATH%\cache\*" >nul 2>&1
    del /f /s /q "%LAUNCHER_PATH%\logs\*" >nul 2>&1
    echo [+] DayZ Launcher cache cleared.
) else (
    echo [*] DayZ Launcher cache folder was empty or not found.
)

if exist "%BOHEMIA_PATH%" (
    echo [*] Cleaning Bohemia Interactive logs...
    del /f /s /q "%BOHEMIA_PATH%\*.log" >nul 2>&1
    echo [+] Bohemia Interactive temp logs cleared.
)

echo.
echo ==============================================================================
echo [SUCCESS] Launcher cleanup completed!
echo ==============================================================================
echo.
pause
goto MAIN_MENU

:CLEAN_SHADERS
cls
echo ==============================================================================
echo                    CLEANING GPU ^& DIRECTX SHADER CACHES
echo ==============================================================================
call :CHECK_PROCESSES
echo.
echo [*] Cleaning DirectX Shader Cache...
del /f /s /q "%localappdata%\D3DSCache\*" >nul 2>&1

echo [*] Cleaning NVIDIA Shader Cache...
del /f /s /q "%localappdata%\NVIDIA\DXCache\*" >nul 2>&1
del /f /s /q "%localappdata%\NVIDIA\GLCache\*" >nul 2>&1
del /f /s /q "%appdata%\NVIDIA\ComputeCache\*" >nul 2>&1

echo [*] Cleaning AMD Shader Cache...
del /f /s /q "%localappdata%\AMD\DxCache\*" >nul 2>&1
del /f /s /q "%localappdata%\AMD\GLCache\*" >nul 2>&1

echo.
echo ==============================================================================
echo [SUCCESS] Shader caches cleared! (Shaders will recompile cleanly in-game)
echo ==============================================================================
echo.
pause
goto MAIN_MENU

:CLEAN_ALL
cls
echo ==============================================================================
echo                    EXECUTING FULL DAYZ OPTIMIZATION
echo ==============================================================================
call :CHECK_PROCESSES
echo.
echo [1/3] Cleaning DayZ Logs and Crash Dumps...
set "DAYZ_PATH=%localappdata%\DayZ"
if exist "%DAYZ_PATH%" (
    del /f /s /q "%DAYZ_PATH%\*.log" >nul 2>&1
    del /f /s /q "%DAYZ_PATH%\*.RPT" >nul 2>&1
    del /f /s /q "%DAYZ_PATH%\*.mdmp" >nul 2>&1
    del /f /s /q "%DAYZ_PATH%\*.bidmp" >nul 2>&1
    del /f /s /q "%DAYZ_PATH%\*.dmp" >nul 2>&1
    del /f /s /q "%DAYZ_PATH%\*.ADM" >nul 2>&1
    for /d %%p in ("%DAYZ_PATH%\crash_*") do rmdir /s /q "%%p" >nul 2>&1
)

echo [2/3] Cleaning Launcher Cache...
set "LAUNCHER_PATH=%localappdata%\DayZ Launcher"
if exist "%LAUNCHER_PATH%" (
    del /f /s /q "%LAUNCHER_PATH%\cache\*" >nul 2>&1
    del /f /s /q "%LAUNCHER_PATH%\logs\*" >nul 2>&1
)
if exist "%localappdata%\Bohemia Interactive" (
    del /f /s /q "%localappdata%\Bohemia Interactive\*.log" >nul 2>&1
)

echo [3/3] Cleaning GPU and DirectX Shader Caches...
del /f /s /q "%localappdata%\D3DSCache\*" >nul 2>&1
del /f /s /q "%localappdata%\NVIDIA\DXCache\*" >nul 2>&1
del /f /s /q "%localappdata%\NVIDIA\GLCache\*" >nul 2>&1
del /f /s /q "%appdata%\NVIDIA\ComputeCache\*" >nul 2>&1
del /f /s /q "%localappdata%\AMD\DxCache\*" >nul 2>&1
del /f /s /q "%localappdata%\AMD\GLCache\*" >nul 2>&1

echo.
echo ==============================================================================
echo [SUCCESS] Full DayZ cleanup and optimization completed!
echo ==============================================================================
echo.
pause
goto MAIN_MENU

:OPEN_FOLDER
if exist "%localappdata%\DayZ" (
    start explorer.exe "%localappdata%\DayZ"
) else (
    echo.
    echo [!] Folder %localappdata%\DayZ does not exist.
    pause
)
goto MAIN_MENU

:EXIT_SCRIPT
cls
echo.
echo Thank you for using DayZFix!
echo.
timeout /t 2 >nul
exit /b 0
