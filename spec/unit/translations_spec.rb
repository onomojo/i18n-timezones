require 'spec_helper'

Dir.glob("rails/locale/*.yml") do |locale_file|
  describe "a i18n-timezones #{locale_file} locale file" do
    it_behaves_like 'a valid locale file', locale_file
    I18n.locale = locale_file.split('/').last.split('.').first
    ActiveSupport::TimeZone.all.each do |zone|
      p I18n.t(zone.name, :scope => :timezones, :separator => "\001") if I18n.t(zone.name, :scope => :timezones, :separator => "\001").include?('translation missing')
      it { expect(I18n.t(zone.name, :scope => :timezones, :separator => "\001")).not_to eq(zone) }
      it { expect(I18n.t(zone.name, :scope => :timezones, :separator => "\001").include?('translation missing')).to eq(false) }
    end
  end
end
