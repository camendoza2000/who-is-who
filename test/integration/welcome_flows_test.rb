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

end
