# Paracomic Module - Reusable Comedy Shows Module

## 🎭 **Overview**

The Paracomic module is a self-contained comedy shows and entertainment system that can be easily extracted and reused in other Rails applications. It provides a complete landing page for comedy shows with no authentication required.

## 🚀 **Extract and Reuse in Another Rails App**

### **Method 1: Copy as Standalone Module (Recommended)**

#### **Step 1: Copy the Module Files**
```bash
# In your new Rails application
mkdir -p app/controllers
mkdir -p app/views/paracomic
mkdir -p app/assets/stylesheets
mkdir -p app/javascript/controllers

# Copy the controller
cp /path/to/paracomic/app/controllers/paracomic_controller.rb app/controllers/

# Copy the views
cp -r /path/to/paracomic/app/views/paracomic/* app/views/paracomic/

# Copy any custom stylesheets
cp /path/to/paracomic/app/assets/stylesheets/* app/assets/stylesheets/
```

#### **Step 2: Add Routes**
```ruby
# config/routes.rb
Rails.application.routes.draw do
  # Your existing routes...
  
  # Paracomic module routes
  get "paracomic", to: "paracomic#index"
  get "comedy", to: "paracomic#index"  # Alternative route
end
```

#### **Step 3: Add Navigation Links**
```erb
<!-- app/views/layouts/application.html.erb -->
<nav>
  <!-- Your existing navigation -->
  <%= link_to "Comedy Shows", paracomic_path, class: "nav-link" %>
</nav>
```

### **Method 2: Create as Rails Engine**

#### **Step 1: Generate Engine**
```bash
# In your new Rails application
rails generate engine paracomic --mountable
```

#### **Step 2: Copy Engine Files**
```bash
# Copy the engine structure
cp -r /path/to/paracomic/lib/paracomic/* lib/paracomic/
cp -r /path/to/paracomic/app/* app/
cp -r /path/to/paracomic/config/* config/
cp /path/to/paracomic/paracomic.gemspec ./
```

#### **Step 3: Mount Engine**
```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount Paracomic::Engine, at: "/paracomic"
end
```

### **Method 3: Create as Gem**

#### **Step 1: Create Gem Structure**
```bash
# Create gem directory
mkdir paracomic-gem
cd paracomic-gem

# Copy module files
cp -r /path/to/paracomic/* ./
```

#### **Step 2: Update Gemspec**
```ruby
# paracomic.gemspec
Gem::Specification.new do |spec|
  spec.name        = "paracomic"
  spec.version     = "0.0.1"
  spec.authors     = ["Your Name"]
  spec.email       = ["your.email@example.com"]
  spec.homepage    = "https://github.com/yourusername/paracomic"
  spec.summary     = "Comedy shows module for Rails"
  spec.description = "A reusable comedy shows and entertainment module for Rails applications"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6.0"
  spec.add_dependency "turbo-rails"
  spec.add_dependency "stimulus-rails"
  spec.add_dependency "tailwindcss-rails"
end
```

#### **Step 3: Install in New App**
```ruby
# Gemfile
gem "paracomic", path: "/path/to/paracomic-gem"

# Or publish to RubyGems
gem "paracomic"
```

## 📁 **Module Structure**

```
paracomic/
├── app/
│   ├── controllers/
│   │   └── paracomic_controller.rb    # Main controller
│   ├── views/
│   │   └── paracomic/
│   │       └── index.html.erb         # Landing page
│   ├── assets/
│   │   └── stylesheets/               # Custom styles (if any)
│   └── javascript/
│       └── controllers/               # Stimulus controllers (if any)
├── config/
│   └── routes.rb                      # Module routes
├── lib/
│   └── paracomic/
│       └── engine.rb                  # Engine file (if using engine)
├── paracomic.gemspec                  # Gem specification
└── README.md                          # This file
```

## 🔧 **Dependencies Required**

### **Required Gems**
```ruby
# Gemfile
gem "rails", ">= 6.0"
gem "turbo-rails"      # For Hotwire functionality
gem "stimulus-rails"   # For JavaScript interactions
gem "tailwindcss-rails" # For styling
```

### **Required Assets**
- Tailwind CSS (for styling)
- Stimulus JS (for interactions)
- Any custom CSS/JS files

## 🎨 **Customization Options**

