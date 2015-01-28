# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dry_option_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "dry_option_parser"
  spec.version       = DryOptionParser::VERSION
  spec.authors       = ["Petr Skocik"]
  spec.email         = ["pskocik@gmail.com"]
  spec.summary       = %q{Save keystrokes with OptionParser while using more or less the same API.}
  spec.description   = %q{Save keystrokes with OptionParser while using more or less the same API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
