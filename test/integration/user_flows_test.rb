require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
  end


  def set_name_avatar(name = "user", file_route = "app/assets/images/missing.png")
    fill_in :user_name, :with => name
    attach_file "user_avatar", File.expand_path(file_route)
  end


  test "create user" do
    visit "/users/new"
    set_name_avatar("example")
    click_button "Create User"
    assert page.has_content?("example") 

  end


 test "show user" do
    visit "/users"
    page.all("a")[-4].click
    assert page.has_text?("example") 
  end


  test "edit user" do
    visit "/users"
    first(:link, "Edit").click
    set_name_avatar("name")
    click_button "Update User"
    first(:link, "Show").click
    assert page.has_text?("name")
  end


  test "delete user" do
    visit "/users"
    first(:link, "Delete").click
    accept_alert()
    assert_not page.has_content?("User1")
   end

=begin
  test "change avatar" do
    visit "/users/new"
    set_name_avatar()
    click_button "Create User"
    initial_avatar = 
    click_link "Edit"
    attach_file "user_avatar", File.expand_path("app/assets/images/slender_man.jpg")    
    click_button "Update User"
    page.all("a")[-4].click 
    assert_not initial_avatar == 
  end
=end

=begin
  test "user without avatar" do
    visit "/users/new"
    set_name_avatar(name = "no avatar", file_route = )
    fill_in :user_name, :with => "no avatar"     
    click_button "Create User"
    assert page.has_content?("Missing")
  end

  test "no image avatar" do
    visit "/users/new"
    set_name_avatar("no avatar", "app/assets/images/test.txt")
    click_button ("Create User")
  end
=end

  test "user without avatar" do
    visit "/users/new"
    fill_in :user_name, :with => "no avatar"
    click_button "Create User"
    assert page.assert_selector("div.field_with_errors")
  end

  test "no image attached" do
    visit "/users/new"
    set_name_avatar("no image", "app/assets/test.txt")
    click_button "Create User"
    assert page.assert_selector("div.field_with_errors")
  end

  test "corrupted image" do
    visit "/users/new"
    set_name_avatar("false image", "app/assets/false_image.png")
    click_button "Create User"
    assert page.assert_selector("div.field_with_errors")
  end

end 


