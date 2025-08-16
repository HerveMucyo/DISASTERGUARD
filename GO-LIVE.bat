@echo off
echo 🚀 DISASTER GUARD - GOING LIVE!
echo ================================
echo.

echo 📋 FINAL DEPLOYMENT CHECKLIST
echo =============================
echo.

echo ✅ Step 1: GitHub Setup
echo ------------------------
echo 1. Go to https://github.com
echo 2. Create new repository: DISASTERGUARD
echo 3. Upload your project files
echo 4. Make sure all files are committed
echo.

echo ✅ Step 2: Backend Deployment (Render)
echo --------------------------------------
echo 1. Go to https://render.com
echo 2. Sign up with GitHub
echo 3. Click "New +" → "Web Service"
echo 4. Connect your repository
echo 5. Configure:
echo    - Name: DISASTERGUARD-backend
echo    - Root Directory: disaster-guard-backend
echo    - Build Command: pip install -r requirements.txt
echo    - Start Command: gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT
echo 6. Add Environment Variables:
echo    - DEBUG=False
echo    - DJANGO_SETTINGS_MODULE=backend.settings
echo    - SECRET_KEY=django-insecure-your-secret-key-here
echo    - ALLOWED_HOSTS=your-app-name.onrender.com,localhost
echo 7. Click "Create Web Service"
echo 8. Wait 5-10 minutes for deployment
echo 9. Copy your backend URL
echo.

echo ✅ Step 3: Frontend Deployment (Vercel)
echo ---------------------------------------
echo 1. Go to https://vercel.com
echo 2. Sign up with GitHub
echo 3. Click "New Project"
echo 4. Import your repository
echo 5. Configure:
echo    - Framework: Vite
echo    - Root Directory: disaster-guard-frontend-with-react.js
echo    - Build Command: npm run build
echo    - Output Directory: dist
echo 6. Add Environment Variable:
echo    - VITE_API_URL=https://your-backend-url.onrender.com
echo 7. Click "Deploy"
echo 8. Wait 2-3 minutes for deployment
echo.

echo 🌐 Your Live URLs
echo =================
echo - Backend: https://your-app-name.onrender.com
echo - Frontend: https://your-app-name.vercel.app
echo.

echo 🎉 CONGRATULATIONS!
echo ===================
echo Your Disaster Guard app is now LIVE and accessible worldwide!
echo.

echo 💰 Cost: $0 (Completely FREE!)
echo.

echo 🔗 Quick Links:
echo - Render Dashboard: https://render.com/dashboard
echo - Vercel Dashboard: https://vercel.com/dashboard
echo - GitHub Repository: https://github.com/your-username/DISASTERGUARD
echo.

echo 📞 Need Help?
echo - Check deployment logs in Render/Vercel dashboards
echo - Verify environment variables are set correctly
echo - Test your app functionality
echo.

echo ⚡ Ready to go live? Follow the steps above!
echo.

pause
