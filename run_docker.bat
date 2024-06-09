@echo off

REM Checking if Docker is installed and running
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker is not installed or not running.
    exit /b 1
)

REM Checking if Docker image exists
docker images flask-app >nul 2>&1
if %errorlevel% equ 0 (
    echo Docker image already exists.
) else (
    REM Building Docker container
    echo Building Docker container...
    docker build -t flask-app .
)

REM Checking if Docker container exists
docker ps -a --format "{{.Names}}" | findstr /C:"flask-container" >nul 2>&1
if %errorlevel% equ 0 (
    echo Docker container already exists. Stopping the previous container...
    docker stop flask-container >nul 2>&1
    docker rm flask-container >nul 2>&1
)

REM Starting Docker container
echo Starting Docker container...
docker run -d -p 5000:5000 --name flask-container flask-app

REM Displaying a message indicating successful launch
echo Docker container has been started successfully.
