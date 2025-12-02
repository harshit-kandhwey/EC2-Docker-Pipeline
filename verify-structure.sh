#!/bin/bash

# Structure Verification Script
# Run this from the todo-app/ root directory

echo "🔍 Verifying Project Structure..."
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
TOTAL=0
FOUND=0
MISSING=0

# Function to check file
check_file() {
    TOTAL=$((TOTAL + 1))
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $1"
        FOUND=$((FOUND + 1))
    else
        echo -e "${RED}✗${NC} $1 ${RED}(MISSING)${NC}"
        MISSING=$((MISSING + 1))
    fi
}

# Check root files
echo "📁 Root Directory:"
check_file "docker-compose.yml"
check_file "README.md"
echo ""

# Check frontend files
echo "📁 Frontend Files:"
check_file "frontend/Dockerfile"
check_file "frontend/.dockerignore"
check_file "frontend/package.json"
check_file "frontend/vite.config.js"
check_file "frontend/nginx.conf"
check_file "frontend/index.html"
check_file "frontend/main.jsx"
check_file "frontend/App.jsx"
check_file "frontend/styles.css"
echo ""

# Check backend files
echo "📁 Backend Files:"
check_file "backend/Dockerfile"
check_file "backend/package.json"
check_file "backend/server.js"
check_file "backend/.env"
echo ""

# Check database files
echo "📁 Database Files:"
check_file "database/init-db.js"
echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Summary:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Total Files:   $TOTAL"
echo -e "${GREEN}Found:         $FOUND${NC}"
if [ $MISSING -gt 0 ]; then
    echo -e "${RED}Missing:       $MISSING${NC}"
else
    echo -e "${GREEN}Missing:       $MISSING${NC}"
fi
echo ""

# Check if in correct directory
if [ ! -f "docker-compose.yml" ]; then
    echo -e "${YELLOW}⚠️  Warning: docker-compose.yml not found!${NC}"
    echo "   Make sure you're running this from the todo-app/ root directory"
    echo ""
fi

# Final verdict
if [ $MISSING -eq 0 ]; then
    echo -e "${GREEN}✅ All files present! You're ready to run: docker-compose up --build${NC}"
else
    echo -e "${RED}❌ Please create the missing files before building${NC}"
fi
echo ""