lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "capistrano_dirty/version"

Gem::Specification.new do |spec|
  spec.name          = "capistrano-dirty"
  spec.version       = CapistranoDirty::VERSION
  spec.authors       = ["Jamie Schembri"]
  spec.email         = ["jamie@lico.nl"]

  spec.summary       = %q{Checks for dirty strings in a codebase}
  spec.description   = "Checks for dirty strings in a codebase based on a list of patterns. "\
                       "This may be used to prevent deployment if found."
  spec.homepage      = "https://github.com/bluerail/capistrano-dirty"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "capistrano", ">= 3.0.0"
end
