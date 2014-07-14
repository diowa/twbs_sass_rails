source "https://rubygems.org"

gemspec path: '../'

# Dummy application dependencies
gem 'rails', '3.2.19'
gem 'uglifier'
gem 'minitest', '~> 4'
gem 'sprockets-rails', '=2.0.0.backport1'
gem 'sprockets', '=2.2.2.backport2'
gem 'sass-rails', github: 'guilleiguaran/sass-rails', branch: 'backport'
