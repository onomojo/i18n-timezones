require 'spec_helper'

Dir.glob('rails/locale/*.yml') do |locale_file|
  describe 'a i18n-timezones #{locale_file} locale file' do
    if defined?(ActiveSupport::TimeZone)
      ActiveSupport.send(:remove_const, :TimeZone)
      load 'active_support/values/time_zone.rb'
    end

    let(:options) { {:scope => :timezones, :separator => "\001"} }

    it_behaves_like 'a valid locale file', locale_file

    before { I18n.locale = locale_file.split('/').last.split('.').first }

    ActiveSupport::TimeZone.all.each do |zone|
      it { expect(I18n.t(zone.name, options)).not_to eq(zone) }
      it {
        if I18n.t(zone.name, options).include?('translation missing')
          ActiveSupport::TimeZone.send(:remove_const, :MAPPING)
          ActiveSupport::TimeZone.send(:remove_const, :UTC_OFFSET_WITH_COLON)
          ActiveSupport::TimeZone.send(:remove_const, :UTC_OFFSET_WITHOUT_COLON)
          load 'active_support/values/time_zone.rb'
        end
        expect(I18n.t(zone.name, options).include?('translation missing')).to eq(false)
      }
    end
  end
end
