require 'test_helper'

describe "assets precompile in production environment integration" do
  FileUtils::rm_rf 'test/dummy/public/assets'
  system 'cd test/dummy && RAILS_ENV=production rake assets:precompile'

  it "provides respond.js" do
    visit "/assets/#{get_asset_name('respond','js')}"
  end

  it "provides fontawesome" do
    ['eot', 'svg', 'ttf', 'woff'].each do |fmt|
      font_file = get_asset_name('fontawesome-webfont', fmt)
      # NOTE: Rails 3 skips fingerprint when asset has parameters.
      font_file = 'fontawesome-webfont.svg' if Rails.version.start_with?('3')
      visit "/assets/#{font_file}"
      visit "/assets/#{get_asset_name('application', 'css')}"
      page.text.must_include font_file
      page.text.must_include "#{font_file}?\#iefix" if fmt == 'eot' && Rails.version.start_with?('4')
    end
  end

  it "provides glyphicons" do
    ['eot', 'svg', 'ttf', 'woff'].each do |fmt|
      font_file = get_asset_name('glyphiconshalflings-regular', fmt)
      # NOTE: Rails 3 skips fingerprint when asset has parameters.
      font_file = 'glyphiconshalflings-regular.svg' if Rails.version.start_with?('3')
      visit "/assets/#{font_file}"
      visit "/assets/#{get_asset_name('application', 'css')}"
      page.text.must_include font_file
      page.text.must_include "#{font_file}?\#iefix" if fmt == 'eot' && Rails.version.start_with?('4')
    end
  end

  it "overrides Bootstrap variables" do
    visit "/assets/#{get_asset_name('application', 'css')}"
    page.text.must_include 'color: #d10d10;'
  end

  it "overrides Bootstrap variables in user stylesheets" do
    visit "/assets/#{get_asset_name('application', 'css')}"
    page.text.must_include '.test-class { color: #d10d10; }'
  end

  private
  def get_asset_name(asset_name, asset_ext)
    Dir::glob("test/dummy/public/assets/#{asset_name}-*.#{asset_ext}").first.split('/').last
  end
end
