ENV['RAILS_ENV'] = 'test'

require 'i18n-spec'
require 'i18n/core_ext/hash'
require 'i18n-timezones'
require 'active_support'

RSpec.configure do |config|
  config.mock_with :rspec
  config.fail_fast = true
end

module RbConfig
  class Application < ::Rails::Application
    # configuration here if needed
    config.active_support.deprecation = :stderr
  end
end

# Initialize the application
RbConfig::Application.initialize!
