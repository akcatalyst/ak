# Module Configuration for Akcatalyst
# This file controls which modules are mounted and their configuration

module Akcatalyst
  class ModuleConfig
    # Define which modules are enabled
    ENABLED_MODULES = %w[blog paracomic space india].freeze

    # Module-specific configurations
    MODULE_CONFIGS = {
      blog: {
        mount_path: '/blog',
        title: 'Blog',
        description: 'Blog and content management',
        enabled: true
      },
      paracomic: {
        mount_path: '/paracomic',
        title: 'Paracomic',
        description: 'Comedy shows and entertainment',
        enabled: true
      },
      space: {
        mount_path: '/space',
        title: 'Space',
        description: 'Space exploration and management',
        enabled: true
      },
      india: {
        mount_path: '/india',
        title: 'India',
        description: 'India-specific features and localization',
        enabled: true
      }
    }.freeze

    # Get all enabled modules
    def self.enabled_modules
      ENABLED_MODULES.select { |module_name| MODULE_CONFIGS[module_name.to_sym][:enabled] }
    end

    # Get configuration for a specific module
    def self.config_for(module_name)
      MODULE_CONFIGS[module_name.to_sym] || {}
    end

    # Check if a module is enabled
    def self.enabled?(module_name)
      enabled_modules.include?(module_name.to_s)
    end

    # Get all module configurations
    def self.all_configs
      MODULE_CONFIGS
    end
  end
end 