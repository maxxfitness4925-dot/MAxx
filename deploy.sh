#!/bin/bash

# MAX FITNESS - Quick GitHub Push & Vercel Deploy Script
# ======================================================

echo "🚀 MAX FITNESS - GitHub & Vercel Deployment"
echo "==========================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Step 1: Configuring Git Remote${NC}"
echo "================================"
echo ""
echo "⚠️  IMPORTANT: You need to:"
echo "1. Have a GitHub account (https://github.com)"
echo "2. Have the repository: https://github.com/mohith182007/Max-Fitness.git"
echo ""
read -p "Press Enter when ready to add remote..."

# Add remote
git remote add origin https://github.com/mohith182007/Max-Fitness.git 2>/dev/null || git remote set-url origin https://github.com/mohith182007/Max-Fitness.git

# Rename branch to main
git branch -M main

echo -e "${GREEN}✓ Remote configured${NC}"
echo ""

echo -e "${BLUE}Step 2: Pushing to GitHub${NC}"
echo "========================="
echo ""
echo "You will be prompted for credentials:"
echo "- Username: Your GitHub username"
echo "- Password: Your GitHub Personal Access Token"
echo "  (Get it from: https://github.com/settings/tokens)"
echo ""
echo "How to get Personal Access Token:"
echo "1. Go to https://github.com/settings/tokens"
echo "2. Click 'Generate new token (classic)'"
echo "3. Select scopes: repo, admin:repo_hook"
echo "4. Copy the token and paste it when prompted"
echo ""
read -p "Press Enter to continue..."

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✓ Successfully pushed to GitHub!${NC}"
    echo ""
    echo -e "${BLUE}Step 3: Deploy on Vercel${NC}"
    echo "========================"
    echo ""
    echo "Next steps:"
    echo "1. Go to https://vercel.com"
    echo "2. Sign in with GitHub"
    echo "3. Click 'New Project'"
    echo "4. Click 'Import Git Repository'"
    echo "5. Paste: https://github.com/mohith182007/Max-Fitness.git"
    echo "6. Click 'Import'"
    echo "7. Framework: Select 'Other'"
    echo "8. Click 'Deploy'"
    echo ""
    echo -e "${GREEN}✓ Your site will be live in 1-2 minutes!${NC}"
else
    echo ""
    echo -e "${YELLOW}⚠️  Push failed. Check your credentials and try again.${NC}"
    exit 1
fi

echo ""
echo "📊 Repository Status:"
git log --oneline -3
echo ""
echo -e "${GREEN}✅ All done! Your project is ready for Vercel deployment.${NC}"
