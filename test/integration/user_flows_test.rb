require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
  end


  def set_name_avatar()
    fill_in :user_name, :with => "example" 
    attach_file "user_avatar", File.expand_path("app/assets/images/missing.png")
  end


  test "create user" do
    visit "/users/new"
    set_name_avatar()
    click_button "Create User"
    assert page.has_content?("example") 

  end

  

  test "show user" do
    visit "/users"
    first(:link, "Show").click
    assert page.has_text?("example") 
  end


  test "edit user" do
    visit "/users"
    first(:link, "Edit").click
    set_name_avatar()
    click_button "Update User"
    first(:link, "Show").click
    assert page.has_text?("example")
  end


  test "delete user" do
    visit "/users"
    first(:link, "Delete").click
    accept_alert()
    assert_not page.has_content?("User1")
   end


end


