require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default

  end

  test "create user" do
   	visit "/users/new"
	  fill_in :user_name, :with => "example" 
  	click_button "Create User"
    click_link "Back"
  	assert counter_user + 1 == User.count
  end


  test "show user" do
    visit "/users"
    #click_link "Show"
    first(:link, "Show").click
  end

  test "edit user" do
    visit "/users"
    #click_link "Edit"
    first(:link, "Edit").click
    fill_in :user_name, :with => "name" 
    click_button "Update User"
  end

  test "delete user" do
    visit "/users"
    #click_link "Delete"
    first(:link, "Delete").click
  end


end