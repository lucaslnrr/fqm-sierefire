@echo off
REM === FQM quick start (Windows) ===
REM Usage: place this file INSIDE the unzipped FQM-master folder and double-click.

setlocal
cd /d "%~dp0"

if not exist requirements\main.txt (
  echo [ERROR] This script must be run from inside the FQM-master folder.
  pause
  exit /b 1
)

echo [1/4] Creating Python 3.9 virtual environment...
py -3.9 -m venv .venv || (
  echo Python 3.9 not found via 'py -3.9'. Trying default 'py'...
  py -m venv .venv || (
    echo [ERROR] Could not create a virtualenv. Please install Python 3.9+ from python.org.
    pause
    exit /b 1
  )
)

echo [2/4] Activating venv and upgrading pip...
call .venv\Scripts\activate
python -m pip install --upgrade pip

echo [3/4] Installing dependencies (this may take a few minutes)...
pip install -r requirements\main.txt

echo [4/4] Starting FQM on http://127.0.0.1:5050 ...
set SECRET_KEY=change_me_later
python run.py --ip 127.0.0.1 --port 5050
