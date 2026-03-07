# frozen_string_literal: true

require "spec_helper"

I18n.available_locales.each do |locale|
  describe "#{locale} translations" do
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
