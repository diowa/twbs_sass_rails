require 'rails/generators'

module Twbs
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)
      desc "This generator installs Bootstrap to Asset Pipeline"

      def add_assets
        js_manifest = 'app/assets/javascripts/application.js'
        if File.exist?(js_manifest)
          insert_into_file js_manifest, "//= require twitter/bootstrap\n", after: "jquery_ujs\n"
        else
          copy_file 'application.js', js_manifest
        end

        css_manifest = 'app/assets/stylesheets/application.css'
        if File.exist?(css_manifest)
          # Add our own require:
          content = File.read(css_manifest)
          if content.match(/require_tree\s+\.\s*$/)
            # Good enough - that'll include our bootstrap_and_overrides.css.less
          else
            style_require_block = " *= require bootstrap_and_overrides\n"
            insert_into_file css_manifest, style_require_block, after: "require_self\n"
          end
        else
          copy_file 'application.css', 'app/assets/stylesheets/application.css'
        end
      end

      def add_bootstrap
        copy_file 'bootstrap.js.coffee', 'app/assets/javascripts/bootstrap.js.coffee'
        copy_file 'bootstrap.css.less', 'app/assets/stylesheets/bootstrap.css.less'
      end

      def add_locale
      end

      def cleanup_legacy
      end
    end
  end
end
