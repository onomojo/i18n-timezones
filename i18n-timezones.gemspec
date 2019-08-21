$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "i18n_timezones/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "i18n-timezones"
  s.version     = I18nTimezones::VERSION
  s.authors     = ["Brian McQuay"]
  s.email       = ["brian@onomojo.com"]
  s.homepage    = "https://github.com/onomojo/i18n-timezones"
  s.summary     = "I18n Timezone Translations"
  s.description = "The purpose of this gem is to simply provide timezone translations. The gem is intended to be easy to combine with other gems that require i18n timezone translations so we can have common i18n timezone translation gem."

  s.files        = Dir.glob("lib/**/*") + Dir.glob("rails/locale/*") +
                   %w(README.rdoc MIT-LICENSE)
  s.test_files = Dir["test/**/*"]
  s.require_path = 'lib'
  s.platform     = Gem::Platform::RUBY
  s.licenses = ['MIT', 'GPL-3.0']

  s.add_dependency('i18n', '>= 0.9.3')
  s.add_runtime_dependency 'rails', '>= 5.1.6.2'
  s.add_development_dependency 'rspec-rails', '>= 3.7.2'
  s.add_development_dependency 'i18n-spec', '>= 0.1.1'
end
