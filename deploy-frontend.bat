@echo off
echo 🚀 Deploying Disaster Guard Frontend to Fly.io...

REM Navigate to frontend directory
cd disaster-guard-frontend-with-react.js

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

REM Install dependencies
echo 📦 Installing dependencies...
call npm install

REM Build the project
echo 🔨 Building the project...
call npm run build

REM Deploy to Fly.io
echo 🚀 Deploying to Fly.io...
call flyctl deploy

echo ✅ Frontend deployment completed!
echo 🌐 Your app should be available at: https://policy.fly.dev
pause
