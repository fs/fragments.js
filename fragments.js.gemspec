# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fragments/version"

Gem::Specification.new do |spec|
  spec.name          = "fragments.js"
  spec.version       = Fragments::VERSION
  spec.authors       = ["Flatstack"]
  spec.email         = ["support@flatstack.com"]
  spec.summary       = "Update page fragments from AJAX response"
  spec.description   = "Update page fragments from AJAX response"
  spec.homepage      = "https://github.com/fs/fragments.js"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "jasmine"
end
