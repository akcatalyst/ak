# Akcatalyst - Modular Rails 8 Application

A modern, modular Rails 8 application built with Hotwire, Tailwind CSS, and Stimulus JS. Each module is self-contained and can be mounted or unmounted as needed.

## 🚀 Technology Stack

- **Rails 8** - Latest Rails framework with modern defaults
- **Hotwire** - SPA-like experience without JavaScript complexity
- **Stimulus JS** - Modest JavaScript framework for HTML
- **Tailwind CSS** - Utility-first CSS framework
- **SQLite** - Simple, local database
- **Modular Architecture** - Rails Engines for feature isolation

## 🏗️ Architecture

The application follows a modular architecture where each feature is contained within its own Rails Engine:

```
akcatalyst/
├── app/                     # Core Rails app
│   ├── controllers/         # Main application controllers
│   ├── views/              # Main application views
│   └── javascript/         # Stimulus controllers
├── modules/                # Self-contained Rails Engines
│   ├── blog/               # Blog module
│   ├── space/              # Space module
│   └── india/              # India module
└── config/                 # Application configuration
```

## 📦 Modules

### Core Application
- **Main Pages**: Home, About, Contact
- **Navigation**: Responsive navigation with mobile menu
- **Layout**: Modern, mobile-first design

### Blog Module (`/blog`)
- **Features**: Posts, categories, tags, comments
- **Models**: Post, Category, Tag, Comment
- **Routes**: RESTful blog routes
- **Views**: Responsive blog layouts

### Space Module (`/space`)
- **Features**: Missions, crew members, equipment
- **Models**: Mission, CrewMember, Equipment, Location
- **Routes**: Space management routes
- **Views**: Mission tracking interfaces

### India Module (`/india`)
- **Features**: India-specific projects, localization
- **Models**: Project, TeamMember, Document, Location
- **Routes**: India-focused routes
- **Views**: Localized interfaces

## 🚀 Getting Started

### Prerequisites
- Ruby 3.2+
- Rails 8.0.2
- Node.js (for Tailwind CSS)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd akcatalyst
```

2. Install dependencies:
```bash
bundle install
```

3. Setup database:
```bash
rails db:create
rails db:migrate
```

4. Start the server:
```bash
rails server
```

5. Visit `http://localhost:3000`

## 🔧 Module Management

### Adding a New Module

1. Create module structure:
```bash
rails generate engine module_name
```

2. Add to `config/routes.rb`:
```ruby
mount ModuleName::Engine, at: "/module_name"
```

3. Update navigation in `app/views/layouts/application.html.erb`

### Removing a Module

1. Remove from `config/routes.rb`
2. Remove navigation links
3. Delete module directory

### Module Development

Each module is self-contained with:
- Own routes (`config/routes.rb`)
- Own controllers (`app/controllers/module_name/`)
- Own models (`app/models/module_name/`)
- Own views (`app/views/module_name/`)
- Own layout (`app/views/module_name/layouts/`)

## 📱 Mobile-First Design

The application is built with mobile-first principles:
- Responsive navigation with hamburger menu
- Mobile-optimized layouts
- Touch-friendly interfaces
- Progressive enhancement

## 🎨 Styling

- **Tailwind CSS** for utility-first styling
- **Custom components** for consistent design
- **Responsive breakpoints** for all screen sizes
- **Dark mode support** (planned)

## 🔌 JavaScript

- **Stimulus JS** for interactive components
- **Mobile menu controller** for navigation
- **Turbo** for fast page transitions
- **Import maps** for modern JavaScript

## 🗄️ Database

- **SQLite** for local development
- **Modular schema** for each module
- **Migrations** for database changes
- **Seed data** for development

## 🧪 Testing

- **RSpec** for testing framework
- **Factory Bot** for test data
- **Module isolation** for testing
- **Integration tests** for modules

## 🚀 Deployment

- **Docker** support with Dockerfile
- **Kamal** for deployment
- **Environment configuration** for different stages
- **Asset compilation** for production

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For support and questions:
- Email: hello@akcatalyst.com
- Issues: GitHub Issues
- Documentation: This README

## 🔮 Future Plans

- [ ] User authentication system
- [ ] Admin dashboard
- [ ] API endpoints
- [ ] Real-time features with Action Cable
- [ ] More modules (e-commerce, analytics, etc.)
- [ ] Internationalization (i18n)
- [ ] Performance optimizations
- [ ] Monitoring and logging

---

Built with ❤️ by the Akcatalyst Team
