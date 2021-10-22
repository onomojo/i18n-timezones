# I18nTimezones

The purpose of this gem is to simply provide timezone translations. The gem is intended to be easy to combine with other
gems that require i18n timezone translations so we can have common i18n timezone translation gem.

If you're doing anything with timezones and translations, there's no need to reinvent the wheel and add your own
translations. Just use this gem's timezone translations and skip the hassle of having to add and manage each timezone
translation for each locale.

## Some background on this gem

This gem is forked from this original reposistory that was generously created and published over 10 years ago:
<https://github.com/onomojo/i18n-timezones>. It seemed as though the gem was not receiving the attention it deserved
given the large number of open pull requests for the years, and the number of forks created by other users.

Since [KUDO](https://kudoway.com/about/careers/) is a company with many language specialties, we felt that it would
beneficial to the community if we took this gem under our wing to help it grow and improve. It is our intention to
expand the number of supported locales and to correct any errors found in the existing translations. Of course,
contributions from the community are welcomed with open arms!

## Currently supported Locales

As of October, 2021, there are translations for the following locales:

* Arabic (`:ar`)
* German (`:de`)
* English (`:en`)
* Spanish (`:es`)
* French (`:fr`)
* Hebrew (`:he`)
* Italian (`:it`)
* Japanese (`:ja`)
* Korean (`:ko`)
* Dutch (`:nl`)
* Portuguese (`:pt`)
* Portuguese Brazil (`:pt-BR`)
* Rusian (`:ru`)
* Chinese (`:zh-CN`)
* Chinese Traditional (`:zh-TW`)

## Installation

Add to your Gemfile:

```rb
gem 'i18n-timezones'
```

## Usage

If you're using the standard Rails form helper - `time_zone_select`, then the time zones will automatically be
translated into the current locale, including the `:default` if specified.

```rb
time_zone_select :user, :time_zone, ActiveSupport::TimeZone.us_zones, :default => "Pacific Time (US & Canada)"
```

If you find an error in a translation, please let us know. Please help us fill in the rest of the timezones.

You can also use the `ActiveSupport:TimeZone` directly as shown below:

```rb
I18n.locale = :de
ActiveSupport::TimeZone.all.second.name
=> "Amerikanisch-Samoa"
```

## Implementation

The translation of the timezones is accomplished by overriding the `to_s` method in the `ActiveSupport:TimeZone` class
to translate the `name` property as shown below:

```rb
def to_s
  offset = "(GMT#{formatted_offset})"
  translated_name = I18n.t(name, :scope => :timezones, :default => name, :separator => "\001")
  %(#{offset} #{translated_name})
end
```

## License

MIT
