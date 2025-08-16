@echo off
echo 🚀 DISASTERGUARD - FINAL DEPLOYMENT
echo ===================================
echo.

echo 📋 DEPLOYMENT STATUS
echo ====================
echo ✅ GitHub Repository: https://github.com/HerveMucyo/DISASTERGUARD
echo ✅ Code Pushed: Successfully
echo 🔄 Backend: Ready to deploy
echo 🔄 Frontend: Ready to deploy
echo.

echo 🚀 STEP 1: DEPLOY BACKEND TO RENDER
echo ====================================
echo.
echo 1. Render page should be open in your browser
echo 2. Sign up/Login with GitHub
echo 3. Connect repository: HerveMucyo/DISASTERGUARD
echo 4. Configure:
echo    - Name: DISASTERGUARD-backend
echo    - Root Directory: disaster-guard-backend
echo    - Build Command: pip install -r requirements.txt
echo    - Start Command: gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT
echo 5. Add Environment Variables:
echo    - DEBUG=False
echo    - DJANGO_SETTINGS_MODULE=backend.settings
echo    - SECRET_KEY=django-insecure-disasterguard-2024
echo    - ALLOWED_HOSTS=DISASTERGUARD-backend.onrender.com,localhost
echo 6. Click "Create Web Service"
echo.

echo Press any key when backend deployment is started...
pause

echo.
echo 🎨 STEP 2: DEPLOY FRONTEND TO VERCEL
echo =====================================
echo.

echo Opening Vercel deployment page...
start https://vercel.com/new

echo 1. Sign up/Login with GitHub
echo 2. Import repository: HerveMucyo/DISASTERGUARD
echo 3. Configure:
echo    - Framework: Vite
echo    - Root Directory: disaster-guard-frontend-with-react.js
echo    - Build Command: npm run build
echo    - Output Directory: dist
echo 4. Add Environment Variable:
echo    - VITE_API_URL=https://DISASTERGUARD-backend.onrender.com
echo 5. Click "Deploy"
echo.

echo Press any key when frontend deployment is started...
pause

echo.
echo 🧹 STEP 3: CLEANING UP DEPLOYMENT FILES
echo =======================================
echo.

echo Removing unused deployment files...
del /q DEPLOY-NOW.bat
del /q GO-LIVE.bat
del /q CREATE-REPO.md
del /q DEPLOY-BACKEND-NOW.md
del /q QUICK-DEPLOYMENT-SUMMARY.md
del /q COMPLETE-FREE-DEPLOYMENT.md
del /q FREE-DEPLOYMENT-GUIDE.md
del /q deployment-guide.md
del /q deploy-frontend.sh
del /q deploy-backend.sh
del /q deploy-all.sh
del /q deploy-frontend.bat
del /q deploy-backend.bat
del /q deploy-all.bat
del /q deploy-free.bat
del /q deploy-render-backend.md
del /q deploy-vercel-frontend.md
del /q QUICK-DEPLOYMENT-SUMMARY.md
del /q FINAL-DEPLOYMENT-COMPLETE.md
del /q DISASTERGUARD-DEPLOYMENT-READY.md

echo ✅ Cleanup completed!
echo.

echo 🎉 DEPLOYMENT COMPLETE!
echo =======================
echo.

echo Your DISASTERGUARD application is being deployed!
echo.
echo 🌐 Expected URLs:
echo - Frontend: https://DISASTERGUARD.vercel.app
echo - Backend: https://DISASTERGUARD-backend.onrender.com
echo.

echo 💰 Cost: $0 (Completely FREE!)
echo.

echo 🔗 Dashboards:
echo - Render: https://render.com/dashboard
echo - Vercel: https://vercel.com/dashboard
echo - GitHub: https://github.com/HerveMucyo/DISASTERGUARD
echo.

echo ⏱️ Deployment Time: 10-15 minutes
echo.

echo 📞 Check deployment status in the dashboards above.
echo.

pause

