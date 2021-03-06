# frozen_string_literal: true

require 'test_helper'

describe 'twbs sass rails integration' do
  it 'does not include icons by default' do
    visit '/assets/default-twbs.css'
    _(page.text).wont_include 'Glyphicons Halflings'
    _(page.text).wont_include 'FontAwesome'
  end

  it 'provides Bootstrap stylesheets on the asset pipeline' do
    visit '/assets/application.css'
    _(page.text).must_include 'MIT License'
  end

  it 'provides Bootstrap javscripts on the asset pipeline' do
    visit '/assets/application.js'
    _(page.text).must_include '* Bootstrap'
  end

  it 'provides Respond.js on the asset pipeline' do
    visit '/assets/respond.js'
    _(page.text).must_include 'Respond.js'
  end

  it 'provides Font Awesome on the asset pipeline' do
    visit '/assets/fontawesome-webfont.eot'
    visit '/assets/fontawesome-webfont.svg'
    visit '/assets/fontawesome-webfont.ttf'
    visit '/assets/fontawesome-webfont.woff'
    visit '/assets/fontawesome-webfont.woff2'
  end

  it 'provides Glyphicons on the asset pipeline' do
    visit '/assets/glyphicons-halflings-regular.eot'
    visit '/assets/glyphicons-halflings-regular.svg'
    visit '/assets/glyphicons-halflings-regular.ttf'
    visit '/assets/glyphicons-halflings-regular.woff'
    visit '/assets/glyphicons-halflings-regular.woff2'
  end
end
