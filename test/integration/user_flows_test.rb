require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
  end


  def creation()
    visit "/users/new"
    fill_in :user_name, :with => "example" 
    click_button "Create User"
  end

  def edit_user()
    first(:link, "Edit").click
    fill_in :user_name, :with => "name" 
    click_button "Update User"
    assert page.has_text?("name")
  end

  test "create user" do
    creation()
    assert page.has_content?("example") 

  end

  test "check user" do
    creation()
    click_link "Back"
    assert page.has_content?("example") 
  end


  test "show user" do
    visit "/users"
    first(:link, "Show").click
    assert page.has_text?("name") 
  end

  test "edit user" do
    visit "/users"
    edit_user()
  end

  test "delete user" do
    visit "/users"
    first(:link, "Delete").click
    accept_alert()
    assert_not page.has_content?("User1")
   end

  test "prueba" do
    visit "/users"
    first(:link, "Show").click
    edit_user()
  end

end


