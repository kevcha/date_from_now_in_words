# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date_from_now_in_words/version'

Gem::Specification.new do |spec|
  spec.name          = 'date_from_now_in_words'
  spec.version       = DateFromNowInWords::VERSION
  spec.authors       = ['Kévin Chavanne']
  spec.email         = ['kevin@craftsmen.io']

  spec.summary       = 'date_from_now_in_words rails helper'
  spec.description   = 'Adds a date_from_now_in_words helper for rails similar to time_ago_in_words built in one.'
  spec.homepage      = 'http://github.com/kevcha/date_from_now_in_words'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '~> 4.2', '>= 4.2.4'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
