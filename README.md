# 📝 Todo - Task Management

A modern, elegant task management application built with Ruby on Rails 8 and styled with Tailwind CSS. Todo helps you organize your life with beautiful lists and intuitive task management.

![Rails](https://img.shields.io/badge/Rails-8.0.2-red?logo=ruby-on-rails)
![Ruby](https://img.shields.io/badge/Ruby-3.4+-red?logo=ruby)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-3.0+-blue?logo=tailwind-css)

## ✨ Features

### 🎯 Core Functionality
- **📋 List Management**: Create, edit, and delete custom lists
- **👤 User Authentication**: Secure user accounts with session management
- **🎨 Beautiful UI**: Modern, responsive design with Tailwind CSS
- **📱 Mobile Friendly**: Fully responsive design that works on all devices
- **⚡ Real-time Updates**: Smooth interactions with Turbo

### 🛡️ Security & Authentication
- Secure password authentication with BCrypt
- Session-based authentication system
- Protected routes and user-specific data
- CSRF protection enabled

### 🎨 User Experience
- Clean, minimalist interface
- Smooth hover effects and transitions
- Intuitive navigation and actions
- Empty state illustrations
- Confirmation dialogs for destructive actions

## 🚀 Quick Start

### Prerequisites
- Ruby 3.4+
- Node.js 18+

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/imnastasia/todo.git
   cd todo
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Install and build assets**
   ```bash
   bin/dev
   ```

5. **Visit the application**
   Open your browser and navigate to `http://localhost:3000`

## 🏗️ Technical Architecture

### Backend Stack
- **Framework**: Ruby on Rails 8.0.2
- **Database**: SQLite (development/test), PostgreSQL ready for production
- **Authentication**: Custom session-based auth with BCrypt
- **Background Jobs**: Solid Queue (Rails 8 default)
- **Caching**: Solid Cache with SQLite

### Frontend Stack
- **Styling**: Tailwind CSS 3.0+
- **JavaScript**: Stimulus controllers with Turbo
- **Build System**: esbuild via Rails asset pipeline
- **Icons**: Custom SVG icons

## 🧪 Testing

The application includes comprehensive test coverage:

### Running Tests
```bash
# Run all tests
rails test

# Run specific test files
rails test test/models/
rails test test/controllers/
```

## 🚀 Deployment

### Kamal Deployment (Recommended)
This project is configured for deployment with Kamal:

```bash
# Setup deployment
kamal setup

# Deploy application
kamal deploy
```

### Traditional Deployment
The app is ready for deployment on:
- **Heroku**: Configured with Procfile
- **Railway**: One-click deployment ready
- **Render**: Static configuration included
- **DigitalOcean App Platform**: Ready to deploy


## 🛠️ Development

### Development Setup
```bash
# Start development server with asset building
bin/dev

# Or start components separately
rails server          # Rails app on :3000
bin/rails tailwindcss:watch  # Tailwind CSS building
```

### Code Quality
```bash
# Linting
rubocop

# Security scanning
brakeman

# Database consistency
rails db:migrate:status
```

## 📋 API Documentation

### Lists Endpoints
```
GET    /lists           # List all lists
GET    /lists/new       # New list form
POST   /lists           # Create list
GET    /lists/:id       # Show list
GET    /lists/:id/edit  # Edit list form
PATCH  /lists/:id       # Update list
DELETE /lists/:id       # Delete list
```

### Authentication Endpoints
```
GET    /session/new     # Login form
POST   /session         # Create session (login)
DELETE /session         # Destroy session (logout)
```


## 👨‍💻 Author

**Anastasiia** - *Full Stack Developer*

- Portfolio: [imnastasia.com](https://imnastasia.com)

---

<p align="center">
  Made with ❤️ and ☕ by Anastasiia
</p>
