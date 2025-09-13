@echo off
REM === Start FQM server (Windows) ===
setlocal ENABLEDELAYEDEXPANSION
cd /d "%~dp0"

REM Try local venv first, then user fallback
set "VENV_LOCAL=.venv\Scripts\activate"
set "VENV_USER=%USERPROFILE%\venvs\fqm\Scripts\activate"

if exist ".venv\Scripts\python.exe" (
  call "%VENV_LOCAL%"
) else if exist "%USERPROFILE%\venvs\fqm\Scripts\python.exe" (
  call "%VENV_USER%"
) else (
  echo [ERROR] No virtualenv found.
  echo Run the installer script you used earlier to create the venv (fixvenv or gevent).
  pause
  exit /b 1
)

set SECRET_KEY=change_me_later
REM Bind to all LAN interfaces so other PCs can access (adjust port if needed)
python run.py --ip 0.0.0.0 --port 5050
