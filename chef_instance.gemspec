# coding: utf-8
require_relative 'lib/version'

Gem::Specification.new do |spec|
  spec.name          = 'chef_instance'
  spec.version       = ChefInstance::VERSION
  spec.authors       = ['Miah Johnson']
  spec.email         = %w(miah@chia-pet.org)
  spec.description   = 'Chef Resource & Provider for building software' \
                       'instances.'
  spec.summary       = 'Chef Resource & Provider Super Classes for' \
                       'building stand-alone instances of software.'
  spec.homepage      = 'https://github.com/viscera/chef_instance'
  spec.license       = 'Apache-2.0'
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r(^bin/)) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r(^(test|spec|features)/))
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'chef', '>= 11.10.4'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'coveralls'
end
