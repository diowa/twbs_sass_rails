# frozen_string_literal: true

require 'test_helper'

describe 'assets precompile in production environment integration' do
  FileUtils.rm_rf 'test/dummy/public/assets'
  system 'cd test/dummy && RAILS_ENV=production rake assets:clean assets:precompile'

  it 'provides Respond.js' do
    visit "/assets/#{get_asset_name('respond', 'js')}"
  end

  it 'provides Font Awesome' do
    %w[eot svg ttf woff woff2].each do |fmt|
      font_file = get_asset_name('fontawesome-webfont', fmt)
      visit "/assets/#{font_file}"
      visit "/assets/#{get_asset_name('application', 'css')}"
      page.text.must_include font_file
      page.text.must_include "#{font_file}?\#iefix" if fmt == 'eot'
    end
  end

  it 'provides Glyphicons' do
    %w[eot svg ttf woff woff2].each do |fmt|
      font_file = get_asset_name('glyphicons-halflings-regular', fmt)
      visit "/assets/#{font_file}"
      visit "/assets/#{get_asset_name('application', 'css')}"
      page.text.must_include font_file
      page.text.must_include "#{font_file}?\#iefix" if fmt == 'eot'
    end
  end

  it 'overrides Bootstrap variables' do
    visit "/assets/#{get_asset_name('application', 'css')}"
    page.text.must_include 'color:#d10d10'
    page.text.must_include 'color:#89090a' # automatically generated hover
  end

  it 'overrides Bootstrap variables in user stylesheets' do
    visit "/assets/#{get_asset_name('application', 'css')}"
    page.text.must_include '.test-class{color:#d10d10}'
    page.text.must_include '.test-hover-class{color:#89090a}'
  end

  it 'allows to import mixins' do
    visit "/assets/#{get_asset_name('application', 'css')}"
    page.text.must_include '.subfolder{width:0;height:0}'
  end

  it 'sets Sass precision to 10' do
    visit "/assets/#{get_asset_name('application', 'css')}"
    page.text.must_include '0.1111111111em'
  end

  private

  def get_asset_name(asset_name, asset_ext)
    Dir.glob("test/dummy/public/assets/#{asset_name}-*.#{asset_ext}").first.split('/').last
  end
end
