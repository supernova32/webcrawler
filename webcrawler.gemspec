# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webcrawler/version'

Gem::Specification.new do |spec|
  spec.name          = 'webcrawler'
  spec.version       = Webcrawler::VERSION
  spec.authors       = ['Patricio Cano']
  spec.email         = ['suprnova32@gmail.com']
  spec.description   = %q{Simple webcrawler}
  spec.summary       = %q{A webcrawler that outputs the file dependencies of each visited link}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'anemone'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
