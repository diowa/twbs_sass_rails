require 'test_helper'

describe "twbs sass rails integration" do
  it "does not include icons by default" do
    visit '/assets/default-twbs.css'
    page.text.wont_include 'Glyphicons Halflings'
    page.text.wont_include 'FontAwesome'
  end

  it "provides Bootstrap stylesheets on the asset pipeline" do
    visit '/assets/application.css'
    page.text.must_include 'MIT License'
  end

  it "provides Bootstrap javscripts on the asset pipeline" do
    visit '/assets/application.js'
    page.text.must_include '* Bootstrap'
  end

  it "provides Respond.js on the asset pipeline" do
    visit '/assets/respond.js'
    page.text.must_include 'Respond.js'
  end

  it "provides Font Awesome on the asset pipeline" do
    visit '/assets/fontawesome-webfont.eot'
    visit '/assets/fontawesome-webfont.svg'
    visit '/assets/fontawesome-webfont.ttf'
    visit '/assets/fontawesome-webfont.woff'
  end

  it "provides Glyphicons on the asset pipeline" do
    visit '/assets/glyphicons-halflings-regular.eot'
    visit '/assets/glyphicons-halflings-regular.svg'
    visit '/assets/glyphicons-halflings-regular.ttf'
    visit '/assets/glyphicons-halflings-regular.woff'
  end
end
