# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
else
  require 'simplecov'
  SimpleCov.start 'rails'
end

require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'rails/test_help'
Rails.backtrace_cleaner.remove_silencers!

require 'minitest/autorun'
require 'capybara/rails'

require 'debugger'
Debugger.settings[:autoeval] = true

require 'turn'
Turn.config.format = :cool
Turn.config.natural = true
Turn.config.verbose = true

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# For generators
require 'rails/generators/test_case'
require 'generators/twbs_sass_rails/install/install_generator'

class IntegrationTest < MiniTest::Spec
  include Capybara::DSL
  register_spec_type(/integration$/, self)
end
