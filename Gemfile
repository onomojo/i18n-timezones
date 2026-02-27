# frozen_string_literal: true

source "https://rubygems.org"

gemspec

rails_version = ENV.fetch("RAILS_VERSION", nil)
if rails_version
  gem "activesupport", "~> #{rails_version}.0"
  gem "railties", "~> #{rails_version}.0"
end

group :development, :test do
  gem "rspec", "~> 3.12"
  gem "i18n-spec", "~> 0.6"
  gem "rake", "~> 13.0"
end
