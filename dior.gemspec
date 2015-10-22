# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dior/version'

Gem::Specification.new do |spec|
  spec.name          = "dior"
  spec.version       = Dior::VERSION
  spec.authors       = ["strongcode"]
  spec.email         = ["clindsay107@gmail.com"]

  spec.summary       = "A command line music thing"
  spec.homepage      = "https://github.com/strong-code/dior"
  spec.license       = "GPL-3.0"

  spec.files         = Dir['{lib,bin}/**/*']
  spec.executables   << "dior"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"

  spec.add_dependency "audite", "0.4.0"
  spec.add_dependency "curses"
end