### **1. Change Theme Colors**
```erb
<!-- In app/views/paracomic/index.html.erb -->
<!-- Change purple/pink to your brand colors -->
<div class="bg-gradient-to-r from-blue-600 to-green-600">
  <!-- Your content -->
</div>
```

### **2. Modify Content**
```erb
<!-- Update comedy show details -->
<h3 class="text-xl font-bold text-gray-900 mb-2">Your Show Name</h3>
<p class="text-gray-600 mb-4">Your show description...</p>
```

### **3. Add Custom Features**
```ruby
# app/controllers/paracomic_controller.rb
class ParacomicController < ApplicationController
  def index
    # Add custom logic here
    @featured_shows = Show.featured
    @upcoming_events = Event.upcoming
  end
  
  def show
    # Add individual show view
    @show = Show.find(params[:id])
  end
end
```

## 🚀 **Quick Start in New App**

### **1. Copy Files**
```bash
# Copy these files to your new Rails app
cp paracomic_controller.rb app/controllers/
cp -r paracomic/ app/views/
```

### **2. Add Route**
```ruby
# config/routes.rb
get "paracomic", to: "paracomic#index"
```

### **3. Add Navigation**
```erb
<!-- In your layout -->
<%= link_to "Comedy Shows", paracomic_path %>
```

### **4. Test**
Visit `http://localhost:3000/paracomic` in your new app!

## 🔮 **Advanced Features to Add**

### **1. Database Integration**
```ruby
# app/models/show.rb
class Show < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  scope :upcoming, -> { where('date > ?', Date.current) }
end

# app/controllers/paracomic_controller.rb
def index
  @shows = Show.upcoming.order(:date)
end
```

### **2. Admin Interface**
```ruby
# app/controllers/admin/paracomic_controller.rb
class Admin::ParacomicController < ApplicationController
  before_action :require_admin
  
  def index
    @shows = Show.all
  end
  
  def new
    @show = Show.new
  end
  
  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to admin_paracomic_path, notice: 'Show created!'
    else
      render :new
    end
  end
  
  private
  
  def show_params
    params.require(:show).permit(:name, :date, :description, :price)
  end
end
```

### **3. API Endpoints**
```ruby
# app/controllers/api/paracomic_controller.rb
class Api::ParacomicController < ApplicationController
  def index
    @shows = Show.upcoming
    render json: @shows
  end
  
  def show
    @show = Show.find(params[:id])
    render json: @show
  end
end

# config/routes.rb
namespace :api do
  resources :paracomic, only: [:index, :show]
end
```

## 🧪 **Testing**

### **1. Controller Tests**
```ruby
# test/controllers/paracomic_controller_test.rb
require "test_helper"

class ParacomicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get paracomic_url
    assert_response :success
  end
end
```

### **2. View Tests**
```ruby
# test/views/paracomic/index.html.erb_test.rb
require "test_helper"

class Paracomic::IndexViewTest < ActionView::TestCase
  test "renders comedy shows" do
    render
    assert_select "h1", text: "Welcome to Paracomic"
    assert_select ".comedy-show", minimum: 1
  end
end
```

## 📱 **Mobile-First Features**

The module includes:
- ✅ Responsive design
- ✅ Touch-friendly interfaces
- ✅ Mobile-optimized navigation
- ✅ Progressive enhancement
- ✅ Tailwind CSS utilities

## 🎯 **Use Cases**

Perfect for:
- Comedy clubs
- Entertainment venues
- Event organizers
- Stand-up comedians
- Comedy festivals
- Laughter therapy centers
- Any business needing comedy show management

## 🔍 **Troubleshooting**

### **Common Issues**

1. **Route Error**: Ensure route is properly defined
2. **Missing Controller**: Check controller file exists
3. **Missing Views**: Verify view files are in correct location
4. **Asset Issues**: Ensure Tailwind CSS is properly configured

### **Debug Steps**

1. Check `rails routes` for proper routing
2. Verify controller actions exist
3. Check view file paths
4. Ensure all dependencies are installed

## 📄 **License**

This module is provided under the MIT License. Feel free to use, modify, and distribute as needed.

## 🤝 **Support**

For questions or issues:
1. Check this README
2. Review the code structure
3. Test in a simple Rails app first
4. Ensure all dependencies are met

---

## 🎉 **Ready to Reuse!**

The Paracomic module is now ready to be extracted and used in any Rails application. Choose the method that best fits your needs and start building amazing comedy show experiences! 🎭✨ 