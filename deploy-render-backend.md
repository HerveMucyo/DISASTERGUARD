# 🚀 Deploy Backend to Render (FREE)

## Step-by-Step Guide

### 1. Sign up for Render
- Go to https://render.com
- Click "Get Started for Free"
- Sign up with your GitHub account (no payment required)

### 2. Create New Web Service
1. Click "New +" button
2. Select "Web Service"
3. Connect your GitHub repository
4. Choose your repository: `your-username/your-repo-name`

### 3. Configure the Service
- **Name**: `disaster-guard-backend`
- **Root Directory**: `disaster-guard-backend`
- **Environment**: `Python 3`
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT`

### 4. Environment Variables
Add these environment variables in Render dashboard:
```
DEBUG=False
DJANGO_SETTINGS_MODULE=backend.settings
SECRET_KEY=your-secret-key-here
ALLOWED_HOSTS=your-app-name.onrender.com,localhost
```

### 5. Deploy
- Click "Create Web Service"
- Render will automatically deploy your app
- Your backend will be available at: `https://your-app-name.onrender.com`

### 6. Test Your Backend
Visit your backend URL to make sure it's working!

---
**Your backend will be live in about 5-10 minutes!**
