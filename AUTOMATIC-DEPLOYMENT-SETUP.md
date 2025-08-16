# 🚀 AUTOMATIC DEPLOYMENT SETUP - DISASTERGUARD

## 🎯 **GOAL: Zero-Touch Deployments**

Once set up, your DISASTERGUARD application will automatically deploy every time you push code to GitHub!

## 📋 **SETUP STEPS**

### **Step 1: Initial Manual Setup (One-time only)**

#### **1.1 Deploy Backend to Render**
1. Go to https://render.com/new/web-service
2. Connect your GitHub repository: `HerveMucyo/DISASTERGUARD`
3. Configure:
   - **Name**: `DISASTERGUARD-backend`
   - **Root Directory**: `disaster-guard-backend`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT`
4. Add Environment Variables:
   - `DEBUG=False`
   - `DJANGO_SETTINGS_MODULE=backend.settings`
   - `SECRET_KEY=django-insecure-disasterguard-2024`
   - `ALLOWED_HOSTS=DISASTERGUARD-backend.onrender.com,localhost`
5. Click "Create Web Service"
6. **Copy the Service ID** from the URL (you'll need this for GitHub secrets)

#### **1.2 Deploy Frontend to Vercel**
1. Go to https://vercel.com/new
2. Import your GitHub repository: `HerveMucyo/DISASTERGUARD`
3. Configure:
   - **Framework**: Vite
   - **Root Directory**: `disaster-guard-frontend-with-react.js`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`
4. Add Environment Variable:
   - `VITE_API_URL=https://DISASTERGUARD-backend.onrender.com`
5. Click "Deploy"

### **Step 2: Get API Keys and Tokens**

#### **2.1 Render API Key**
1. Go to https://render.com/account/api-keys
2. Click "Create API Key"
3. Name it: `DISASTERGUARD-Deployment`
4. Copy the API key

#### **2.2 Vercel Tokens**
1. Go to https://vercel.com/account/tokens
2. Click "Create Token"
3. Name it: `DISASTERGUARD-Deployment`
4. Select "Full Account" scope
5. Copy the token

#### **2.3 Vercel Project & Org IDs**
1. Go to your Vercel project dashboard
2. Click "Settings" → "General"
3. Copy the "Project ID"
4. Copy the "Team ID" (this is your Org ID)

### **Step 3: Add GitHub Secrets**

1. Go to https://github.com/HerveMucyo/DISASTERGUARD/settings/secrets/actions
2. Click "New repository secret" for each of these:

| Secret Name | Value |
|-------------|-------|
| `RENDER_API_KEY` | Your Render API key |
| `RENDER_SERVICE_ID` | Your Render service ID |
| `VERCEL_TOKEN` | Your Vercel token |
| `VERCEL_ORG_ID` | Your Vercel team/org ID |
| `VERCEL_PROJECT_ID` | Your Vercel project ID |
| `VITE_API_URL` | `https://DISASTERGUARD-backend.onrender.com` |

### **Step 4: Push the GitHub Actions**

```bash
git add .
git commit -m "Add automatic deployment workflows"
git push origin main
```

## 🎉 **YOU'RE DONE!**

### **How It Works:**
- **Automatic Trigger**: Every push to `main` branch
- **Smart Detection**: Only deploys what changed
- **Zero Downtime**: Rolling deployments
- **Instant Updates**: Live in 2-3 minutes

### **Your Live URLs:**
- **Frontend**: https://DISASTERGUARD.vercel.app
- **Backend**: https://DISASTERGUARD-backend.onrender.com

### **Future Deployments:**
Just push your code:
```bash
git add .
git commit -m "Update feature"
git push origin main
```

**That's it!** Your app will automatically deploy in 2-3 minutes.

## 🔧 **Manual Deployment (Optional)**

If you need to manually trigger a deployment:
1. Go to https://github.com/HerveMucyo/DISASTERGUARD/actions
2. Click "Deploy DISASTERGUARD"
3. Click "Run workflow"
4. Choose what to deploy (frontend/backend/both)

## 📊 **Monitoring**

- **GitHub Actions**: https://github.com/HerveMucyo/DISASTERGUARD/actions
- **Render Dashboard**: https://render.com/dashboard
- **Vercel Dashboard**: https://vercel.com/dashboard

---

**🎯 Result: Professional CI/CD pipeline with zero maintenance!**
