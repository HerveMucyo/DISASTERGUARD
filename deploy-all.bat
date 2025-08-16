@echo off
echo 🚀 Disaster Guard - Complete Deployment Script
echo ==============================================

REM Check if fly CLI is installed
fly --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Fly CLI is not installed. Please install it first:
    echo    https://fly.io/docs/hands-on/install-flyctl/
    pause
    exit /b 1
)

REM Check if user is logged in to Fly.io
fly auth whoami >nul 2>&1
if errorlevel 1 (
    echo ❌ Not logged in to Fly.io. Please run: fly auth login
    pause
    exit /b 1
)

echo ✅ Fly CLI is installed and you're logged in!

REM Deploy Backend First
echo.
echo 🔧 Step 1: Deploying Backend...
call deploy-backend.bat

if errorlevel 1 (
    echo ❌ Backend deployment failed!
    pause
    exit /b 1
)

echo ✅ Backend deployed successfully!

REM Wait a moment for backend to be ready
echo ⏳ Waiting for backend to be ready...
timeout /t 10 /nobreak >nul

REM Deploy Frontend
echo.
echo 🎨 Step 2: Deploying Frontend...
call deploy-frontend.bat

if errorlevel 1 (
    echo ❌ Frontend deployment failed!
    pause
    exit /b 1
)

echo ✅ Frontend deployed successfully!

echo.
echo 🎉 Deployment Complete!
echo ======================
echo 🌐 Frontend: https://policy.fly.dev
echo 🔧 Backend:  https://disaster-guard-backend.fly.dev
echo.
echo 📝 Next Steps:
echo 1. Update your frontend environment variables to point to the backend URL
echo 2. Test your application
echo 3. Set up any additional environment variables in Fly.io dashboard
echo.
echo 🔗 Fly.io Dashboard: https://fly.io/apps
pause
