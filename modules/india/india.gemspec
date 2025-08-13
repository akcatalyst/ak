Gem::Specification.new do |spec|
  spec.name        = "india"
  spec.version     = "0.0.1"
  spec.authors     = ["Akcatalyst Team"]
  spec.email       = ["hello@akcatalyst.com"]
  spec.homepage    = "https://akcatalyst.com"
  spec.description = "India-specific features and localization for the Akcatalyst modular application"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 8.0.2"
  spec.add_dependency "sqlite3", ">= 2.1"
  spec.add_dependency "turbo-rails"
  spec.add_dependency "stimulus-rails"
  spec.add_dependency "tailwindcss-rails"
end 