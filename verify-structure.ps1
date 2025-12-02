# Structure Verification Script for Windows PowerShell
# Run this from the todo-app/ root directory

Write-Host "`n🔍 Verifying Project Structure...`n" -ForegroundColor Cyan

# Counters
$Total = 0
$Found = 0
$Missing = 0

# Function to check file
function Check-File {
    param($FilePath)
    
    $script:Total++
    
    if (Test-Path $FilePath) {
        Write-Host "✓ $FilePath" -ForegroundColor Green
        $script:Found++
    }
    else {
        Write-Host "✗ $FilePath (MISSING)" -ForegroundColor Red
        $script:Missing++
    }
}

# Check root files
Write-Host "📁 Root Directory:" -ForegroundColor Yellow
Check-File "docker-compose.yml"
Check-File "README.md"
Write-Host ""

# Check frontend files
Write-Host "📁 Frontend Files:" -ForegroundColor Yellow
Check-File "frontend\Dockerfile"
Check-File "frontend\.dockerignore"
Check-File "frontend\package.json"
Check-File "frontend\vite.config.js"
Check-File "frontend\nginx.conf"
Check-File "frontend\index.html"
Check-File "frontend\main.jsx"
Check-File "frontend\App.jsx"
Check-File "frontend\styles.css"
Write-Host ""

# Check backend files
Write-Host "📁 Backend Files:" -ForegroundColor Yellow
Check-File "backend\Dockerfile"
Check-File "backend\package.json"
Check-File "backend\server.js"
Check-File "backend\.env"
Write-Host ""

# Check database files
Write-Host "📁 Database Files:" -ForegroundColor Yellow
Check-File "database\init-db.js"
Write-Host ""

# Summary
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "📊 Summary:" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "Total Files:   $Total"
Write-Host "Found:         $Found" -ForegroundColor Green
if ($Missing -gt 0) {
    Write-Host "Missing:       $Missing" -ForegroundColor Red
}
else {
    Write-Host "Missing:       $Missing" -ForegroundColor Green
}
Write-Host ""

# Check if in correct directory
if (-not (Test-Path "docker-compose.yml")) {
    Write-Host "⚠️  Warning: docker-compose.yml not found!" -ForegroundColor Yellow
    Write-Host "   Make sure you're running this from the todo-app\ root directory"
    Write-Host ""
}

# Final verdict
if ($Missing -eq 0) {
    Write-Host "✅ All files present! You're ready to run: docker-compose up --build" -ForegroundColor Green
}
else {
    Write-Host "❌ Please create the missing files before building" -ForegroundColor Red
}
Write-Host ""