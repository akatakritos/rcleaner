# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rcleaner/version'

Gem::Specification.new do |spec|
  spec.name          = "rcleaner"
  spec.version       = Rcleaner::VERSION
  spec.authors       = ["Matt Burke"]
  spec.email         = ["burkemd1+github@gmail.com"]
  spec.summary       = %q{cleans directories}
  spec.description   = %q{cleans directories using a DSL}
  spec.homepage      = "http://www.mattburkedev.com/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "guard"
  spec.add_development_dependency 'guard-rspec'
end
