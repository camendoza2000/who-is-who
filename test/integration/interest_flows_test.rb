require 'test_helper'

class InterestFlowsTest < ActionDispatch::IntegrationTest
	setup do
		Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
	end

   def creation(name = "punch giraffes")
    ensure_on("/interests/new")
    fill_in :interest_name, :with => name
    click_button "Create Interest"
  end

	def ensure_on(route)
    visit route unless current_path == route
  end

  test "no empty interest" do
    creation("visit punching zoo")
    assert page.has_content?("visit punching zoo") 
  end

  test "show interest" do
    creation("punc rhinos")
    click_link "Back"
    find("tr", :text => "punc rhinos").click_link("Show")
    assert page.has_text?("punc rhinos") 
	end

	test "edit interest" do
    ensure_on("/interests/")
    first(:link, "Edit").click
    fill_in :interest_name, :with => "dance"
    click_button "Update Interest"
    first(:link, "Show").click
    assert page.has_text?("dance")
  end

  test "delete interest" do
    ensure_on("/interests/")
    first(:link, "Delete").click
    accept_alert()
    assert_not page.has_content?("Interest1")
   end


  
end
