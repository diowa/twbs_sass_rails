begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

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
  t.verbose = false
end

task default: :test

SOURCE_FILES = {
  bootstrap_stylesheets: File.expand_path('src/twbs/bootstrap/less/*.less'),
  bootstrap_javascripts: File.expand_path('src/twbs/bootstrap/js/*.js'),
  fontawesome_stylesheets: File.expand_path('src/FortAwesome/Font-Awesome/less/*.less'),
  glyphicons_fonts: File.expand_path('src/twbs/bootstrap/fonts/*'),
  fontawesome_fonts: File.expand_path('src/FortAwesome/Font-Awesome/font/*'),
}

DESTINATION_FOLDERS = {
  bootstrap_stylesheets: File.expand_path('vendor/assets/stylesheets/twbs/bootstrap'),
  bootstrap_javascripts: File.expand_path('vendor/assets/javascripts/twbs/bootstrap'),
  fontawesome_stylesheets: File.expand_path('vendor/assets/stylesheets/fontawesome'),
  glyphicons_fonts: File.expand_path('app/assets/fonts'),
  fontawesome_fonts: File.expand_path('app/assets/fonts'),
}

desc "Update assets"
task :update_assets do
  # Update submodules
  `git submodule update`

  # Prepare destination folders
  remove_content_from_destination_folders

  # Copy new assets
  copy_source_files_to_destination_folders

  # Remove unneeded assets
  FileUtils.rm_rf "#{DESTINATION_FOLDERS[:fontawesome_fonts]}/FontAwesome.otf"
  FileUtils.rm_rf "#{DESTINATION_FOLDERS[:fontawesome_stylesheets]}/font-awesome-ie7.less"

  # Adding respond.js
  FileUtils.cp File.expand_path('src/scottjehl/Respond/respond.src.js'), File.expand_path('vendor/assets/javascripts/respond.js')

  # Update font paths
  update_fontawesome_paths
  update_glyphicons_paths

  # Disabling glyphicons from default components
  disable_glyphicons
end

def remove_content_from_destination_folders
  DESTINATION_FOLDERS.each do |_, v|
    FileUtils.rm_rf Dir.glob("#{v}/*")
  end
end

def copy_source_files_to_destination_folders
  SOURCE_FILES.each do |k, v|
    FileUtils.cp Dir.glob(v), DESTINATION_FOLDERS[k]
  end
end

def update_fontawesome_paths
  file_name = "#{DESTINATION_FOLDERS[:fontawesome_stylesheets]}/path.less"
  text = File.read(file_name)
  text.gsub! /url\(\'@{FontAwesomePath}\/([\w\-.#]+)[^\)]*\)/, "asset-url('\\1')"
  text.gsub! "fontawesome-webfont.eot') format('embedded-opentype')", "fontawesome-webfont.eot?\#iefix') format('embedded-opentype')"
  text.gsub! "//  src: asset-url('FontAwesome.otf') format('opentype'); // used when developing fonts", ''
  File.open(file_name, 'w') { |file| file.puts text }
end

def update_glyphicons_paths
  icon_font_name = File.read("#{DESTINATION_FOLDERS[:bootstrap_stylesheets]}/variables.less").match(/@icon\-font\-name:\s+"([^\"]+)"/)[1]
  file_name = "#{DESTINATION_FOLDERS[:bootstrap_stylesheets]}/glyphicons.less"
  text = File.read(file_name)
  text.gsub! /url\(\'@{icon-font-path}@{icon-font-name}/, "asset-url('#{icon_font_name}"
  File.open(file_name, 'w') { |file| file.puts text }
end

def disable_glyphicons
  file_name = "#{DESTINATION_FOLDERS[:bootstrap_stylesheets]}/bootstrap.less"
  text = File.read(file_name)
  text.gsub! '@import "glyphicons.less";', ''
  File.open(file_name, 'w') { |file| file.puts text }
end
