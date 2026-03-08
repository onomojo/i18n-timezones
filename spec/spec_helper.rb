# frozen_string_literal: true

require "active_support"
require "active_support/core_ext/object/blank"
require "active_support/core_ext/time"
require "i18n-spec"
require "i18n"
require "json"
require "i18n_timezones_data"

# Load translations from the data gem
data_dir = I18nTimezonesData.data_dir
Dir[File.join(data_dir, "*.json")].each do |file|
  locale = File.basename(file, ".json").to_sym
  translations = JSON.parse(File.read(file))
  I18n.backend.store_translations(locale, timezones: translations)
end

I18n.default_locale = :en
I18n.available_locales = Dir[File.join(data_dir, "*.json")].map { |f| File.basename(f, ".json").to_sym }

# Load the timezone monkey-patch
require "i18n_timezones/timezone"

RSpec.configure do |config|
  config.mock_with :rspec
end
