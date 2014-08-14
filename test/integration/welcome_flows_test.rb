require 'test_helper'

class WelcomeFlowsTest < ActionDispatch::IntegrationTest
	setup do
		Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
  end

  def ensure_on(route)
    visit route unless current_path == route
  end

  def display_perfil()
  	ensure_on("/welcomes")
  	first('img.table_image').click
 	end

 	test "display avatar" do
 		display_perfil()
 		image = find("div#profile-avatar").find("img")["src"]
    assert image.include? "missing.png"
 	end

 	test "display name" do
 		display_perfil()
 		assert page.has_content?("User1") 
 	end

 	test "back button" do
 		display_perfil()
 		click_button("Back")
 		assert current_path == "/welcomes"
 	end

end
