# frozen_string_literal: true

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'
require 'rubocop/rake_task'
require 'scss_lint/rake_task'

RuboCop::RakeTask.new

SCSSLint::RakeTask.new do |t|
  # SCSSLint does not respect config file
  # Workaround for https://github.com/brigade/scss-lint/issues/726
  t.files = Dir['lib/generators/twbs_sass_rails/install/templates/**/*.scss']
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'TwbsSassRails'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.warning = false
end

task default: %i[rubocop scss_lint test]

SUBMODULES = {
  'bootstrap-sass': {
    name: 'Bootstrap Sass',
    sample_version: 'v3.3.7',
    folder: File.expand_path('src/twbs/bootstrap-sass')
  },
  fontawesome: {
    name: 'Font Awesome',
    sample_version: 'v4.7.0',
    folder: File.expand_path('src/FortAwesome/Font-Awesome')
  },
  respond_js: {
    name: 'Respond.js',
    sample_version: '1.4.2',
    folder: File.expand_path('src/scottjehl/Respond')
  }
}.freeze

SOURCE_FILES = {
  bootstrap_main_stylesheets: File.expand_path('src/twbs/bootstrap-sass/assets/stylesheets/_bootstrap.scss'),
  bootstrap_stylesheets: File.expand_path('src/twbs/bootstrap-sass/assets/stylesheets/bootstrap/*.scss'),
  bootstrap_stylesheets_mixins: File.expand_path('src/twbs/bootstrap-sass/assets/stylesheets/bootstrap/mixins/*.scss'),
  bootstrap_javascripts: File.expand_path('src/twbs/bootstrap-sass/assets/javascripts/bootstrap/*.js'),
  fontawesome_fonts: File.expand_path('src/FortAwesome/Font-Awesome/fonts/fontawesome-webfont.*'),
  fontawesome_stylesheets: File.expand_path('src/FortAwesome/Font-Awesome/scss/*.scss'),
  glyphicons_fonts: File.expand_path('src/twbs/bootstrap-sass/assets/fonts/bootstrap/glyphicons-halflings-regular.*'),
  respondjs_javascripts: File.expand_path('src/scottjehl/Respond/dest/respond.src.js')
}.freeze

DESTINATION_FOLDERS = {
  bootstrap_main_stylesheets: File.expand_path('vendor/assets/stylesheets/twbs'),
  bootstrap_stylesheets: File.expand_path('vendor/assets/stylesheets/twbs/bootstrap'),
  bootstrap_stylesheets_mixins: File.expand_path('vendor/assets/stylesheets/twbs/bootstrap/mixins'),
  bootstrap_javascripts: File.expand_path('vendor/assets/javascripts/twbs/bootstrap'),
  fontawesome_fonts: File.expand_path('app/assets/fonts'),
  fontawesome_stylesheets: File.expand_path('vendor/assets/stylesheets/fontawesome'),
  glyphicons_fonts: File.expand_path('app/assets/fonts'),
  respondjs_javascripts: File.expand_path('vendor/assets/javascripts')
}.freeze

namespace :update do
  SUBMODULES.each do |submodule, v|
    desc "Updates #{v[:name]} at specified tag"
    task submodule, :tag do |t, args|
      if args[:tag]
        update_submodule SUBMODULES[submodule], args[:tag]
      else
        puts "Please specify a tag, e.g: rake #{t}[#{SUBMODULES[submodule][:sample_version]}]"
      end
    end
  end

  desc 'Update assets'
  task :assets do
    # git submodule add https://github.com/FortAwesome/Font-Awesome.git src/FortAwesome/Font-Awesome/
    # git submodule add https://github.com/scottjehl/Respond.git src/scottjehl/Respond
    # git submodule add https://github.com/twbs/bootstrap-sass.git src/twbs/bootstrap-sass

    puts 'Preparing destination folders...'
    remove_content_from_destination_folders

    puts 'Copying new assets...'
    copy_source_files_to_destination_folders

    puts 'Importing bootstrap-sprockets.js'
    FileUtils.cp File.expand_path('src/twbs/bootstrap-sass/assets/javascripts/bootstrap-sprockets.js'), File.expand_path('vendor/assets/javascripts/twbs/bootstrap.js')

    puts 'Updating font paths...'
    update_fontawesome_paths
    update_glyphicons_paths

    puts 'Disabling glyphicons...'
    disable_glyphicons

    puts 'Renaming respond.src.js...'
    rename_respond_js

    puts 'Done. RUN TESTS NOW!'
  end
end

private

def update_submodule(submodule, tag)
  return unless tag
  puts "Updating #{submodule[:name]} at #{tag}..."
  `cd #{submodule[:folder]} && git fetch && git fetch --tags && git checkout #{tag}`
end

def remove_content_from_destination_folders
  DESTINATION_FOLDERS.each_value do |v|
    FileUtils.rm_rf Dir.glob("#{v}/*")
  end
end

def copy_source_files_to_destination_folders
  SOURCE_FILES.each do |k, v|
    FileUtils.mkdir_p DESTINATION_FOLDERS[k] unless File.directory?(DESTINATION_FOLDERS[k])
    FileUtils.cp Dir.glob(v), DESTINATION_FOLDERS[k]
  end
end

def update_fontawesome_paths
  file_name = "#{DESTINATION_FOLDERS[:fontawesome_stylesheets]}/_path.scss"
  text = File.read(file_name)
  text.gsub! %r{url\(\'\#{\$fa-font-path}\/([\w\-.#]+)[^\)]*\)}, "font-url('\\1')"
  text.gsub! "fontawesome-webfont.eot') format('embedded-opentype')", "fontawesome-webfont.eot?\#iefix') format('embedded-opentype')"
  text.gsub! "font-url('fontawesome-webfont.svg') format('svg');", "font-url('fontawesome-webfont.svg#fontawesomeregular') format('svg');"
  text.gsub! "//  src: font-url('FontAwesome.otf') format('opentype'); // used when developing fonts", ''
  File.open(file_name, 'w') { |file| file.puts text }
end

def update_glyphicons_paths
  file_name = "#{DESTINATION_FOLDERS[:bootstrap_stylesheets]}/_glyphicons.scss"
  text = File.read(file_name)
  text.gsub!(/url\(if.*\#\{\$icon-font-name\}\.(.*)\)\)(.*)/, "font-url('\#{$icon-font-name}.\\1)\\2")
  File.open(file_name, 'w') { |file| file.puts text }
end

def disable_glyphicons
  file_name = "#{DESTINATION_FOLDERS[:bootstrap_main_stylesheets]}/_bootstrap.scss"
  text = File.read(file_name)
  text.gsub! "@import \"bootstrap/glyphicons\";\n", ''
  File.open(file_name, 'w') { |file| file.puts text }
end

def rename_respond_js
  file_name = "#{DESTINATION_FOLDERS[:respondjs_javascripts]}/respond.src.js"
  file_new_name = "#{DESTINATION_FOLDERS[:respondjs_javascripts]}/respond.js"
  File.rename(file_name, file_new_name)
end
