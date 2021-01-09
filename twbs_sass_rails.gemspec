# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
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

  spec.metadata['bug_tracker_uri'] = 'https://github.com/diowa/twbs_sass_rails/issues'
  spec.metadata['changelog_uri']   = 'https://github.com/diowa/twbs_sass_rails/blob/master/CHANGELOG.md'
  spec.metadata['source_code_uri'] = 'https://github.com/diowa/twbs_sass_rails'

  spec.required_ruby_version = '>= 2.4'

  spec.files         = `git ls-files -z -- {CHANGELOG.md,LICENSE,README.md,app,lib,vendor}`.split("\x0")
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'autoprefixer-rails', '>= 9.0', '< 11'
  spec.add_runtime_dependency 'rails', '>= 4.2', '< 6.2'
  spec.add_runtime_dependency 'sassc-rails', '~> 2.1'

  spec.add_development_dependency 'appraisal', '~> 2.3'
  spec.add_development_dependency 'capybara', '~> 3.32'
  spec.add_development_dependency 'coveralls_reborn', '~> 0.20.0'
  spec.add_development_dependency 'minitest', '~> 5.14'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.8'
  spec.add_development_dependency 'rubocop-minitest', '~> 0.10.2'
  spec.add_development_dependency 'rubocop-performance', '~> 1.9'
  spec.add_development_dependency 'rubocop-rails', '~> 2.9'
  spec.add_development_dependency 'rubocop-rake', '~> 0.5.1'
  spec.add_development_dependency 'scss_lint', '~> 0.59.0'
  spec.add_development_dependency 'simplecov', '>= 0.18.5', '< 0.22'
  spec.add_development_dependency 'uglifier', '~> 4.2'
end
