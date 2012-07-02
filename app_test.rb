ENV["RACK_ENV"] ||= "test"

require_relative 'app'
require 'minitest/spec'
require 'minitest/autorun'
require "capybara/dsl"
require "capybara_minitest_spec"



describe "pages" do
  include Capybara::DSL
  Capybara.app = Sinatra::Application

  def must_show_menu
    within('.navbar') do
      page.must_have_link('About me')
      page.must_have_link("Gman Weekly")
      page.must_have_link("Powered by")
    end
  end

  it "must show the about page" do
    visit '/'
    page.must_have_content("Grant Speelman")
    must_show_menu
    page.must_have_content("Background")
    page.must_have_content("Connect with me")
  end

  it "must show the gman weekly page" do
    visit '/'
    click_link 'Gman Weekly'
    page.must_have_content("Gman Weekly")
    must_show_menu
  end

  it "must show the powered by page" do
    visit '/'
    click_link 'Powered by'
    page.must_have_content("Powered By")
    must_show_menu
    page.must_have_content("Running on")
    page.must_have_content("Hosted on")
    page.must_have_content("Built with")
  end

end
