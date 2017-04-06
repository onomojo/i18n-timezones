namespace :i18n_timezones do
  desc "Lookup for missing translations of time zones in locale of country it is located." \
       "Set locales via I18N_LOCALES=[ru, en, se] to override I18n.available_locales.\n " \
       "Usage example: `$ rake i18n_timezones:lookup_missing_translations[csv] I18N_LOCALES=[ru]`"
  task lookup_missing_translations: :i18n_setup do
    require 'countries'
    require 'active_support/all'

    supported_locales = I18n.available_locales
    puts "looking for locales: #{supported_locales.join ', '}"
    ISO3166::Country.all.each do |country|
      locales = country.languages_spoken.map(&:to_sym) & supported_locales
      next unless locales.present?
      timezones = TZInfo::Country.get(country.alpha2).zones

      timezones.each do |tzinfo|
        city = tzinfo.name[%r{[^/]+\z}]
        locales.each do |locale|
          begin
            I18n.locale = locale
            I18n.t(city, scope: :timezones, raise: true, separator: "\001")
          rescue I18n::MissingTranslationData => e
            puts "#{e.message} (#{country.name}) (+#{tzinfo.current_period.offset.utc_offset / 3600.0})"
          end
        end
      end
    end
  end

  desc "Setup I18n for this gem"
  task :i18n_setup do
    require 'i18n'

    Dir.chdir(File.expand_path('../../../../rails/locale', __FILE__)) do
      config = I18n.config
      config.available_locales =
        if (locales_string = ENV['I18N_LOCALES'])
          locales_string[/(?<=\[).+(?=\])/].split(/[\s,]+/)
        else
          Dir['*.yml'].map { |x| x[/.+(?=.yml)/] } - %w[en]
        end
      config.default_locale = config.available_locales.first
      config.load_path = Dir['*.yml'].map { |x| File.join(Dir.pwd, x) }
    end
  end
end
