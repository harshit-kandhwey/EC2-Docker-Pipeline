# 🎨 Frontend - React To-Do Application

The presentation tier of the 3-tier To-Do application, built with React and served by Nginx in a Docker container.

![React](https://img.shields.io/badge/React-18.2.0-61DAFB?logo=react)
![Vite](https://img.shields.io/badge/Vite-4.3.9-646CFF?logo=vite)
![Nginx](https://img.shields.io/badge/Nginx-Alpine-009639?logo=nginx)

## 📁 Directory Structure

```
frontend/
├── Dockerfile           # Multi-stage Docker build
├── package.json         # Dependencies and scripts
├── vite.config.js       # Vite bundler configuration
├── nginx.conf           # Nginx server configuration
├── index.html           # HTML entry point
├── main.jsx             # React application entry
├── App.jsx              # Main React component
├── styles.css           # Application styles
└── README.md            # This file
```

## 🏗️ Architecture

### Multi-Stage Docker Build

```
Stage 1: Build
┌─────────────────────────┐
│   node:18-alpine        │
│   - npm install         │
│   - vite build          │
│   - Generate /dist      │
└─────────────────────────┘
           ↓
Stage 2: Production
┌─────────────────────────┐
│   nginx:alpine          │
│   - Copy /dist          │
│   - Copy nginx.conf     │
│   - Serve static files  │
│   - Proxy API requests  │
└─────────────────────────┘
```

## ✨ Features

### User Interface

- ✅ Modern gradient design with purple theme
- ✅ Fully responsive layout
- ✅ Smooth animations and transitions
- ✅ Interactive task management
- ✅ Real-time statistics dashboard
- ✅ Filter system (All/Active/Completed)
- ✅ Empty state handling
- ✅ Loading indicators

### Technical Features

- ✅ React 18 with Hooks (useState, useEffect)
- ✅ Vite for fast builds and HMR
- ✅ Production-optimized build
- ✅ Nginx reverse proxy for API
- ✅ Environment-based API configuration
- ✅ CSS3 animations and gradients
- ✅ RESTful API integration

## 🚀 Development Setup

### Prerequisites

- Node.js 18+
- npm or yarn

### Local Development

1. **Install dependencies**

   ```bash
   npm install
   ```

2. **Set up environment variables**

   ```bash
   # Create .env file
   echo "VITE_API_URL=http://localhost:5000/api" > .env
   ```

3. **Start development server**

   ```bash
   npm run dev
   ```

   Access at: http://localhost:3000

4. **Build for production**
   ```bash
   npm run build
   ```
   Output: `dist/` directory

## 🐳 Docker Deployment

### Build Docker Image

```bash
# From project root
docker build -t todo-frontend ./frontend

# Or from frontend directory
docker build -t todo-frontend .
```

### Run Docker Container

```bash
# Standalone
docker run -d \
  --name todo-frontend \
  -p 80:80 \
  -e VITE_API_URL=http://localhost/api \
  todo-frontend

# With docker-compose (recommended)
cd ..
docker-compose up -d frontend
```

### Docker Configuration

**Dockerfile Stages:**

1. **Build Stage**: Uses Node.js to build React app
2. **Production Stage**: Uses Nginx to serve static files

**Environment Variables:**

- `VITE_API_URL`: Backend API URL (default: http://localhost/api)

## 📦 Dependencies

### Production Dependencies

```json
{
  "react": "^18.2.0",
  "react-dom": "^18.2.0"
}
```

### Development Dependencies

```json
{
  "@vitejs/plugin-react": "^4.0.0",
  "vite": "^4.3.9"
}
```

## 🔧 Configuration Files

### vite.config.js

```javascript
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  server: { port: 3000 },
  build: { outDir: "dist" },
});
```

### nginx.conf

Configures:

- Static file serving from `/usr/share/nginx/html`
- API reverse proxy to backend at `http://backend:5000`
- SPA routing support (try_files)
- Proper headers for proxied requests

## 🎯 Component Structure

### App.jsx

**State Management:**

```javascript
const [todos, setTodos] = useState([]); // All todos
const [newTodo, setNewTodo] = useState(""); // Input field
const [filter, setFilter] = useState("all"); // Filter state
const [loading, setLoading] = useState(false); // Loading state
```

**Main Functions:**

- `fetchTodos()` - GET all todos from API
- `addTodo()` - POST new todo to API
- `toggleTodo()` - PUT update todo completion status
- `deleteTodo()` - DELETE todo from API

**Computed Values:**

- `filteredTodos` - Filtered list based on active filter
- `stats` - Total, active, and completed counts

## 🎨 Styling

### Design System

**Colors:**

- Primary Gradient: `#667eea` → `#764ba2`
- Background: Linear gradient purple theme
- Text: `#333` (primary), `#666` (secondary), `#999` (muted)
- Success: `#10b981`
- Borders: `#e0e0e0`, `#f0f0f0`

**Typography:**

- Font Family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif
- Header: 2.5rem (40px)
- Body: 1rem (16px)
- Small: 0.875rem (14px)

**Spacing:**

- Container max-width: 700px
- Padding: 20px, 30px
- Gaps: 10px, 15px
- Border radius: 8px, 16px

### CSS Features

- Flexbox layouts
- CSS Grid for stats
- Smooth transitions (0.2s, 0.3s)
- Transform animations
- Box shadows for depth
- Gradient backgrounds
- Hover effects

## 📡 API Integration

### API Endpoint Configuration

```javascript
const API_URL = import.meta.env.VITE_API_URL || "http://localhost:5000/api";
```

### API Calls

**Fetch Todos:**

```javascript
GET / api / todos;
Response: [{ _id, text, completed, createdAt }];
```

**Create Todo:**

```javascript
POST / api / todos;
Body: {
  text: "Task description";
}
Response: {
  _id, text, completed, createdAt;
}
```

**Update Todo:**

```javascript
PUT /api/todos/:id
Body: { completed: true/false }
Response: { _id, text, completed, createdAt }
```

**Delete Todo:**

```javascript
DELETE /api/todos/:id
Response: { message: "Todo deleted successfully" }
```

## 🔍 Features Breakdown

### Statistics Dashboard

- Displays total, active, and completed task counts
- Updates in real-time as tasks change
- Color-coded values for visual clarity

### Filter System

- **All**: Shows all tasks
- **Active**: Shows only incomplete tasks
- **Completed**: Shows only completed tasks
- Active filter button highlighted

### Task Management

- Add new tasks via input form
- Mark tasks complete with checkbox
- Delete tasks with trash icon
- Tasks sorted by creation date (newest first)

### User Experience

- Empty states for each filter view
- Loading indicator during API calls
- Smooth animations on interactions
- Responsive design for all screen sizes
- Hover effects for interactive elements

## 🧪 Testing

### Manual Testing Checklist

- [ ] Add a new todo
- [ ] Mark todo as complete
- [ ] Unmark completed todo
- [ ] Delete a todo
- [ ] Filter by All/Active/Completed
- [ ] Verify statistics update correctly
- [ ] Test with empty state
- [ ] Test responsive design
- [ ] Verify API error handling

### Browser Testing

```bash
# Recommended browsers
- Chrome/Chromium (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
```

## 🐛 Troubleshooting

### Common Issues

**Build fails:**

```bash
# Clear node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
npm run build
```

**API connection fails:**

```bash
# Check API URL configuration
echo $VITE_API_URL

# Verify backend is running
curl http://localhost:5000/api/health

# Check nginx proxy configuration
docker exec -it todo-frontend cat /etc/nginx/conf.d/default.conf
```

**Styles not loading:**

```bash
# Verify import in main.jsx
import './styles.css';

# Check browser console for CSS errors
# Rebuild Docker image
docker-compose up -d --build frontend
```

**Port 80 already in use:**

```bash
# Check what's using port 80
sudo lsof -i :80

# Change port in docker-compose.yml
ports:
  - "8080:80"  # Use port 8080 instead
```

## 📈 Performance Optimization

### Build Optimization

- Tree shaking with Vite
- Code splitting
- Minification
- Gzip compression (via Nginx)

### Runtime Optimization

- Lazy loading (can be added)
- Memoization with useMemo (can be added)
- Virtual scrolling for large lists (can be added)
- Service Worker for offline support (can be added)

### Nginx Optimization

```nginx
# Can be added to nginx.conf
gzip on;
gzip_types text/css application/javascript;
expires 1y;
add_header Cache-Control "public, immutable";
```

## 🔐 Security

### Current Security Features

- Input sanitization via trim()
- CORS handled by backend
- XSS protection via React (automatic escaping)
- No inline scripts

### Production Recommendations

- Add Content Security Policy headers
- Implement rate limiting
- Add CSRF protection
- Use HTTPS only
- Implement authentication/authorization

## 🚀 Deployment

### Production Checklist

- [ ] Set production API URL
- [ ] Enable Nginx gzip compression
- [ ] Configure caching headers
- [ ] Add SSL/TLS certificates
- [ ] Set up CDN for static assets
- [ ] Configure monitoring
- [ ] Set up error tracking (Sentry)
- [ ] Implement analytics

### Environment Variables

```bash
# Development
VITE_API_URL=http://localhost:5000/api

# Production
VITE_API_URL=https://api.yourdomain.com/api
```

## 📚 Additional Resources

- [React Documentation](https://react.dev/)
- [Vite Documentation](https://vitejs.dev/)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [Docker Documentation](https://docs.docker.com/)

## 🤝 Contributing

When contributing to the frontend:

1. Follow React best practices
2. Maintain consistent code style
3. Update styles.css for UI changes
4. Test in multiple browsers
5. Update this README for new features

## 📝 Notes

- The app uses functional components with Hooks
- No state management library (Redux/Context) - can be added for larger apps
- CSS is vanilla (no preprocessor) - can migrate to SCSS/Tailwind
- No TypeScript - can be migrated if needed
- No testing framework - Jest/React Testing Library can be added

---

**Built with ❤️ using React and Vite**
