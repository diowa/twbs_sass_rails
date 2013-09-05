require 'test_helper'

describe "twbs sass rails integration" do
  it "does not default to glyphicons" do
    visit '/assets/default-twbs.css'
    page.text.wont_include 'Glyphicons Halflings'
  end

  it "provides bootstrap stylesheet on the asset pipeline" do
    visit '/assets/application.css'
    page.text.must_include '* Bootstrap'
  end

  it "provides bootstrap javscript on the asset pipeline" do
    visit '/assets/application.js'
    page.text.must_include '* Bootstrap'
  end

  it "provides respond.js on the asset pipeline" do
    visit '/assets/respond.js'
    page.text.must_include 'Respond.js'
  end

  it "provides fontawesome on the asset pipeline" do
    visit '/assets/fontawesome-webfont.eot'
    visit '/assets/fontawesome-webfont.svg'
    visit '/assets/fontawesome-webfont.ttf'
    visit '/assets/fontawesome-webfont.woff'
  end

  it "provides glyphicons on the asset pipeline" do
    visit '/assets/glyphicons-halflings-regular.eot'
    visit '/assets/glyphicons-halflings-regular.svg'
    visit '/assets/glyphicons-halflings-regular.ttf'
    visit '/assets/glyphicons-halflings-regular.woff'
  end
end
