# coding: utf-8
require_relative 'lib/chef_instance/version'

Gem::Specification.new do |spec|
  spec.name          = 'chef_instance'
  spec.version       = ChefInstance::VERSION
  spec.authors       = ['Miah Johnson']
  spec.email         = %w(miah@chia-pet.org)
  spec.description   = 'Chef Resource & Provider for building software' \
                       'instances.'
  spec.summary       = 'Chef Resource & Provider Super Classes for' \
                       'building stand-alone instances of software.'
  spec.homepage      = 'https://github.com/miah/chef_instance'
  spec.license       = 'Apache-2.0'
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r(^bin/)) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r(^(test|spec|features)/))
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'chef', '>= 11.10.4'
  spec.add_development_dependency 'coveralls', '~> 0.7.0'
  spec.add_development_dependency 'inch', '~> 0.4.0'
  spec.add_development_dependency 'minitest', '~> 5.3.1'
  spec.add_development_dependency 'rake', '~> 10.1.1'
  spec.add_development_dependency 'rubocop', '~> 0.19.1'
  spec.add_development_dependency 'yard', '~> 0.8.7.3'
end
