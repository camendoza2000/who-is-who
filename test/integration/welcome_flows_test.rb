require 'test_helper'

class WelcomeFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
  end

  def display_profile()
    visit("/welcomes")
    first('img.table_image').click
  end

  test "display panel_div" do
    display_profile()
    assert page.has_css?("div#photo-show", "div#profile-avatar")
  end


  test "display avatar_div" do
    display_profile()
    assert page.has_css?("div#photo-show","div#profile-avatar")
  end


  test "back button" do
    display_profile()
    find("div#photo-show", :link, "button-back" ).click
    assert current_path == "/welcomes"
  end

  test "user show attributes" do
    display_profile()
    assert page.has_text?("Thomas Harris")
    assert assert_text("TM@mail.com")
    assert page.has_text?("Jackson, Tennessee, U.S.")
    assert page.has_text?("1940-03-11")
    assert page.has_text?("Baylor University")
    assert page.has_text?("English language")
    assert page.has_content?("web developer")
    assert page.has_content?("Make the lambs be quiet")
    assert page.has_content?("dance")
    image = page.find("img")["src"]
    assert image.include? "missing.png"
  end

end

