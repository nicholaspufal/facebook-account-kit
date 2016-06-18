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

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rspec', '~> 3.4.0'
end
