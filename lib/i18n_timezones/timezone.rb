module ActiveSupport
  class TimeZone
    def to_s
      offset = "(GMT#{formatted_offset})"
      translated_name = I18n.t(@name, :scope => :timezones, :default => @name, :separator => "\001")
      "#{offset} #{translated_name}"
    end

    def name
      I18n.t(@name, :scope => :timezones, :default => @name, :separator => "\001")
    end
  end
end
