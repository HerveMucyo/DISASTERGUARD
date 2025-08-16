# 🚀 Complete FREE Deployment Guide for Disaster Guard

## 📋 Prerequisites Checklist

- [ ] GitHub account
- [ ] Your project files ready
- [ ] No payment information needed!

## 🎯 Step 1: Get Your Project on GitHub

### Option A: Using GitHub Desktop (Recommended)
1. Download GitHub Desktop: https://desktop.github.com/
2. Install and sign in with your GitHub account
3. Click "Clone a repository from the Internet"
4. Create a new repository named `DISASTERGUARD`
5. Choose your local path: `C:\Users\Herve\Desktop\new`
6. Click "Create Repository"
7. Add all files and commit with message: "Initial commit"
8. Click "Push origin"

### Option B: Using Git Commands
```bash
# Initialize git repository
git init

# Add all files
git add .

# Commit files
git commit -m "Initial commit"

# Create repository on GitHub.com first, then:
git remote add origin https://github.com/your-username/DISASTERGUARD.git
git branch -M main
git push -u origin main
```

## 🎯 Step 2: Deploy Backend to Render (FREE)

### 1. Sign up for Render
- Go to https://render.com
- Click "Get Started for Free"
- Sign up with your GitHub account

### 2. Create Web Service
1. Click "New +" button
2. Select "Web Service"
3. Connect your GitHub repository
4. Choose your repository: `your-username/DISASTERGUARD`

### 3. Configure the Service
- **Name**: `DISASTERGUARD-backend`
- **Root Directory**: `disaster-guard-backend`
- **Environment**: `Python 3`
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT`

### 4. Environment Variables
Add these in Render dashboard:
```
DEBUG=False
DJANGO_SETTINGS_MODULE=backend.settings
SECRET_KEY=django-insecure-your-secret-key-here
ALLOWED_HOSTS=your-app-name.onrender.com,localhost
```

### 5. Deploy
- Click "Create Web Service"
- Wait 5-10 minutes for deployment
- Your backend URL: `https://your-app-name.onrender.com`

## 🎯 Step 3: Deploy Frontend to Vercel (FREE)

### 1. Sign up for Vercel
- Go to https://vercel.com
- Click "Sign Up"
- Sign up with your GitHub account

### 2. Import Project
1. Click "New Project"
2. Import your GitHub repository
3. Select your repository: `your-username/DISASTERGUARD`

### 3. Configure the Project
- **Framework Preset**: `Vite`
- **Root Directory**: `disaster-guard-frontend-with-react.js`
- **Build Command**: `npm run build`
- **Output Directory**: `dist`
- **Install Command**: `npm install`

### 4. Environment Variables
Add this environment variable:
```
VITE_API_URL=https://your-backend-url.onrender.com
```

### 5. Deploy
- Click "Deploy"
- Wait 2-3 minutes for deployment
- Your frontend URL: `https://your-app-name.vercel.app`

## 🌐 Your Live URLs

After deployment, your app will be available at:
- **Frontend**: https://your-app-name.vercel.app
- **Backend**: https://your-app-name.onrender.com

## 💰 Cost Breakdown

| Service | Plan | Cost | Limits |
|---------|------|------|--------|
| Render (Backend) | Free | $0 | 750 hours/month |
| Vercel (Frontend) | Free | $0 | Unlimited |
| **Total** | **FREE** | **$0** | **No payment required** |

## 🔧 Post-Deployment Setup

### 1. Test Your Backend
Visit your backend URL and check if Django is running.

### 2. Test Your Frontend
Visit your frontend URL and test all features.

### 3. Update API URLs
Make sure your frontend is calling the correct backend URL.

### 4. Set up Database (Optional)
- Use SQLite (included, no setup needed)
- Or add PostgreSQL on Render (free tier)

## 🆘 Troubleshooting

### Common Issues:

1. **Build fails on Render**:
   - Check requirements.txt is correct
   - Verify Python version compatibility

2. **Build fails on Vercel**:
   - Check package.json has correct scripts
   - Verify all dependencies are listed

3. **Frontend can't connect to backend**:
   - Check CORS settings in Django
   - Verify environment variables

4. **App not accessible**:
   - Check deployment logs
   - Verify environment variables are set

## 📞 Support Resources

- **Render Documentation**: https://render.com/docs
- **Vercel Documentation**: https://vercel.com/docs
- **GitHub Help**: https://help.github.com

## 🎉 Success!

Once deployed, your Disaster Guard application will be:
- ✅ Live and accessible worldwide
- ✅ Completely free to host
- ✅ Automatically updated when you push to GitHub
- ✅ SSL/HTTPS enabled
- ✅ Professional-grade hosting

---

**🚀 Ready to deploy? Follow the steps above and your app will be live in under 30 minutes!**
