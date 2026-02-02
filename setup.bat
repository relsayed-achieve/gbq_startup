@echo off
REM =============================================================================
REM GBQ Streamlit Dashboard - Setup Script for Windows
REM =============================================================================
REM This script automates the setup process for Windows users.
REM 
REM Usage: Double-click this file or run: setup.bat
REM =============================================================================

echo ==========================================
echo   GBQ Streamlit Dashboard Setup
echo ==========================================
echo.

REM Check for Python
echo Checking for Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo    ERROR: Python not found!
    echo    Please install Python from https://www.python.org/downloads/
    echo    IMPORTANT: Check "Add Python to PATH" during installation
    pause
    exit /b 1
)
python --version
echo    OK: Python found

REM Create virtual environment
echo.
echo Creating virtual environment...
if exist "venv" (
    echo    WARNING: venv already exists, skipping creation
) else (
    python -m venv venv
    echo    OK: Virtual environment created
)

REM Activate virtual environment
echo.
echo Activating virtual environment...
call venv\Scripts\activate.bat
echo    OK: Activated

REM Upgrade pip
echo.
echo Upgrading pip...
python -m pip install --upgrade pip --quiet
echo    OK: pip upgraded

REM Install dependencies
echo.
echo Installing dependencies...
pip install -r requirements.txt --quiet
echo    OK: All dependencies installed

REM Check for gcloud
echo.
echo Checking for Google Cloud SDK...
gcloud --version >nul 2>&1
if %errorlevel% neq 0 (
    echo    WARNING: Google Cloud SDK not found!
    echo    Install it from: https://cloud.google.com/sdk/docs/install
    echo.
    echo    You can still run the app, but you'll need to use
    echo    JSON key authentication instead of browser auth.
) else (
    echo    OK: Google Cloud SDK found
)

echo.
echo ==========================================
echo   Setup Complete!
echo ==========================================
echo.
echo Next steps:
echo.
echo   1. Activate the virtual environment (if not already):
echo      venv\Scripts\activate
echo.
echo   2. Authenticate with Google Cloud:
echo      gcloud auth application-default login
echo.
echo   3. Run the app:
echo      streamlit run app.py
echo.
echo ==========================================
pause
