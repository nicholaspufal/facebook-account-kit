# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'facebook/account_kit/version'

Gem::Specification.new do |spec|
  spec.name          = 'facebook-account-kit'
  spec.version       = Facebook::AccountKit::VERSION
  spec.authors       = ['Nicholas Pufal']
  spec.email         = ['niko.pufal@gmail.com']

  spec.summary       = "A simple Ruby gem that makes it easier to work with Facebook's Account Kit"
  spec.homepage      = 'https://github.com/nicholaspufal/facebook-account-kit'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.1'
end
