@echo off
cd /d "%~dp0"
echo.
echo Starting a local preview server from this folder.
echo Your browser will open at:
echo.
echo        http://localhost:8000
echo.
echo Leave THIS window open while previewing. Close it to stop the server.
echo (If the browser shows an error, wait a second and refresh.)
echo.

where py >nul 2>nul
if %errorlevel%==0 (
    start "" http://localhost:8000
    py -m http.server 8000
    goto :end
)

where python >nul 2>nul
if %errorlevel%==0 (
    start "" http://localhost:8000
    python -m http.server 8000
    goto :end
)

echo --------------------------------------------------------
echo Could not find Python on this PC, so this method won't work.
echo Tell Claude what you have installed (VS Code? Node? nothing?)
echo and you'll get an alternative that needs no typing.
echo --------------------------------------------------------

:end
pause
