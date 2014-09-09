require 'test_helper'

class WelcomeFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
    #Capybara.javascript_driver = :poltergeist
  end

  def display_profile()
    visit("/welcomes")
    first('img.table_image').click
  end

  test "display" do
    display_profile()
    assert page.has_css?("div#photo-show", "div#profile-avatar")
    assert page.has_css?("div#photo-show", "div#profile-panel")
    assert page.has_text?("Thomas Harris")
    assert page.has_text?("Jackson, Tennessee, U.S.")
    assert page.has_text?("1940-03-11")
    assert page.has_text?("Baylor University")
    assert page.has_text?("English language")
    assert page.has_content?("web developer")
    assert page.has_content?("Make the lambs be quiet")
    assert page.has_content?("dance")
    image = page.find("#avatar")["src"]
    assert image.include? "missing.png"

    assert page.has_css?(".collapse", :count => 2)
    
    find("#expand-button-responsibilities").click
    sleep(1)
    within("div#responsibilities") do
      assert page.has_no_css?(".collapse")
    end

    find("#expand-button-interests").click
    sleep(1)
    within("div#interests") do
      assert page.has_no_css?(".collapse")
    end
  end

  
  test "back button" do
    display_profile()
    find("div#photo-show", :link, "button-back" ).click
    assert current_path == "/welcomes"
  end

   
end

