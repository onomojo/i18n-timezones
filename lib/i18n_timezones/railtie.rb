# frozen_string_literal: true

require "rails/railtie"

module I18nTimezones
  class Railtie < ::Rails::Railtie
    initializer "i18n-timezones" do |app|
      I18nTimezones::Railtie.instance_eval do
        pattern = pattern_from(app.config.i18n.available_locales)
        add("rails/locale/#{pattern}.yml")
      end
    end

    class << self
      private

      def add(pattern)
        files = Dir[File.join(File.dirname(__FILE__), "../..", pattern)]
        I18n.load_path.concat(files)
      end

      def pattern_from(args)
        array = Array(args || [])
        array.empty? ? "*" : "{#{array.join(",")}}"
      end
    end
  end
end
