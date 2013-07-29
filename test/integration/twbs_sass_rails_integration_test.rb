require 'test_helper'

describe "twbs sass rails integration" do
  it "provides bootstrap stylesheet on the asset pipeline" do
    visit '/assets/bootstrap.css'
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
    visit '/assets/glyphiconshalflings-regular.eot'
    visit '/assets/glyphiconshalflings-regular.svg'
    visit '/assets/glyphiconshalflings-regular.ttf'
    visit '/assets/glyphiconshalflings-regular.woff'
  end
end
