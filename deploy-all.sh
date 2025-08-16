#!/bin/bash

echo "🚀 Disaster Guard - Complete Deployment Script"
echo "=============================================="

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

echo "✅ Fly CLI is installed and you're logged in!"

# Deploy Backend First
echo ""
echo "🔧 Step 1: Deploying Backend..."
./deploy-backend.sh

if [ $? -eq 0 ]; then
    echo "✅ Backend deployed successfully!"
else
    echo "❌ Backend deployment failed!"
    exit 1
fi

# Wait a moment for backend to be ready
echo "⏳ Waiting for backend to be ready..."
sleep 10

# Deploy Frontend
echo ""
echo "🎨 Step 2: Deploying Frontend..."
./deploy-frontend.sh

if [ $? -eq 0 ]; then
    echo "✅ Frontend deployed successfully!"
else
    echo "❌ Frontend deployment failed!"
    exit 1
fi

echo ""
echo "🎉 Deployment Complete!"
echo "======================"
echo "🌐 Frontend: https://policy.fly.dev"
echo "🔧 Backend:  https://disaster-guard-backend.fly.dev"
echo ""
echo "📝 Next Steps:"
echo "1. Update your frontend environment variables to point to the backend URL"
echo "2. Test your application"
echo "3. Set up any additional environment variables in Fly.io dashboard"
echo ""
echo "🔗 Fly.io Dashboard: https://fly.io/apps"
