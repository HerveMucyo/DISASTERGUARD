# 🚀 Free Deployment Options for Disaster Guard Project

Since Fly.io requires payment information even for free tier, here are alternative **completely free** hosting options:

## Option 1: Railway (Recommended - $5 Free Credit)

### Backend Deployment on Railway:

1. **Sign up for Railway**:
   - Go to https://railway.app
   - Sign up with GitHub (no payment required)

2. **Deploy Backend**:
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your repository
   - Select the `disaster-guard-backend` folder
   - Railway will auto-detect Django and deploy

3. **Get Your Backend URL**:
   - Railway will provide a URL like: `https://your-app-name.railway.app`

### Frontend Deployment on Vercel:

1. **Sign up for Vercel**:
   - Go to https://vercel.com
   - Sign up with GitHub

2. **Deploy Frontend**:
   - Click "New Project"
   - Import your GitHub repository
   - Set root directory to: `disaster-guard-frontend-with-react.js`
   - Build command: `npm run build`
   - Output directory: `dist`
   - Deploy!

## Option 2: Render (Free Tier - 750 hours/month)

### Backend on Render:

1. **Sign up**: https://render.com
2. **Create Web Service**:
   - Connect GitHub repo
   - Select backend directory
   - Build command: `pip install -r requirements.txt`
   - Start command: `gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT`

### Frontend on Netlify:

1. **Sign up**: https://netlify.com
2. **Deploy**:
   - Drag & drop your `dist` folder after building
   - Or connect GitHub repo

## Option 3: Heroku (Free Tier - Limited)

### Backend on Heroku:

1. **Sign up**: https://heroku.com
2. **Deploy**:
   ```bash
   heroku create your-app-name
   git push heroku main
   ```

## Option 4: PythonAnywhere (Free Tier)

### Backend on PythonAnywhere:

1. **Sign up**: https://pythonanywhere.com
2. **Upload files** and configure WSGI

## Quick Deployment Commands

### For Railway (Backend):
```bash
# Install Railway CLI
npm install -g @railway/cli

# Login
railway login

# Deploy
cd disaster-guard-backend
railway up
```

### For Vercel (Frontend):
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
cd disaster-guard-frontend-with-react.js
vercel
```

## Environment Variables Setup

### Backend Environment Variables:
```env
DEBUG=False
ALLOWED_HOSTS=your-domain.com,localhost
SECRET_KEY=your-secret-key
DATABASE_URL=sqlite:///db.sqlite3
```

### Frontend Environment Variables:
```env
VITE_API_URL=https://your-backend-url.com
```

## Database Options

1. **SQLite** (Free, included)
2. **Railway Postgres** (Free tier)
3. **Render Postgres** (Free tier)
4. **Supabase** (Free tier)

## Cost Comparison

| Platform | Backend | Frontend | Database | Cost |
|----------|---------|----------|----------|------|
| Railway + Vercel | ✅ | ✅ | ✅ | $5 free credit |
| Render + Netlify | ✅ | ✅ | ✅ | Free (750h) |
| Heroku | ✅ | ✅ | ✅ | Free (limited) |
| PythonAnywhere | ✅ | ❌ | ✅ | Free |

## Recommended Setup

**For your project, I recommend:**
1. **Backend**: Railway (easy deployment, good free tier)
2. **Frontend**: Vercel (excellent for React apps)
3. **Database**: Railway Postgres or SQLite

## Next Steps

1. Choose your preferred platform
2. Follow the deployment steps above
3. Update your frontend API URL to point to your backend
4. Test your application

Would you like me to help you deploy to any of these platforms?
