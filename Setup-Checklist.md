# 📋 Setup Checklist - To-Do Application

Follow this checklist to ensure all files are in the correct location.

## ✅ Step-by-Step Setup

### 1. Create Directory Structure

```bash
mkdir -p todo-app/frontend
mkdir -p todo-app/backend
mkdir -p todo-app/database
cd todo-app
```

### 2. Frontend Files (8 files)

Create these files in the `frontend/` directory:

```
frontend/
├── .dockerignore       ✓ Copy from artifact
├── Dockerfile          ✓ Copy from artifact
├── package.json        ✓ Copy from artifact
├── vite.config.js      ✓ Copy from artifact
├── nginx.conf          ✓ Copy from artifact
├── index.html          ✓ Copy from artifact
├── main.jsx            ✓ Copy from artifact
├── App.jsx             ✓ Copy from artifact
└── styles.css          ✓ Copy from artifact
```

**Commands:**

```bash
cd frontend

# Create each file and paste content from artifacts:
# On Windows:
notepad .dockerignore
notepad Dockerfile
notepad package.json
notepad vite.config.js
notepad nginx.conf
notepad index.html
notepad main.jsx
notepad App.jsx
notepad styles.css

# On Linux/Mac:
nano .dockerignore
nano Dockerfile
nano package.json
nano vite.config.js
nano nginx.conf
nano index.html
nano main.jsx
nano App.jsx
nano styles.css

cd ..
```

### 3. Backend Files (4 files)

Create these files in the `backend/` directory:

```
backend/
├── Dockerfile          ✓ Copy from artifact
├── package.json        ✓ Copy from artifact
├── server.js           ✓ Copy from artifact
└── .env                ✓ Copy from artifact
```

**Commands:**

```bash
cd backend

# Create each file:
notepad Dockerfile      # Windows
notepad package.json
notepad server.js
notepad .env

cd ..
```

### 4. Database Files (5 files)

Create these files in the `database/` directory:

```
database/
├── init-db.js          ✓ Copy from artifact
├── backup.sh           ✓ Copy from artifact (optional)
├── restore.sh          ✓ Copy from artifact (optional)
├── mongod.conf         ✓ Copy from artifact (optional)
└── README.md           ✓ Copy from artifact (optional)
```

**Commands:**

```bash
cd database

# Create required file:
notepad init-db.js

# Optional files:
notepad backup.sh
notepad restore.sh
notepad mongod.conf
notepad README.md

# Make scripts executable (Linux/Mac only):
chmod +x backup.sh restore.sh

cd ..
```

### 5. Root Files (2 files)

Create these files in the root `todo-app/` directory:

```
todo-app/
├── docker-compose.yml  ✓ Copy from artifact
└── README.md           ✓ Copy from artifact
```

**Commands:**

```bash
# From todo-app/ root directory
notepad docker-compose.yml
notepad README.md
```

## 🔍 Verification

### Check File Structure

Run this command from the `todo-app/` directory:

**Windows (PowerShell):**

```powershell
tree /F
```

**Linux/Mac:**

```bash
tree
# or
find . -type f -name "*.js" -o -name "*.jsx" -o -name "*.json" -o -name "*.yml" -o -name "Dockerfile"
```

### Expected Structure

```
todo-app/
├── docker-compose.yml
├── README.md
├── frontend/
│   ├── .dockerignore
│   ├── Dockerfile
│   ├── package.json
│   ├── vite.config.js
│   ├── nginx.conf
│   ├── index.html
│   ├── main.jsx
│   ├── App.jsx
│   └── styles.css
├── backend/
│   ├── Dockerfile
│   ├── package.json
│   ├── server.js
│   └── .env
└── database/
    ├── init-db.js
    ├── backup.sh
    ├── restore.sh
    ├── mongod.conf
    └── README.md
```

### Verify File Contents

**Check key files exist and have content:**

