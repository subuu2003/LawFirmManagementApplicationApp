#!/bin/bash

# Frontend Deployment Script
# Builds locally and deploys to server

echo "🚀 Starting frontend deployment..."

# Step 1: Build locally
echo "📦 Building frontend locally..."
cd frontend
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build completed successfully!"

# Step 2: Create deployment package
echo "📦 Creating deployment package..."
cd ..
tar -czf frontend-build.tar.gz \
    frontend/.next \
    frontend/public \
    frontend/package.json \
    frontend/package-lock.json \
    frontend/next.config.ts \
    frontend/tsconfig.json

echo "✅ Package created: frontend-build.tar.gz"

# Step 3: Upload to server
echo "📤 Uploading to server..."
SERVER_USER="sammy"
SERVER_HOST="157.245.101.58"
SERVER_PATH="/home/sammy/LawFirmManagementApplicationApp"

scp frontend-build.tar.gz $SERVER_USER@$SERVER_HOST:$SERVER_PATH/

if [ $? -ne 0 ]; then
    echo "❌ Upload failed!"
    exit 1
fi

echo "✅ Upload completed!"

# Step 4: Extract and restart on server
echo "🔄 Extracting and restarting on server..."
ssh $SERVER_USER@$SERVER_HOST << 'EOF'
cd /home/sammy/LawFirmManagementApplicationApp
tar -xzf frontend-build.tar.gz
rm frontend-build.tar.gz
cd frontend
pm2 restart lawfirm-frontend
EOF

echo "✅ Deployment completed successfully!"
echo "🎉 Frontend is now live at https://antlegal.anthemgt.com"

# Cleanup
rm frontend-build.tar.gz
