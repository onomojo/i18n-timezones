# frozen_string_literal: true

require "active_support"
require "active_support/core_ext/object/blank"
require "active_support/core_ext/time"
require "i18n-spec"
require "i18n"

# Load locale files directly without needing a Rails application
locale_dir = File.expand_path("../../rails/locale", __FILE__)
I18n.load_path += Dir[File.join(locale_dir, "*.yml")]
I18n.default_locale = :en
I18n.available_locales = Dir[File.join(locale_dir, "*.yml")].map { |f| File.basename(f, ".yml").to_sym }

# Load the timezone monkey-patch
require "i18n_timezones/timezone"

RSpec.configure do |config|
  config.mock_with :rspec
end
