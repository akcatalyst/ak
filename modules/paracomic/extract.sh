#!/bin/bash

# Paracomic Module Extraction Script
# This script helps you extract the Paracomic module for use in another Rails application

echo "🎭 Paracomic Module Extraction Script"
echo "====================================="
echo ""

# Check if target directory is provided
if [ -z "$1" ]; then
    echo "Usage: ./extract.sh <target_rails_app_path>"
    echo ""
    echo "Example: ./extract.sh /path/to/your/new/rails/app"
    echo ""
    echo "This will copy the Paracomic module to your target Rails application."
    exit 1
fi

TARGET_DIR="$1"
MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📁 Source module directory: $MODULE_DIR"
echo "🎯 Target Rails app: $TARGET_DIR"
echo ""

# Check if target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ Error: Target directory does not exist: $TARGET_DIR"
    exit 1
fi

# Check if it looks like a Rails app
if [ ! -f "$TARGET_DIR/config/routes.rb" ]; then
    echo "⚠️  Warning: Target directory doesn't appear to be a Rails application"
    echo "   (missing config/routes.rb)"
    echo "   Continue anyway? (y/N)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "❌ Extraction cancelled"
        exit 1
    fi
fi

echo "🚀 Starting extraction..."
echo ""

# Create necessary directories
echo "📂 Creating directories..."
mkdir -p "$TARGET_DIR/app/controllers"
mkdir -p "$TARGET_DIR/app/views/paracomic"
mkdir -p "$TARGET_DIR/app/assets/stylesheets"
mkdir -p "$TARGET_DIR/app/javascript/controllers"

# Copy controller
echo "📋 Copying controller..."
cp "$MODULE_DIR/app/controllers/paracomic_controller.rb" "$TARGET_DIR/app/controllers/"

# Copy views
echo "👁️  Copying views..."
cp -r "$MODULE_DIR/app/views/paracomic/"* "$TARGET_DIR/app/views/paracomic/"

# Copy any custom assets
if [ -d "$MODULE_DIR/app/assets/stylesheets" ]; then
    echo "🎨 Copying stylesheets..."
    cp "$MODULE_DIR/app/assets/stylesheets/"* "$TARGET_DIR/app/assets/stylesheets/" 2>/dev/null || true
fi

if [ -d "$MODULE_DIR/app/javascript/controllers" ]; then
    echo "⚡ Copying JavaScript controllers..."
    cp "$MODULE_DIR/app/javascript/controllers/"* "$TARGET_DIR/app/javascript/controllers/" 2>/dev/null || true
fi

echo ""
echo "✅ Extraction completed!"
echo ""

# Create a setup guide for the target app
echo "📝 Creating setup guide..."
cat > "$TARGET_DIR/PARACOMIC_SETUP.md" << 'EOF'
# Paracomic Module Setup Guide

## 🎭 **Paracomic Module Successfully Extracted!**

Your Paracomic comedy shows module has been extracted and is ready to use.

## 🔧 **Next Steps:**

### **1. Add Routes**
Add this to your `config/routes.rb`:
```ruby
Rails.application.routes.draw do
  # Your existing routes...
  
  # Paracomic module routes
  get "paracomic", to: "paracomic#index"
  get "comedy", to: "paracomic#index"  # Alternative route
end
```

### **2. Add Navigation**
Add this to your layout file (`app/views/layouts/application.html.erb`):
```erb
<%= link_to "Comedy Shows", paracomic_path, class: "nav-link" %>
```

### **3. Test the Module**
Visit: `http://localhost:3000/paracomic`

## 📁 **Files Added:**
- `app/controllers/paracomic_controller.rb`
- `app/views/paracomic/index.html.erb`
- Any custom assets

## 🎯 **Features:**
- ✅ Mobile-first responsive design
- ✅ Beautiful comedy-themed UI
- ✅ No authentication required
- ✅ Tailwind CSS styling
- ✅ Ready to customize

## 🔮 **Customization:**
- Edit `app/views/paracomic/index.html.erb` to change content
- Modify the controller to add database integration
- Update colors and styling in the views

## 🚀 **Ready to Use!**
Your comedy shows module is now fully integrated!
EOF

echo "📖 Setup guide created: $TARGET_DIR/PARACOMIC_SETUP.md"
echo ""

# Show what was copied
echo "📋 **Files Extracted:**"
echo "   ├── app/controllers/paracomic_controller.rb"
echo "   ├── app/views/paracomic/index.html.erb"
echo "   └── Any custom assets"
echo ""

echo "🎯 **Next Steps:**"
echo "   1. Add routes to config/routes.rb"
echo "   2. Add navigation links to your layout"
echo "   3. Test at /paracomic"
echo "   4. Customize content and styling"
echo ""

echo "🎉 **Extraction Complete!**"
echo "   Your Paracomic module is ready to use in your new Rails application!"
echo ""
echo "📖 **Read the setup guide:** $TARGET_DIR/PARACOMIC_SETUP.md" 