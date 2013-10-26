$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails-client-logger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails-client-logger"
  s.version     = RailsClientLogger::VERSION
  s.authors     = ["Girish Sonawane", "Julien 'Lta' Ballet"]
  s.email       = ["girish.sonawane@gmail.com", "elthariel@gmail.com"]
  s.homepage    = "https://github.com/girishso/rails-client-logger"
  s.summary     = "Rails engine for logging from Browser Javascript to server"
  s.description = "Rails engine for logging from Browser Javascript to server"

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "protected_attributes"
end
