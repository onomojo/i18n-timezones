# frozen_string_literal: true

require "rails/railtie"
require "yaml"
require "i18n_timezones_data"

module I18nTimezones
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      data_dir = I18nTimezonesData.data_dir
      locales = Rails.application.config.i18n.available_locales

      Dir[File.join(data_dir, "*.yml")].each do |file|
        locale = File.basename(file, ".yml").to_sym
        next if locales.present? && !locales.include?(locale)

        translations = YAML.safe_load(File.read(file))
        I18n.backend.store_translations(locale, timezones: translations)
      end
    end
  end
end
