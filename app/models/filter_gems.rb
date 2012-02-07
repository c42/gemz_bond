class FilterGems
  def self.from_gzipped_source(gzipped_input)
    filter_list = Settings.filter_specs
    return gzipped_input unless filter_list
  end
end