lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coursegen/version'

Gem::Specification.new do |spec|
  spec.name          = 'coursegen'
  spec.version       = Coursegen::VERSION
  spec.authors       = ['Pito Salas']
  spec.email         = ['pitosalas@gmail.com']
  spec.summary       = 'Use Nanoc to build courses and deploy them to S3'
  spec.description   = 'Use Nanoc to build courses and deploy them to S3'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  
  spec.add_dependency 'activesupport'
  spec.add_dependency 'byebug'
  spec.add_dependency 'cri'
  spec.add_dependency 'guard'
  spec.add_dependency 'guard-shell'
  spec.add_dependency 'icalendar'
  spec.add_dependency 'kramdown'
  spec.add_dependency 'nanoc'
  spec.add_dependency 'nanoc-live'
  spec.add_dependency 'nokogiri'
  spec.add_dependency 'rubytree'
  spec.add_dependency 'thor'
  spec.add_dependency 'tzinfo'
end
