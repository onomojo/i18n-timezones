# frozen_string_literal: true

require_relative "lib/i18n_timezones/version"

Gem::Specification.new do |s|
  s.name        = "i18n-timezones"
  s.version     = I18nTimezones::VERSION
  s.authors     = ["Brian McQuay"]
  s.email       = ["brian@onomojo.com"]
  s.homepage    = "https://github.com/onomojo/i18n-timezones"
  s.summary     = "I18n Timezone Translations"
  s.description = "Provides timezone translations for ActiveSupport::TimeZone. " \
                  "Translates timezone names via I18n for use with time_zone_select and similar helpers."
  s.license     = "MIT"

  s.required_ruby_version = ">= 3.1"

  s.metadata = {
    "homepage_uri"    => s.homepage,
    "source_code_uri" => "https://github.com/onomojo/i18n-timezones",
    "changelog_uri"   => "https://github.com/onomojo/i18n-timezones/blob/master/CHANGELOG.md",
    "bug_tracker_uri" => "https://github.com/onomojo/i18n-timezones/issues"
  }

  s.files = Dir["lib/**/*", "rails/locale/*", "README.md", "CHANGELOG.md", "MIT-LICENSE"]
  s.require_paths = ["lib"]

  s.add_dependency "activesupport", ">= 7.0", "< 9"
  s.add_dependency "railties",      ">= 7.0", "< 9"
  s.add_dependency "i18n",          ">= 1.0", "< 3"
end
