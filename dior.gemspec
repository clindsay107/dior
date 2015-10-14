# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dior'

Gem::Specification.new do |spec|
  spec.name          = "dior"
  spec.version       = Dior::VERSION
  spec.authors       = ["clindsay107"]
  spec.email         = ["clindsay107@gmail.com"]

  spec.summary       = "A command line music thing"
  spec.homepage      = "https://github.com/clindsay107/dior"
  spec.license       = "GPL-3.0"

  spec.files         = Dir['{lib,bin}/**/*']
  spec.executables   << "dior"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 0"
end
