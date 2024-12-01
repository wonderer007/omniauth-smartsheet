# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-smartsheet/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-smartsheet"
  gem.version       = Omniauth::Smartsheet::VERSION
  gem.authors       = ["Alex Vorobiev"]
  gem.email         = ["alex.vorobiev@smartsheet.com"]
  gem.description   = %q{OmniAuth strategy for Smartsheet}
  gem.summary       = %q{OmniAuth strategy for Smartsheet}
  gem.homepage      = "https://github.com/smartsheet-platform/omniauth-smartsheet"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth', '~> 2.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.5'
end
