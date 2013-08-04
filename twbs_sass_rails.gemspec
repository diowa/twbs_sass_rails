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
  s.summary     = 'Bootstrap Sass assets in a Rails application.'
  s.description = s.summary
  s.license     = 'BSD 2-Clause'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'rails', '>= 3.2.14'
  s.add_dependency 'therubyracer'
  s.add_dependency 'less-rails'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'debugger'
  s.add_development_dependency 'minitest', '~> 4'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'turn'
end
