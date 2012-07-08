require 'spec_helper'

Dir.glob("rails/locale/*.yml") do |locale_file|
  describe "a i18n-timezones #{locale_file} locale file" do
    it_behaves_like 'a valid locale file', locale_file
    I18n.locale = locale_file.split('/').last.split('.').first
    ActiveSupport::TimeZone.all.each do |zone|
      it { I18n.t(zone.name, :scope => :timezones, :separator => "\001").should_not == zone }
    end
  end
end