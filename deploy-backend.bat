@echo off
echo 🚀 Deploying Disaster Guard Backend to Fly.io...

REM Check if fly CLI is installed
flyctl --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Fly CLI is not installed. Please install it first:
    echo    https://fly.io/docs/hands-on/install-flyctl/
    pause
    exit /b 1
)

REM Check if user is logged in to Fly.io
flyctl auth whoami >nul 2>&1
if errorlevel 1 (
    echo ❌ Not logged in to Fly.io. Please run: flyctl auth login
    pause
    exit /b 1
)

REM Create backend deployment directory
echo 📁 Creating backend deployment directory...
if not exist disaster-guard-backend mkdir disaster-guard-backend
cd disaster-guard-backend

REM Copy backend files
echo 📋 Copying backend files...
xcopy /E /I /Y ..\disaster-guard-management-system\backend\* .

REM Create requirements.txt if it doesn't exist
if not exist requirements.txt (
    echo 📦 Creating requirements.txt...
    echo Django>=4.2.0 > requirements.txt
    echo djangorestframework>=3.14.0 >> requirements.txt
    echo django-cors-headers>=4.0.0 >> requirements.txt
    echo gunicorn>=21.0.0 >> requirements.txt
    echo whitenoise>=6.5.0 >> requirements.txt
)

REM Create Dockerfile
echo 🐳 Creating Dockerfile...
(
echo FROM python:3.11-slim
echo.
echo WORKDIR /app
echo.
echo # Install system dependencies
echo RUN apt-get update ^&^& apt-get install -y \
echo     gcc \
echo     ^&^& rm -rf /var/lib/apt/lists/*
echo.
echo # Copy requirements and install Python dependencies
echo COPY requirements.txt .
echo RUN pip install --no-cache-dir -r requirements.txt
echo.
echo # Copy application code
echo COPY . .
echo.
echo # Collect static files
echo RUN python manage.py collectstatic --noinput
echo.
echo # Expose port
echo EXPOSE 8000
echo.
echo # Start the application
echo CMD ["gunicorn", "--bind", "0.0.0.0:8000", "backend.wsgi:application"]
) > Dockerfile

REM Create fly.toml
echo 📄 Creating fly.toml...
(
echo app = "disaster-guard-backend"
echo primary_region = "cdg"
echo.
echo [build]
echo.
echo [http_service]
echo   internal_port = 8000
echo   force_https = true
echo   auto_stop_machines = true
echo   auto_start_machines = true
echo   min_machines_running = 0
echo   processes = ['app']
echo.
echo [[vm]]
echo   size = 'shared-cpu-1x'
echo.
echo [env]
echo   DEBUG = "False"
echo   DJANGO_SETTINGS_MODULE = "backend.settings"
) > fly.toml

REM Deploy to Fly.io
echo 🚀 Deploying to Fly.io...
call flyctl deploy

echo ✅ Backend deployment completed!
echo 🌐 Your backend should be available at: https://disaster-guard-backend.fly.dev
pause
