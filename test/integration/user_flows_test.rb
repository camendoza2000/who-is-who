require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default

  end

  test "create user" do
  #	counter_user = User.count
  	visit "/users/new"
  	fill_in :user_name, :with => "example"
  	click_button "Create User"
  #	assert counter_user + 1 == User.count
  end

end