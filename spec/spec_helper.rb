ENV["RAILS_ENV"] = "test"

require 'rspec'
require 'i18n-spec'
require 'i18n/core_ext/hash'
require 'active_support'
require 'rails/all'
require 'i18n-timezones'

RSpec.configure do |config|
  config.mock_with :rspec
  config.fail_fast = true
end

module Config
  class Application < ::Rails::Application
    # configuration here if needed
    config.active_support.deprecation = :stderr
  end
end
 
# Initialize the application
Config::Application.initialize!
