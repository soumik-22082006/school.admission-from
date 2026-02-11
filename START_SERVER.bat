@echo off
color 0A
title School Admission System - Local Server
cls

echo.
echo ╔═══════════════════════════════════════════════════════════╗
echo ║     SCHOOL ADMISSION SYSTEM - STARTUP                     ║
echo ║     Rampurhat High School                                 ║
echo ╚═══════════════════════════════════════════════════════════╝
echo.
echo Starting local web server...
echo.

REM Get the current directory
cd /d "%~dp0"

REM Start PowerShell web server
echo Opening browser in 2 seconds...
timeout /t 2 /nobreak

REM Open browser
start http://localhost:8080

REM Start simple HTTP server using PowerShell
PowerShell -Command "$listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://localhost:8080/'); $listener.Start(); Write-Host '✅ Server running at http://localhost:8080'; Write-Host 'Press Ctrl+C to stop'; while($listener.IsListening) { $context = $listener.GetContext(); $request = $context.Request; $response = $context.Response; $file = [System.IO.Path]::Combine('$PWD', $request.Url.LocalPath.TrimStart('/')); if([System.IO.File]::Exists($file)) { [byte[]]$buffer = [System.IO.File]::ReadAllBytes($file); $response.ContentLength64 = $buffer.Length; $response.OutputStream.Write($buffer, 0, $buffer.Length); } else { $response.StatusCode = 404; } $response.OutputStream.Close() }"

pause
