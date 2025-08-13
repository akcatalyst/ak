namespace :modules do
  desc "List all available modules"
  task list: :environment do
    puts "Available modules in Akcatalyst:"
    puts "=" * 50
    
    Akcatalyst::ModuleConfig.all_configs.each do |module_name, config|
      status = config[:enabled] ? "✓ Enabled" : "✗ Disabled"
      puts "#{module_name.to_s.upcase.ljust(10)} | #{status.ljust(12)} | #{config[:mount_path]}"
      puts "  #{config[:description]}"
      puts
    end
  end

  desc "Enable a module"
  task :enable, [:module_name] => :environment do |task, args|
    module_name = args[:module_name]
    
    if module_name.blank?
      puts "Usage: rake modules:enable[module_name]"
      puts "Available modules: #{Akcatalyst::ModuleConfig::ENABLED_MODULES.join(', ')}"
      exit 1
    end
    
    if Akcatalyst::ModuleConfig.enabled?(module_name)
      puts "Module '#{module_name}' is already enabled."
    else
      puts "Module '#{module_name}' is not available."
      puts "Available modules: #{Akcatalyst::ModuleConfig::ENABLED_MODULES.join(', ')}"
    end
  end

  desc "Disable a module"
  task :disable, [:module_name] => :environment do |task, args|
    module_name = args[:module_name]
    
    if module_name.blank?
      puts "Usage: rake modules:disable[module_name]"
      puts "Available modules: #{Akcatalyst::ModuleConfig::ENABLED_MODULES.join(', ')}"
      exit 1
    end
    
    if Akcatalyst::ModuleConfig.enabled?(module_name)
      puts "Module '#{module_name}' is currently enabled."
      puts "To disable it, update the configuration in config/modules.rb"
    else
      puts "Module '#{module_name}' is not available."
    end
  end

  desc "Show module status"
  task :status => :environment do
    puts "Module Status for Akcatalyst"
    puts "=" * 40
    
    Akcatalyst::ModuleConfig.enabled_modules.each do |module_name|
      config = Akcatalyst::ModuleConfig.config_for(module_name)
      puts "#{module_name.upcase}: #{config[:title]}"
      puts "  Path: #{config[:mount_path]}"
      puts "  Description: #{config[:description]}"
      puts
    end
    
    puts "Total enabled modules: #{Akcatalyst::ModuleConfig.enabled_modules.count}"
  end

  desc "Generate module scaffolding"
  task :generate, [:module_name] => :environment do |task, args|
    module_name = args[:module_name]
    
    if module_name.blank?
      puts "Usage: rake modules:generate[module_name]"
      puts "This will create a new module with basic structure."
      exit 1
    end
    
    puts "Generating module '#{module_name}'..."
    
    # Create module directory structure
    module_dir = "modules/#{module_name}"
    FileUtils.mkdir_p("#{module_dir}/app/controllers/#{module_name}")
    FileUtils.mkdir_p("#{module_dir}/app/models/#{module_name}")
    FileUtils.mkdir_p("#{module_dir}/app/views/#{module_name}")
    FileUtils.mkdir_p("#{module_dir}/app/views/#{module_name}/layouts")
    FileUtils.mkdir_p("#{module_dir}/config")
    FileUtils.mkdir_p("#{module_dir}/lib/#{module_name}")
    
    puts "Module directory structure created in #{module_dir}"
    puts "Remember to:"
    puts "1. Add the module to config/modules.rb"
    puts "2. Mount the engine in config/routes.rb"
    puts "3. Update navigation in app/views/layouts/application.html.erb"
  end
end 