module Space
  class Engine < ::Rails::Engine
    isolate_namespace Space

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer "space.assets" do |app|
      app.config.assets.precompile += %w( space_manifest.js )
    end
  end
end 