# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brim/version'

Gem::Specification.new do |gem|
  gem.name          = "brim"
  gem.version       = Brim::VERSION
  gem.authors       = ["ttaylo201"]
  gem.email         = ["Thomas_Taylor2@cable.comcast.com"]
  gem.description   = %q{A collection of Thor scripts for non-Rails projects in Ruby (plus some useful dotfiles}
  gem.summary       = %q{Can also be used for bash}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'thor'
end
