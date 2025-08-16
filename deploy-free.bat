@echo off
echo 🚀 Disaster Guard - FREE Deployment Guide
echo =========================================

echo.
echo 📋 Prerequisites:
echo 1. Your project must be on GitHub
echo 2. You need a GitHub account
echo 3. No payment information required!
echo.

echo 🎯 Deployment Options:
echo.
echo 1. Backend: Render (FREE - 750 hours/month)
echo 2. Frontend: Vercel (FREE - Unlimited)
echo.

echo 📖 Step-by-Step Instructions:
echo.
echo 🔧 BACKEND DEPLOYMENT (Render):
echo 1. Go to https://render.com
echo 2. Sign up with GitHub
echo 3. Click "New +" → "Web Service"
echo 4. Connect your GitHub repo
echo 5. Configure:
echo    - Name: disaster-guard-backend
echo    - Root Directory: disaster-guard-backend
echo    - Build Command: pip install -r requirements.txt
echo    - Start Command: gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT
echo 6. Add Environment Variables:
echo    - DEBUG=False
echo    - DJANGO_SETTINGS_MODULE=backend.settings
echo    - SECRET_KEY=your-secret-key
echo 7. Click "Create Web Service"
echo.

echo 🎨 FRONTEND DEPLOYMENT (Vercel):
echo 1. Go to https://vercel.com
echo 2. Sign up with GitHub
echo 3. Click "New Project"
echo 4. Import your GitHub repo
echo 5. Configure:
echo    - Framework: Vite
echo    - Root Directory: disaster-guard-frontend-with-react.js
echo    - Build Command: npm run build
echo    - Output Directory: dist
echo 6. Add Environment Variable:
echo    - VITE_API_URL=https://your-backend-url.onrender.com
echo 7. Click "Deploy"
echo.

echo 🌐 Your URLs After Deployment:
echo - Backend: https://your-app-name.onrender.com
echo - Frontend: https://your-app-name.vercel.app
echo.

echo 💰 Cost: COMPLETELY FREE!
echo - Render: 750 hours/month free
echo - Vercel: Unlimited free tier
echo.

echo 📝 Next Steps:
echo 1. Follow the steps above
echo 2. Update your frontend API URL to point to your backend
echo 3. Test your application
echo.

echo 🔗 Useful Links:
echo - Render: https://render.com
echo - Vercel: https://vercel.com
echo - Your GitHub repo: (upload your project first)
echo.

echo ⚠️  IMPORTANT: Make sure your project is on GitHub first!
echo.

pause
