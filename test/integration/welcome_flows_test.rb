require 'test_helper'

class WelcomeFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
    #Capybara.javascript_driver = :webkit
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

  test "user show name" do
    display_profile()
    assert page.has_text?("Thomas Harris")
    
    #assert page.has_text?("Jackson, Tennessee, U.S.")
    #assert page.has_text?("1940-03-11")
    #assert page.has_text?("Baylor University")
    #assert page.has_text?("English language")
    #assert page.has_content?("web developer")
    #assert page.has_content?("Make the lambs be quiet")
    #assert page.has_content?("dance")
    #image = page.find("#avatar")["src"]
    #assert image.include? "missing.png"
  end

  test "user show email" do
    display_profile()
    assert page.has_text?("TM@mail.com")
  end

  test "ShowHide responsibilities" do
    display_profile()
    find("#expand-button-responsibilities").click
    sleep(1)
    div_class = page.find("div#responsibilities")[:class]
    assert_not div_class == "colapse"
    find("#expand-button-responsibilities").click
    sleep(1)
    div_class = page.find("div#responsibilities")[:class]
    assert div_class == "colapse"
  end

  test "ShowHide interests" do
    display_profile()
    find("#expand-button-interests").click
    sleep(1)
    div_class = page.find("div#interests")[:class]
    assert_not div_class == "colapse"
    find("#expand-button-interests").click
    sleep(1)
    div_class = page.find("div#interests")[:class]
    assert div_class == "colapse"
  end

end

