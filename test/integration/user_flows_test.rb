require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default

  end

  test "create user" do
   	visit "/users/new"
	  fill_in :user_name, :with => "example" 
  	click_button "Create User"
    after_create = path 
    click_link "Back"
    #assert_redirected_to(:controller => "users", :action => "show")
    find("tr", text: "example").click_link "Show"
    assert after_create == path 
    click_link "Back"
    page.assert_selector("tr", text: "example")
	end


  test "show user" do
    visit "/users"
    first(:link, "Show").click
    assert path == "/users/"
  end

  test "edit user" do
    visit "/users"
    first(:link, "Edit").click
    fill_in :user_name, :with => "name" 
    click_button "Update User"
    click_link "Back"
    assert find("tr", text: "name")
  end

  test "delete user" do
    visit "/users"
    first(:link, "Delete").click
    accept_alert()
    assert find("tr", text: "MyString")
   end


end
