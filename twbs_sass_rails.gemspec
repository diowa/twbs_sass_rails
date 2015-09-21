$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'twbs_sass_rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'twbs_sass_rails'
  s.version     = TwbsSassRails::VERSION
  s.authors     = ['diowa']
  s.email       = ['dev@diowa.com']
  s.homepage    = 'https://github.com/diowa/twbs_sass_rails'
  s.summary     = 'Bootstrap and FontAwesome assets in Rails applications'
  s.description = 'Provides assets for Bootstrap and FontAwesome in your Rails application.'
  s.license     = 'BSD-2-Clause'

  s.files         = `git ls-files`.split("\n") - `git ls-files -- {src/*,".*"}`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'rails', '>= 4.0.13', '< 5.0.0'
  s.add_runtime_dependency 'sass-rails', '>= 4.0.5', '< 6.0.0'
  s.add_runtime_dependency 'autoprefixer-rails', '~> 6.0'

  s.add_development_dependency 'appraisal', '~> 2.0'
  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coveralls', '~> 0.8.2'
  s.add_development_dependency 'minitest', '>= 4.7.5', '< 6.0.0'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'simplecov', '~> 0.10.0'
  s.add_development_dependency 'uglifier', '~> 2.7'
end
