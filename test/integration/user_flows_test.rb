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
    find("tr", text: "example").click_link "Show"
    assert after_create == path
    click_link "Back"
    assert find("tr", text: "example")
    #assert_redirected_to(controller: "users", action: "show")
    #expect(current_path).to eq(user)
    #assert @user_name == "example", "name isn't right"

	end


  test "show user" do
    visit "/users"
    #click_link "Show"
    first(:link, "Show").click
    asser path == "/users/"
  end

  test "edit user" do
    visit "/users"
    #click_link "Edit"
    first(:link, "Edit").click
    fill_in :user_name, :with => "name" 
    click_button "Update User"
    click_link "Back"
    assert find("tr", text: "name")
  end

  test "delete user" do
    visit "/users"
    #click_link "Delete"
    first(:link, "Delete").click
    accept_alert()
    assert find("tr", text: "MyString")
   end


end
