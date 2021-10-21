require 'spec_helper'

Dir.glob('rails/locale/*.yml') do |locale_file|
  describe 'a i18n-timezones #{locale_file} locale file' do
    let(:options) { {:scope => :timezones, :separator => "\001"} }

    it_behaves_like 'a valid locale file', locale_file

    before { I18n.locale = locale_file.split('/').last.split('.').first }

    ActiveSupport::TimeZone.all.each do |zone|
      it { expect(I18n.t(zone.name, options)).not_to eq(zone) }
      it { expect(I18n.t(zone.name, options).include?('translation missing')).to eq(false) }
    end
  end
end
