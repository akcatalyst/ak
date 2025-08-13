module Blog
  class Engine < ::Rails::Engine
    isolate_namespace Blog

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer "blog.assets" do |app|
      app.config.assets.precompile += %w( blog_manifest.js )
    end
  end
end 