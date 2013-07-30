require 'rails/generators'

module TwbsSassRails
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)
      desc "This generator installs Bootstrap to Asset Pipeline"

      def copy_assets
        # TODO application sees generator but doesn't run it
        js_manifest = 'app/assets/javascripts/application.js'
        if File.exist?(js_manifest)
          insert_into_file js_manifest, "//= require twbs/bootstrap\n", after: "jquery_ujs\n"
        else
          copy_file 'application.js', js_manifest
        end

        css_manifest = 'app/assets/stylesheets/application.css'
        if File.exist?(css_manifest)
          insert_into_file css_manifest, " *= require twbs\n", after: "require_self\n"
        else
          copy_file 'application.css', css_manifest
        end
      end

      def copy_bootstrap
        copy_file 'twbs.js.coffee', 'app/assets/javascripts/twbs.js.coffee'
        copy_file 'twbs.css.less', 'app/assets/stylesheets/twbs.css.less'
      end
    end
  end
end
