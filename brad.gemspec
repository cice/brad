# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "brad/version"

Gem::Specification.new do |s|
  s.name = "brad"
  s.summary = "Bootstrap based RAD Framework for Rails 3.1"
  s.description = "Bootstrap based RAD Framework for Rails 3.1"
  s.authors     = ["Marian Theisen"]
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = Brad::VERSION

  s.add_development_dependency 'rspec-mocks', '~> 2.7.0'
  s.add_development_dependency 'rspec-rails', '~> 2.7.0'
  s.add_development_dependency 'webrat'
  s.add_development_dependency 'ruby-debug19'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'fabrication'
  s.add_development_dependency 'yard'

  s.add_dependency 'actionpack', '>= 3.1.1'
  s.add_dependency 'kaminari', '~> 0.12.4'
  s.add_dependency 'bootstrap-sass', '~> 2.0.0'
  s.add_dependency 'inherited_resources', '~> 1.3.0'
end
