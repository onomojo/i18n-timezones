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

Translation data is provided by the [`i18n-timezones-data`](https://github.com/onomojo/i18n-timezones-data) gem, which is installed automatically as a dependency.

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

I18n.locale = :ja
ActiveSupport::TimeZone["Tokyo"].to_s
# => "(GMT+09:00) 東京"
```

## Supported Locales

Translations are provided for **36 locales** covering all 152 Rails timezones:

ar, bn, ca, cs, da, de, el, en, es, eu, fi, fr, he, hi, hr, hu, id, it, ja, ko, ms, nl, no, pl, pt, pt-BR, ro, ru, sq, sv, th, tr, uk, vi, zh-CN, zh-TW

## How It Works

This gem uses a [Railtie](https://api.rubyonrails.org/classes/Rails/Railtie.html) to automatically load translations after Rails initializes. Translations are loaded from the [`i18n-timezones-data`](https://github.com/onomojo/i18n-timezones-data) gem via `I18n.backend.store_translations`, scoped under `timezones:`.

If your app sets `config.i18n.available_locales`, only the matching locales will be loaded.

## Without Rails

If you're using ActiveSupport without Rails, load translations manually:

```ruby
require "i18n"
require "yaml"
require "active_support"
require "i18n_timezones/timezone"
require "i18n_timezones_data"

Dir[File.join(I18nTimezonesData.data_dir, "*.yml")].each do |file|
  locale = File.basename(file, ".yml").to_sym
  translations = YAML.safe_load(File.read(file))
  I18n.backend.store_translations(locale, timezones: translations)
end
```

## Contributing

Translation data lives in the [`i18n-timezones-data`](https://github.com/onomojo/i18n-timezones-data) repo. To add or fix translations, submit a pull request there.

### Running tests

```bash
bundle install
bundle exec rspec
```

## Also Available for JavaScript

- [`i18n-timezones-js`](https://www.npmjs.com/package/i18n-timezones-js) — The same translations for JavaScript/TypeScript projects

## Known Limitations

- `TimeZone#to_s` is translated, but `TimeZone#name` intentionally returns the original English name. The English name is used as a lookup key for translations and must remain stable.

## License

MIT
