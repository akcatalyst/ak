module India
  class Engine < ::Rails::Engine
    isolate_namespace India

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer "india.assets" do |app|
      app.config.assets.precompile += %w( india_manifest.js )
    end
  end
end 