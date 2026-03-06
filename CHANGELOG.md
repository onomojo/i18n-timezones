## 2.1.0

### New Features
- Added Bengali (bn) locale
- Added Croatian (hr) locale
- Added Czech (cs) locale
- Added Danish (da) locale
- Added Greek (el) locale
- Added Hindi (hi) locale
- Added Hungarian (hu) locale
- Added Indonesian (id) locale
- Added Malay (ms) locale
- Added Romanian (ro) locale
- Added Turkish (tr) locale
- Added Vietnamese (vi) locale

### Bug Fixes
- Fixed Dutch translation of "Lima" (was incorrectly "Vijf", meaning "Five")
- Fixed Hebrew duplicate entries for "Kyiv" and "Ulaanbaatar"
- Fixed Portuguese (pt, pt-BR) translation of "Ulaanbaatar" (was "Ulaan Bataar")
- Fixed Dutch translation of "Ulaanbaatar" (was "Ulaan Bataar")

### Improvements
- Removed dead "Ulaan Bataar" keys from 9 locales (Rails uses "Ulaanbaatar")
- Normalized key ordering across all locale files to match en.yml
- Removed duplicate timezone entries from 12 locale files

## 2.0.0

### Breaking Changes
- Minimum Ruby version is now 3.1 (was 2.3)
- Minimum Rails/ActiveSupport version is now 7.0 (was 5.1)
- Runtime dependency changed from `rails` to `activesupport` + `railties`
- License simplified to MIT only (removed GPL-3.0)

### New Features
- Added English (en) locale file
- Added Albanian (sq) locale
- Added Basque (eu) locale
- Added Catalan (ca) locale
- Added Finnish (fi) locale
- Added Norwegian (no) locale
- Added Swedish (sv) locale
- Added Thai (th) locale
- Added Ukrainian (uk) locale
- Added Asuncion timezone to all locales

### Bug Fixes
- Fixed Korean and Japanese pronunciation of Kyiv to Ukrainian style
- Fixed Spanish translations: Muscat (Mascate), Kolkata (Calcuta)
- Fixed spec_helper.rb redefining Ruby's built-in RbConfig module

### Improvements
- Replaced Travis CI with GitHub Actions (Ruby 3.1-3.3 x Rails 7.0-8.0 matrix)
- Converted README from rdoc to Markdown
- Modernized Ruby syntax (frozen string literals, new hash syntax)
- Railtie now requires only `rails/railtie` instead of all of Rails
- Railtie loading is conditional on `defined?(Rails::Railtie)`
- Test suite no longer boots a full Rails application
- Removed Gemfile.lock from repository
- Fixed MIT-LICENSE copyright holder

## 1.4.8

- Updating dependencies. Adding Puerto Rico.

## 1.4.7

- Updating dependencies. Fixing Ulaanbaatar and Kyiv translation names, typo in Russian translation of "Solomon Is.", some zh-CN translations.

## 1.3.7

- Adding Polish translation

## 1.3.6

- Fix mistakes of translation in Japanese. add hebrew translation. Fix Buenos Aires name in Russian

## 1.3.5

- Adding pt-BR

## 1.3.4

- Added missing Russian Federation timezones. Russian name of "Central America" was fixed.

## 1.3.3

- Fix ru translation for Paris

## 1.3.2

- Adding zh-CN and updating de

## 1.3.1

- Adding license to gemspec

## 1.3

- Upgrading to Rails 4

## 1.2.3

- Adding Arabic, Italian, Dutch, Portuguese, and Chinese (Traditional) locales

## 1.2.2

- Adding Japansese locale

## 1.2.1

- Fixing a German translation

## 1.2

- Adding German locale

## 0.1.1

- Adding Russian locale

## 0.1.0

- Adding Korean locale