```bash
# Frontend
ls -lh frontend/index.html
ls -lh frontend/main.jsx
ls -lh frontend/App.jsx
ls -lh frontend/styles.css

# Backend
ls -lh backend/server.js
ls -lh backend/package.json

# Database
ls -lh database/init-db.js

# Root
ls -lh docker-compose.yml
```

## 🚀 Build and Run

### 1. Clean Previous Builds (if any)

```bash
# Remove old containers and volumes
docker-compose down -v

# Remove old images (optional)
docker rmi ci-cd-project-frontend ci-cd-project-backend
```

### 2. Build and Start

```bash
# Build and start all containers
docker-compose up --build

# Or run in detached mode
docker-compose up --build -d
```

### 3. Check Build Progress

Watch for these success messages:

```
✓ frontend build successful
✓ backend build successful
✓ database container started
```

### 4. Verify Containers Running

```bash
docker-compose ps
```

Expected output:

```
NAME              STATUS          PORTS
todo-frontend     Up             0.0.0.0:80->80/tcp
todo-backend      Up             0.0.0.0:5000->5000/tcp
todo-database     Up             0.0.0.0:27017->27017/tcp
```

### 5. Test Application

```bash
# Test frontend
curl http://localhost

# Test backend
curl http://localhost:5000/api/health

# Test backend todos endpoint
curl http://localhost:5000/api/todos
```

### 6. Access in Browser

- **Frontend**: http://localhost
- **Backend Health**: http://localhost:5000/api/health

## 🐛 Troubleshooting

### Issue: "Could not resolve ./styles.css"

**Solution:**

- Ensure `styles.css` exists in `frontend/` directory
- Check `main.jsx` has correct import: `import './styles.css';`
- Verify file has content (not empty)

### Issue: "Could not resolve entry module index.html"

**Solution:**

- Ensure `index.html` is in `frontend/` root (NOT in a src/ subfolder)
- Check Dockerfile copies files correctly

### Issue: "Port already in use"

**Solution:**

```bash
# Find process using the port
# Windows:
netstat -ano | findstr :80

# Linux/Mac:
lsof -i :80

# Kill the process or change port in docker-compose.yml
```

### Issue: Build fails with npm errors

**Solution:**

```bash
# Clear Docker build cache
docker builder prune

# Rebuild without cache
docker-compose build --no-cache
docker-compose up
```

### Issue: Files not found during Docker build

**Solution:**

- Check you're in the correct directory: `cd todo-app`
- Verify all files exist with `ls frontend/` and `ls backend/`
- Check for hidden files with `ls -la frontend/`

## ✅ Final Checklist

Before running `docker-compose up --build`:

- [ ] All 9 frontend files created and populated
- [ ] All 4 backend files created and populated
- [ ] Database init-db.js file created
- [ ] docker-compose.yml in root directory
- [ ] You are in the `todo-app/` root directory
- [ ] Docker Desktop is running (Windows/Mac)
- [ ] No other services using ports 80, 5000, or 27017

## 📝 Quick Commands Reference

```bash
# Start
docker-compose up --build

# Start in background
docker-compose up -d --build

# Stop
docker-compose down

# Stop and remove data
docker-compose down -v

# View logs
docker-compose logs -f

# View specific service logs
docker-compose logs -f frontend
docker-compose logs -f backend
docker-compose logs -f database

# Restart a service
docker-compose restart backend

# Rebuild a service
docker-compose up -d --build frontend
```

## 🎉 Success Indicators

Your setup is successful when:

1. ✅ All containers show "Up" status
2. ✅ Frontend loads at http://localhost
3. ✅ Backend health check returns: `{"status":"OK","message":"Backend is running","database":"Connected"}`
4. ✅ You can add, complete, and delete todos
5. ✅ Stats dashboard shows correct counts
6. ✅ Data persists after `docker-compose down` (without `-v`)

---

**Need Help?**

1. Check container logs: `docker-compose logs <service-name>`
2. Verify file structure matches exactly
3. Ensure no typos in file contents
4. Check Docker Desktop is running
5. Try rebuilding without cache: `docker-compose build --no-cache`
