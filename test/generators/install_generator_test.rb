require 'test_helper'

class InstallGeneratorTest < ::Rails::Generators::TestCase
  tests TwbsSassRails::Generators::InstallGenerator

  destination File.expand_path('../../tmp', File.dirname(__FILE__))
  setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator
    assert_file 'app/assets/stylesheets/application.css'
    assert_file 'app/assets/stylesheets/twbs.css.less'
    assert_file 'app/assets/javascripts/application.js'
    assert_file 'app/assets/javascripts/twbs.js.coffee'
  end

  test "Assert existing application.css properly requires bootstrap" do
    copy_default_asset 'application.css', 'stylesheets'
    run_generator
    assert_file 'app/assets/stylesheets/application.css', /^ \*\= require twbs$/
  end

  test "Assert existing application.js properly requires bootstrap" do
    copy_default_asset 'application.js', 'javascripts'
    run_generator
    assert_file 'app/assets/javascripts/application.js', /^\/\/\= require twbs\/bootstrap$/
  end

  def copy_default_asset(asset_name, asset_dir)
    asset = File.expand_path("default_rails_assets/#{asset_name}", File.dirname(__FILE__))
    destination = File.join(destination_root, "app/assets/#{asset_dir}")

    FileUtils.mkdir_p(destination)
    FileUtils.cp asset, destination
  end
end
