# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "bootstrad"
  s.summary = "Insert Bootstrad summary."
  s.description = "Insert Bootstrad description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"

  s.add_development_dependency 'rspec-mocks', '~> 2.7.0'
  s.add_development_dependency 'rspec-rails', '~> 2.7.0'
  s.add_development_dependency 'webrat'
  s.add_development_dependency 'ruby-debug19'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'fabrication'
  s.add_development_dependency 'yard'

  s.add_dependency 'actionpack', '~> 3.1.1'
  s.add_dependency 'mongoid', '~> 2.3.3'
  s.add_dependency 'bson_ext', '~> 1.4.0'
  s.add_dependency 'kaminari', '~> 0.12.4'
end