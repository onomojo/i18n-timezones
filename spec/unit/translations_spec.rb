# frozen_string_literal: true

require "spec_helper"

Dir.glob("rails/locale/*.yml") do |locale_file|
  locale = File.basename(locale_file, ".yml")

  describe "#{locale} locale file" do
    it_behaves_like "a valid locale file", locale_file

    context "with locale set to #{locale}" do
      before { I18n.locale = locale }
      after { I18n.locale = :en }

      ActiveSupport::TimeZone.all.each do |zone|
        it "translates #{zone.name}" do
          translation = I18n.t(zone.name, scope: :timezones, separator: "\001")
          expect(translation).not_to include("translation missing")
        end
      end
    end
  end
end
