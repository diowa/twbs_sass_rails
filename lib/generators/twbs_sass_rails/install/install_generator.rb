module TwbsSassRails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc 'This generator installs Bootstrap to Asset Pipeline'

      def copy_js_assets
        copy_or_insert_into_asset 'app/assets/javascripts/application.js', "//= require twbs/bootstrap\n", after: "jquery_ujs\n"
      end

      def copy_css_assets
        copy_or_insert_into_asset 'app/assets/stylesheets/application.css', " *= stub twbs-variables\n *= require twbs\n", before: " *= require_tree .\n"
      end

      def copy_bootstrap
        copy_file 'twbs.js.coffee',      'app/assets/javascripts/twbs.js.coffee'
        copy_file 'twbs-variables.scss', 'app/assets/stylesheets/twbs-variables.scss'
        copy_file 'twbs.scss',           'app/assets/stylesheets/twbs.scss'
      end

      private

      def copy_or_insert_into_asset(manifest, *insert_into_file_params)
        if File.exist?(File.join(destination_root, manifest))
          insert_into_file manifest, *insert_into_file_params
        else
          copy_file File.basename(manifest), manifest
        end
      end
    end
  end
end
