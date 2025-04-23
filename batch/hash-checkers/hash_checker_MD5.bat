@echo off
setlocal enabledelayedexpansion

:start
cls
:: Set the directory to the default Downloads folder for the current user
set "download_dir=C:\Users\%USERNAME%\Downloads"

:: Find the latest file in the directory
for /f "delims=" %%i in ('dir /b /a-d /o-d "%download_dir%\*"') do (
    set "file=%download_dir%\%%i"
    goto :found
)

:found
echo Latest downloaded file found: %file%

:: Get expected MD5 hash from the user
set /p "md5_expected=Enter the expected MD5 hash: "

:: Calculate MD5 hash using PowerShell
for /f "tokens=* usebackq" %%i in (`powershell -command "Get-FileHash -Algorithm MD5 -Path '%file%' | Select-Object -ExpandProperty Hash"`) do (
    set "md5_hash=%%i"
)

:: Display calculated and expected hashes
echo.
echo =======================
echo MD5 Hash:
echo Expected:    %md5_expected%
echo Calculated:  %md5_hash%
echo =======================

:: Compare MD5
if /i "%md5_hash%"=="%md5_expected%" (
    color 2f
    echo MD5 hash matches.
) else (
    color 4f
    echo MD5 hash does not match.
)

:menu
echo.
echo =======================
echo Do you want to re-do the test or close the program?
echo 1. Re-do the test
echo 2. Close
echo =======================
set /p "choice=Enter your choice (1 or 2): "

if "%choice%"=="1" (
    goto start
) else if "%choice%"=="2" (
    exit
) else (
    echo Invalid choice, please enter 1 or 2.
    goto menu
)

pause
