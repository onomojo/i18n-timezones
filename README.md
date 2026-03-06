# I18n Timezones

[![Gem Version](https://badge.fury.io/rb/i18n-timezones.svg)](https://rubygems.org/gems/i18n-timezones)
[![CI](https://github.com/onomojo/i18n-timezones/actions/workflows/ci.yml/badge.svg)](https://github.com/onomojo/i18n-timezones/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Provides timezone translations for Rails applications. Translates `ActiveSupport::TimeZone` names via I18n so that `time_zone_select` and similar helpers display localized timezone names.

## Why This Gem?

As of Rails 8.x, **Rails does not provide native timezone translations**. The `ActiveSupport::TimeZone#to_s` method returns English timezone names regardless of the current locale. This gem fills that gap by overriding `to_s` to look up translations via `I18n.t`.

## Requirements

- Ruby >= 3.1
- Rails >= 7.0 (or `activesupport` + `railties` >= 7.0)

## Installation

Add to your Gemfile:

```ruby
gem 'i18n-timezones'
```

## Usage

Timezones are automatically translated to the current locale:

```ruby
time_zone_select :user, :time_zone, ActiveSupport::TimeZone.us_zones,
                 default: "Pacific Time (US & Canada)"
```

Or simply:

```ruby
time_zone_select :user, :time_zone
```

The `:default` value also gets translated to the current locale.

You can also use translations directly:

```ruby
I18n.locale = :de
ActiveSupport::TimeZone["Tokyo"].to_s
# => "(GMT+09:00) Tokio"
```

## Supported Locales

Translations are provided for 36 locales:

ar, bn, ca, cs, da, de, el, en, es, eu, fi, fr, he, hi, hr, hu, id, it, ja, ko, ms, nl, no, pl, pt, pt-BR, ro, ru, sq, sv, th, tr, uk, vi, zh-CN, zh-TW

## Without Rails

If you're using ActiveSupport without Rails, load the locale files manually:

```ruby
require "i18n"
require "active_support"
require "i18n_timezones/timezone"

I18n.load_path += Dir[File.join(Gem.loaded_specs["i18n-timezones"].full_gem_path, "rails/locale/*.yml")]
```

## Contributing

### Adding a new locale

1. Copy `rails/locale/en.yml` to `rails/locale/<locale>.yml`
2. Translate all timezone names
3. Run tests: `bundle exec rake spec`
4. Submit a pull request

### Running tests

```bash
bundle install
bundle exec rake spec
```

## Known Limitations

- `TimeZone#to_s` is translated, but `TimeZone#name` intentionally returns the original English name. The English name is used as a lookup key for translations and must remain stable.

## License

MIT
