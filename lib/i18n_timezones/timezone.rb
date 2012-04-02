class ActiveSupport::TimeZone
  def to_s
    offset = "(GMT#{formatted_offset})"
    translated_name = I18n.t(name, :scope => :time_zones, :default => name)
    %(#{offset} #{translated_name})
  end
end