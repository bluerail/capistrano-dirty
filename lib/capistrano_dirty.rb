module CapistranoDirty
  require 'capistrano_dirty/pattern_finder'
  require 'capistrano_dirty/pattern_match'

  PATTERNS = {
    'Git conflict markers' => /^[<>=]{7}/,
    'FIXME' => /FIXME/,
    'Pry' => /binding\.pry/
  }.freeze

  def self.dirty?(path = nil)
    path ||= Dir.pwd

    Dir["#{path}/**/*"].each do |filename|
      next unless File.file?(filename) # skip directories

      file = File.read(filename)
      PATTERNS.each do |name, pattern|
        matches = CapistranoDirty::PatternFinder.match(file, pattern)

        relative_filename = filename.sub(%r{\A#{path}/?}, '')

        return PatternMatch.new(name, relative_filename) if matches
      end
    end

    false
  end
end
