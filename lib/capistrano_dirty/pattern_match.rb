class CapistranoDirty::PatternMatch
  attr_reader :pattern_name, :file_path

  def initialize(pattern_name, file_path)
    @pattern_name = pattern_name
    @file_path = file_path
  end

  def to_s
    "#{@pattern_name} found in #{@file_path}"
  end

  def ==(other)
    other.is_a?(CapistranoDirty::PatternMatch) &&
      @pattern_name == other.pattern_name &&
      @file_path == other.file_path
  end
end
