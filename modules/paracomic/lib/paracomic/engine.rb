module Paracomic
  class Engine < ::Rails::Engine
    isolate_namespace Paracomic

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer "paracomic.assets" do |app|
      app.config.assets.precompile += %w( paracomic_manifest.js )
    end
  end
end 