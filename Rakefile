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

SUBMODULES = {
  :'bootstrap-sass' => {
    name: 'Bootstrap Sass',
    sample_version: 'v3.1.0',
    folder: File.expand_path('src/twbs/bootstrap-sass')
  },
  fontawesome: {
    name: 'Font Awesome',
    sample_version: 'v4.0.3',
    folder: File.expand_path('src/FortAwesome/Font-Awesome')
  },
  respond_js: {
    name: 'Respond.js',
    sample_version: '1.4.1',
    folder: File.expand_path('src/scottjehl/Respond')
  }
}

SOURCE_FILES = {
  bootstrap_stylesheets: File.expand_path('src/twbs/bootstrap-sass/vendor/assets/stylesheets/bootstrap/*.scss'),
  bootstrap_javascripts: File.expand_path('src/twbs/bootstrap-sass/vendor/assets/javascripts/bootstrap/*.js'),
  fontawesome_stylesheets: File.expand_path('src/FortAwesome/Font-Awesome/scss/*.scss'),
  glyphicons_fonts: File.expand_path('src/twbs/bootstrap-sass/vendor/assets/fonts/bootstrap/glyphicons-halflings-regular.*'),
  fontawesome_fonts: File.expand_path('src/FortAwesome/Font-Awesome/fonts/fontawesome-webfont.*'),
}

DESTINATION_FOLDERS = {
  bootstrap_stylesheets: File.expand_path('vendor/assets/stylesheets/twbs/bootstrap'),
  bootstrap_javascripts: File.expand_path('vendor/assets/javascripts/twbs/bootstrap'),
  fontawesome_stylesheets: File.expand_path('vendor/assets/stylesheets/fontawesome'),
  glyphicons_fonts: File.expand_path('app/assets/fonts'),
  fontawesome_fonts: File.expand_path('app/assets/fonts'),
}

namespace :update do
  SUBMODULES.each do |submodule, v|
    desc "Updates #{v[:name]} at specified tag"
    task submodule, :tag do |t, args|
      if args[:tag]
        update_submodule(SUBMODULES[submodule], args[:tag])
      else
        puts "Please specify a tag, e.g: rake #{t}[#{SUBMODULES[submodule][:sample_version]}]"
      end
    end
  end

  desc "Update assets"
  task :assets do
    # git submodule add https://github.com/FortAwesome/Font-Awesome.git src/FortAwesome/Font-Awesome/
    # git submodule add https://github.com/scottjehl/Respond.git src/scottjehl/Respond
    # git submodule add https://github.com/twbs/bootstrap-sass.git src/twbs/bootstrap-sass

    puts 'Preparing destination folders...'
    remove_content_from_destination_folders

    puts 'Copying new assets...'
    copy_source_files_to_destination_folders

    puts 'Adding respond.js...'
    FileUtils.cp File.expand_path('src/scottjehl/Respond/src/respond.js'), File.expand_path('vendor/assets/javascripts/respond.js')

    puts 'Updating font paths...'
    update_fontawesome_paths
    update_glyphicons_paths

    puts 'Disabling glyphicons...'
    disable_glyphicons

    puts 'Done. RUN TESTS NOW!'
  end
end

private
def update_submodule(submodule, tag)
  return unless tag
  puts "Updating #{submodule[:name]} at #{tag}..."
  `cd #{submodule[:folder]} && exec git pull origin #{tag}`
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
  file_name = "#{DESTINATION_FOLDERS[:fontawesome_stylesheets]}/_path.scss"
  text = File.read(file_name)
  text.gsub! /url\(\'\#{$fa-font-path}\/([\w\-.#]+)[^\)]*\)/, "asset-url('\\1')"
  text.gsub! "fontawesome-webfont.eot') format('embedded-opentype')", "fontawesome-webfont.eot?\#iefix') format('embedded-opentype')"
  text.gsub! "asset-url('fontawesome-webfont.svg') format('svg');", "asset-url('fontawesome-webfont.svg#fontawesomeregular') format('svg');"
  text.gsub! "//  src: asset-url('FontAwesome.otf') format('opentype'); // used when developing fonts", ''
  File.open(file_name, 'w') { |file| file.puts text }
end

def update_glyphicons_paths
  icon_font_name = File.read("#{DESTINATION_FOLDERS[:bootstrap_stylesheets]}/_variables.scss").match(/$icon\-font\-name:\s+"([^\"]+)"/)[1]
  file_name = "#{DESTINATION_FOLDERS[:bootstrap_stylesheets]}/_glyphicons.scss"
  text = File.read(file_name)
  text.gsub! /~\"url\(\'@{icon-font-path}@{icon-font-name}(.*)\"/, "asset-url('#{icon_font_name}\\1"
  File.open(file_name, 'w') { |file| file.puts text }
end

def disable_glyphicons
  file_name = "#{DESTINATION_FOLDERS[:bootstrap_stylesheets]}/bootstrap.scss"
  text = File.read(file_name)
  text.gsub! "@import \"glyphicons\";\n", ''
  File.open(file_name, 'w') { |file| file.puts text }
end
