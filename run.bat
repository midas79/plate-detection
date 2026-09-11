@echo off
REM Setup dan run Streamlit Plate Detection App

echo ================================
echo Plate Detection - Streamlit Setup
echo ================================
echo.

REM Check Python installation
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found. Please install Python 3.8+
    pause
    exit /b 1
)

echo [OK] Python found
echo.

REM Check if virtual environment exists
if not exist "venv" (
    echo [INFO] Creating virtual environment...
    python -m venv venv
    echo [OK] Virtual environment created
)

REM Activate virtual environment
echo [INFO] Activating virtual environment...
call venv\Scripts\activate.bat

REM Install dependencies
echo [INFO] Installing dependencies...
pip install -q -r requirements.txt
echo [OK] Dependencies installed

REM Run Streamlit app
echo.
echo ================================
echo Starting Streamlit Application
echo ================================
echo.
echo Access the app at: http://localhost:8501
echo Press Ctrl+C to stop
echo.

streamlit run app.py
pause
