# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twbs_sass_rails/version'

Gem::Specification.new do |spec|
  spec.name        = 'twbs_sass_rails'
  spec.version     = TwbsSassRails::VERSION
  spec.authors     = ['diowa']
  spec.email       = ['dev@diowa.com']

  spec.summary     = 'Bootstrap and FontAwesome assets in Rails applications'
  spec.description = 'Provides assets for Bootstrap and FontAwesome in your Rails application.'
  spec.homepage    = 'https://github.com/diowa/twbs_sass_rails'
  spec.license     = 'BSD-2-Clause'

  spec.files         = `git ls-files -z -- {CHANGELOG.md,LICENSE,README.md,app,lib,vendor}`.split("\x0")
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'autoprefixer-rails', '~> 6.1'
  spec.add_runtime_dependency 'sass-rails', '>= 4.0.5', '< 6.0.0'
  spec.add_runtime_dependency 'rails', '>= 4.0.13', '< 5.0.0'

  spec.add_development_dependency 'appraisal', '~> 2.1'
  spec.add_development_dependency 'capybara', '~> 2.5'
  spec.add_development_dependency 'coveralls', '~> 0.8.10'
  spec.add_development_dependency 'minitest', '>= 4.7.5', '< 6.0.0'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'simplecov', '~> 0.11.1'
  spec.add_development_dependency 'uglifier', '~> 2.7'
end
