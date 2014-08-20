require 'test_helper'

class WelcomeFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
  end

  def display_perfil()
    visit("/welcomes/")
    first('img.table_image').click
  end

  test "display panel_div" do
    display_perfil()
    #assert page.has_content?("User1") 
    assert page.has_selector?("div#profile-avatar")
  end


  test "display avatar_div" do
    display_perfil()
    #image = find("div#profile-avatar").find("img")["src"]
    assert page.has_selector?("div#profile-avatar")
  end


  test "back button" do
    display_perfil()
    click_button("Back")
    assert current_path == "/welcomes"
  end

end
