# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "brad/version"

Gem::Specification.new do |s|
  s.name = "brad"
  s.version = Brad::VERSION
  s.summary = "Bootstrap based RAD Framework for Rails 4"
  s.description = "Bootstrap based RAD Framework for Rails 4"
  s.authors     = ["Marian Theisen"]
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]

  s.add_dependency 'actionpack', '>= 4.0.0'
  s.add_dependency 'kaminari', '~> 0.13.0'
  s.add_dependency 'inherited_resources', '~> 1.6.0'
end
