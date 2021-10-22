require 'spec_helper'

describe ActiveSupport::TimeZone do
  before { I18n.locale = locale }

  describe '#to_s' do
    let(:locale) { :de }

    before { load File.join(File.dirname(__FILE__), '../../lib/i18n_timezones/timezone.rb') }

    it 'localizes the timezone name that appears within the string representation' do
      zone = ActiveSupport::TimeZone.new('American Samoa')
      expect(zone.to_s).to eq('(GMT-11:00) Amerikanisch-Samoa')
    end
  end

  describe '#name' do
    let(:locale) { :fr }

    it 'localizes the timezone name' do
      expect(ActiveSupport::TimeZone.new('Chatham Is.').name).to eq('Îles Chatham')
    end
  end
end
