@echo off
REM === FQM quick start (Windows) — with gevent ===
setlocal
cd /d "%~dp0"

if not exist requirements\main.txt (
  echo [ERROR] Run this inside the unzipped FQM-master folder.
  pause
  exit /b 1
)

echo [1/5] Creating Python 3.9 virtual environment...
py -3.9 -m venv .venv || py -m venv .venv || (echo [ERROR] Install Python 3.9+ && pause && exit /b 1)

echo [2/5] Activating venv and upgrading pip...
call .venv\Scripts\activate
python -m pip install --upgrade pip wheel setuptools

echo [3/5] Installing base requirements...
pip install -r requirements\main.txt

echo [3.1/5] Installing gevent (web server)...
pip install "greenlet>=3.0,<4.0" "gevent>=24.2,<25.0"

REM Optional: GUI; comment out if you don't need it
echo [3.2/5] (Optional) Installing PyQt5 for desktop UI...
pip install "PyQt5==5.15.9" || echo Skipping PyQt5; web UI will still work.

echo [4/5] Starting FQM on http://127.0.0.1:5050 ...
set SECRET_KEY=change_me_later

REM Avoid any POSIX-only 'touch' calls the app might attempt
set FQM_NO_TOUCH=1

python run.py --ip 127.0.0.1 --port 5050
