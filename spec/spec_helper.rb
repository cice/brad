require 'rubygems'
require 'bundler/setup'

require 'rspec/rails/mocks'
require 'capybara/rspec'

require 'brad'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include HelperSupport, :type => :helper
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
end
