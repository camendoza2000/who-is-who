require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
  end


  def set_name_avatar(name = "user", file_route = "app/assets/images/missing.png")
    fill_in :user_name, :with => name
    attach_file "user_avatar", File.expand_path(file_route)
  end

  def creation(name = "user", file_route = "app/assets/images/missing.png", 
                responsibility = "Be a great code writer",
                email = "mail@coso.com")
    ensure_on("/users/new")
    set_name_avatar(name, file_route)
    fill_in :user_responsibilities, :with => responsibility
    fill_in :user_emails, :with => email
    click_button "Create User"
  end

  def ensure_on(route)
    visit route unless current_path == route
  end

  test "user has name" do
    creation("user with name")
    assert page.has_content?("user with name") 
  end

  test "user has avatar" do
    creation("user with avatar")
    image = page.find("img")["src"]
    assert image.include? "missing.png"
  end

  test "edit avatar" do
    creation("avatar")
    ensure_on("/users")
    find("tr", :text => "avatar").click_link("Edit")
    attach_file "user_avatar", File.expand_path("app/assets/images/slenderman.jpg")
    click_button "Update User"
    find("tr", :text => "avatar").click_link("Show")
    image = page.find("img")["src"]
    assert_not image.include? "missing.png"
  end

  test "show user" do
    creation("showing user")
    assert page.has_text?("showing user") 
  end

  test "edit user name" do
    ensure_on("/users/")
    first(:link, "Edit").click
    set_name_avatar("name")
    fill_in :user_responsibilities, :with => "responsibility"
    fill_in :user_emails, :with => "email@coso.com"
    click_button "Update User"
    first(:link, "Show").click
    assert page.has_text?("name")
  end


  test "delete user" do
    ensure_on("/users/")
    first(:link, "Delete").click
    accept_alert()
    assert_not page.has_content?("User1")
   end

  test "user without avatar" do
    ensure_on("/users/new")
    fill_in :user_name, :with => "no avatar"
    click_button "Create User"
    assert page.assert_selector("div.field_with_errors")
  end

  test "no image attached" do
    creation("no image", "public/system/test.txt")
    assert page.assert_selector("div.field_with_errors")
  end

  test "corrupted image" do
    creation("false image", "public/system/false_image.png")
    assert page.assert_selector("div.field_with_errors")
  end

  test "create responsibilities" do
    creation()
    assert page.has_content?("Be a great code writer")
  end

  test "change responsibilities" do
    creation("change responsibilities")
    ensure_on("/users/")
    find("tr", :text => "change responsibilities").click_link("Edit")
    fill_in :user_responsibilities, :with => "punch giraffes"
    click_button "Update User"
    find("tr", :text => "change responsibilities").click_link("Show")
    assert page.has_text?("punch giraffes")
  end

  test "empty responsibilities" do
    ensure_on("/users/new")
    set_name_avatar()
    click_button("Create User")
    assert page.assert_selector("div.field_with_errors")
  end

  test "create email" do
    creation()
    assert page.has_content?("mail@coso.com")
  end

  test "change email" do
    creation("change email")
    ensure_on("/users/")
    find("tr", :text => "change email").click_link("Edit")
    fill_in :user_emails, :with => "punch@giraffes.net"
    click_button "Update User"
    find("tr", :text => "change email").click_link("Show")
    assert page.has_text?("punch@giraffes.net")
  end

  test "empty email" do
    ensure_on("/users/new")
    set_name_avatar()
    fill_in :user_responsibilities, :with => "responsibility"
    click_button("Create User")
    assert page.assert_selector("div.field_with_errors")
  end

end 


