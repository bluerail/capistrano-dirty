module CapistranoDirty::PatternFinder
  # Adding a line with this string and the name of the pattern above
  # the line on which the pattern matches will ignore it.
  DISABLE_STRING_LOOKAHEAD = /(?! # capistrano-dirty:disable)/

  # If there is a match in the file, return the filename
  def self.match(file, pattern)
    regex = build_regex(pattern)

    file.match(regex)
  end

  def self.build_regex(pattern)
    Regexp.new([pattern, DISABLE_STRING_LOOKAHEAD].map(&:source).join)
  end

  def self.disable_string(name)
    [DISABLE_STRING_PREFIX, name].join(' ')
  end
end
