# Disaster Guard Project Deployment Guide

## Overview
This project consists of:
- **Frontend**: React + Vite application
- **Backend**: Django REST API

## Deployment Options

### Option 1: Fly.io (Recommended - Free Tier)

#### Prerequisites
1. Install Fly CLI: https://fly.io/docs/hands-on/install-flyctl/
2. Sign up at https://fly.io
3. Login: `fly auth login`

#### Frontend Deployment (Already configured)

1. Navigate to frontend directory:
```bash
cd disaster-guard-frontend-with-react.js
```

2. Deploy to Fly.io:
```bash
fly deploy
```

3. Your app will be available at: `https://policy.fly.dev`

#### Backend Deployment

1. Create a new directory for backend deployment:
```bash
mkdir disaster-guard-backend
cd disaster-guard-backend
```

2. Create requirements.txt:
```bash
pip freeze > requirements.txt
```

3. Create Dockerfile for Django:
```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
```

4. Create fly.toml:
```toml
app = "disaster-guard-backend"
primary_region = "cdg"

[build]

[http_service]
  internal_port = 8000
  force_https = true
  auto_stop_machines = true
  auto_start_machines = true
  min_machines_running = 0
  processes = ['app']

[[vm]]
  size = 'shared-cpu-1x'
```

5. Deploy:
```bash
fly deploy
```

### Option 2: Vercel (Frontend) + Railway (Backend)

#### Frontend on Vercel
1. Install Vercel CLI: `npm i -g vercel`
2. Navigate to frontend directory
3. Run: `vercel`
4. Follow prompts

#### Backend on Railway
1. Go to https://railway.app
2. Connect your GitHub repository
3. Select the backend directory
4. Railway will auto-detect Django and deploy

### Option 3: Netlify (Frontend) + Render (Backend)

#### Frontend on Netlify
1. Go to https://netlify.com
2. Drag and drop your `dist` folder after building
3. Or connect GitHub repository

#### Backend on Render
1. Go to https://render.com
2. Create new Web Service
3. Connect your repository
4. Set build command: `pip install -r requirements.txt`
5. Set start command: `gunicorn backend.wsgi:application`

## Environment Variables

### Frontend (.env)
```env
VITE_API_URL=https://your-backend-url.com
```

### Backend (.env)
```env
DEBUG=False
ALLOWED_HOSTS=your-domain.com,localhost
DATABASE_URL=your-database-url
SECRET_KEY=your-secret-key
```

## Database Setup

For production, consider using:
- **PostgreSQL**: Railway, Render, or Fly.io Postgres
- **SQLite**: Good for small projects (already configured)

## SSL/HTTPS
- Fly.io: Automatic
- Vercel: Automatic
- Netlify: Automatic
- Railway: Automatic
- Render: Automatic

## Monitoring
- Fly.io: Built-in monitoring
- Vercel: Analytics included
- Railway: Logs and metrics
- Render: Logs and metrics

## Cost Estimation
- **Fly.io**: Free tier (3 shared-cpu-1x, 3GB persistent volume)
- **Vercel**: Free tier (100GB bandwidth)
- **Railway**: Free tier ($5 credit)
- **Render**: Free tier (750 hours/month)

## Quick Start Commands

```bash
# Deploy frontend to Fly.io
cd disaster-guard-frontend-with-react.js
fly deploy

# Deploy backend to Fly.io
cd disaster-guard-backend
fly deploy

# Build frontend locally
cd disaster-guard-frontend-with-react.js
npm run build

# Run backend locally
cd disaster-guard-management-system/backend
python manage.py runserver
```
