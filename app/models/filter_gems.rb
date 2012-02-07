require 'rubygems'

class FilterGems
  def self.from_gzipped_source(gzipped_input)
    filter_list = Settings.filter_specs
    return gzipped_input unless filter_list

    input = Marshal.load(Gem.gunzip(gzipped_input))
    output = input.select { |arr| filter_list.include? arr[0] }
    Gem.gzip(Marshal.dump(output))
  end
end