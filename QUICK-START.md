# 🚀 Quick Start - Deploy Your Disaster Guard Project

## Prerequisites

1. **Install Fly CLI** (if not already installed):
   - Windows: Download from https://fly.io/docs/hands-on/install-flyctl/
   - Or run: `iwr https://fly.io/install.ps1 -useb | iex`

2. **Sign up for Fly.io**:
   - Go to https://fly.io
   - Create a free account

3. **Login to Fly CLI**:
   ```bash
   fly auth login
   ```

## 🎯 One-Click Deployment (Windows)

Simply double-click one of these files:

- **`deploy-all.bat`** - Deploy both frontend and backend (Recommended)
- **`deploy-frontend.bat`** - Deploy only the frontend
- **`deploy-backend.bat`** - Deploy only the backend

## 🔧 Manual Deployment Steps

### Option 1: Deploy Everything at Once
```bash
# Run the complete deployment script
deploy-all.bat
```

### Option 2: Deploy Step by Step

1. **Deploy Backend First**:
   ```bash
   deploy-backend.bat
   ```

2. **Deploy Frontend**:
   ```bash
   deploy-frontend.bat
   ```

## 🌐 Your Deployed URLs

After successful deployment, your applications will be available at:

- **Frontend**: https://policy.fly.dev
- **Backend**: https://disaster-guard-backend.fly.dev

## ⚙️ Post-Deployment Setup

1. **Update Frontend API URL**:
   - In your frontend code, update the API base URL to point to your backend
   - Example: `https://disaster-guard-backend.fly.dev/api/`

2. **Set Environment Variables** (if needed):
   - Go to https://fly.io/apps
   - Select your app
   - Go to "Secrets" tab
   - Add any required environment variables

3. **Test Your Application**:
   - Visit your frontend URL
   - Test all features
   - Check backend API endpoints

## 🆘 Troubleshooting

### Common Issues:

1. **"Fly CLI not found"**:
   - Install Fly CLI: https://fly.io/docs/hands-on/install-flyctl/

2. **"Not logged in"**:
   - Run: `fly auth login`

3. **Deployment fails**:
   - Check the error messages
   - Ensure all files are present
   - Try deploying backend first, then frontend

4. **App not accessible**:
   - Check Fly.io dashboard: https://fly.io/apps
   - Look for any error messages
   - Check logs: `fly logs`

## 📞 Support

- **Fly.io Documentation**: https://fly.io/docs/
- **Fly.io Community**: https://community.fly.io/
- **Project Issues**: Check your project's issue tracker

## 💰 Cost

- **Free Tier**: 3 shared-cpu-1x machines, 3GB persistent volume
- **Perfect for**: Development, testing, small production apps
- **Upgrade**: When you need more resources

---

**🎉 Congratulations!** Your Disaster Guard project is now deployed and accessible worldwide!
