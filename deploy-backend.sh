#!/bin/bash

echo "🚀 Deploying Disaster Guard Backend to Fly.io..."

# Check if fly CLI is installed
if ! command -v fly &> /dev/null; then
    echo "❌ Fly CLI is not installed. Please install it first:"
    echo "   https://fly.io/docs/hands-on/install-flyctl/"
    exit 1
fi

# Check if user is logged in to Fly.io
if ! fly auth whoami &> /dev/null; then
    echo "❌ Not logged in to Fly.io. Please run: fly auth login"
    exit 1
fi

# Create backend deployment directory
echo "📁 Creating backend deployment directory..."
mkdir -p disaster-guard-backend
cd disaster-guard-backend

# Copy backend files
echo "📋 Copying backend files..."
cp -r ../disaster-guard-management-system/backend/* .

# Create requirements.txt if it doesn't exist
if [ ! -f requirements.txt ]; then
    echo "📦 Creating requirements.txt..."
    echo "Django>=4.2.0
djangorestframework>=3.14.0
django-cors-headers>=4.0.0
gunicorn>=21.0.0
whitenoise>=6.5.0" > requirements.txt
fi

# Create Dockerfile
echo "🐳 Creating Dockerfile..."
cat > Dockerfile << 'EOF'
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose port
EXPOSE 8000

# Start the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "backend.wsgi:application"]
EOF

# Create fly.toml
echo "📄 Creating fly.toml..."
cat > fly.toml << 'EOF'
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

[env]
  DEBUG = "False"
  DJANGO_SETTINGS_MODULE = "backend.settings"
EOF

# Deploy to Fly.io
echo "🚀 Deploying to Fly.io..."
fly deploy

echo "✅ Backend deployment completed!"
echo "🌐 Your backend should be available at: https://disaster-guard-backend.fly.dev"
