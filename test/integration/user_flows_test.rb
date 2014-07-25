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

  test "create user" do
    creation()
   	#visit "/users/new"
	  #fill_in :user_name, :with => "example" 
  	#click_button "Create User"
    #after_create = path 
    #click_link "Back"
    #assert_redirected_to(:controller => "users", :action => "show")
    #find("tr", :text => "example").click_link "Show"
    #click_link "Back"
    #assert page.has_text?("waaaaaaaaaaaaa"), "hola"
    assert page.has_content?("example") 
    #assert after_create == path 
	end

  test "check user" do
    creation()
    click_link "Back"
    assert page.has_content?("example") 
  end


  test "show user" do
    visit "/users"
    #show_link = first("a", :text => "Show")
    first(:link, "Show").click
    #show_link = path 
    #assert path == show_link
    #page.assert_selector("p", :text => "Nombre: cosa", :visible => true)
    assert page.has_text?("My") 
  end

  test "edit user" do
    visit "/users"
    first(:link, "Edit").click
    fill_in :user_name, :with => "name" 
    click_button "Update User"
    click_link "Back"
    assert page.assert_selector("td",:text => "name", :visible => true)
  end

  test "delete user" do
    visit "/users"
    first(:link, "Delete").click
    accept_alert()
    assert find("tr", text: "MyString")
   end
end


