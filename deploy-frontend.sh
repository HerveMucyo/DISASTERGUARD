#!/bin/bash

echo "🚀 Deploying Disaster Guard Frontend to Fly.io..."

# Navigate to frontend directory
cd disaster-guard-frontend-with-react.js

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

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Build the project
echo "🔨 Building the project..."
npm run build

# Deploy to Fly.io
echo "🚀 Deploying to Fly.io..."
fly deploy

echo "✅ Frontend deployment completed!"
echo "🌐 Your app should be available at: https://policy.fly.dev"
