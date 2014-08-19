require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :seleniun by default
  end


  def set_avatar(file_route = "app/assets/images/missing.png")
    attach_file "user_avatar", File.expand_path(file_route)
  end

  def set_date(d = "23", m = "June", y = 1912)
    page.select d, :from => "user_birthdate_3i"
    page.select m, :from => "user_birthdate_2i"
    page.select y, :from => "user_birthdate_1i"
  end

  def create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912)
    ensure_on_page("/users/new")
    set(:user_name, name)
    set(:user_email, email)
    set(:user_birthplace, birthplace)
    set_date(d,m,y)
    set(:user_institution, institution)
    set(:user_career, career)
    set(:user_position, position)
    set(:user_responsibilities, responsibility)
    set_avatar(file_route)
    click_button "Create User"
  end

  def ensure_on_page(route)
    visit route unless current_path == route
  end

  def set(x,y)
    fill_in x, :with => y
  end

  def edit_user(initial_name, to_change, new_param)
    create_user(initial_name)
    ensure_on_page("/users")
    find("tr", :text => initial_name).click_link("Edit")
    set(to_change, new_param)
    click_button "Update User"
    find("tr", :text => initial_name).click_link("Show")
    assert page.has_text? new_param
  end

  def firs_user_click_on(x)
    ensure_on_page("/users/")
    first(:link, x).click
  end

  test "user has name" do
    ensure_on_page("/users/")
    name = page.find("tr")["td"]
    firs_user_click_on("Show")
    assert page.has_content? name 
  end

  test "user has avatar" do
    firs_user_click_on("Show")
    image = page.find("img")["src"]
    assert image.include? "missing.png"
  end

  test "edit avatar" do
    ensure_on_page("/users/")
    firs_user_click_on("Edit")
    attach_file "user_avatar", File.expand_path("app/assets/images/slenderman.jpg")
    click_button "Update User"
    firs_user_click_on("Show")
    image = page.find("img")["src"]
    assert image.include? "slenderman.jpg"
  end

  test "edit user name" do
    firs_user_click_on("Edit")
    set(:user_name, "new name")
    set_avatar()
    click_button "Update User"
    find("tr", :text => "new name").click_link("Show")
    assert page.has_text?("name")
  end


  test "delete user" do
    firs_user_click_on("Delete")
    accept_alert()
    assert_not page.has_content?("User1")
   end

  test "user without avatar" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = nil, 
               d = "23", m = "June", y = 1912)
    assert page.assert_selector("div.field_with_errors")
  end

  test "no image attached" do
    create_user("no image", "public/system/test.txt")
    assert page.assert_selector("div.field_with_errors")
  end

  test "corrupted image" do
    create_user("false image", "public/system/false_image.png")
    assert page.assert_selector("div.field_with_errors")
  end

 
  test "create email" do
    create_user()
    assert page.has_content?("mail@coso.com")
  end

  test "change email" do
    edit_user("change email", :user_email, "punch@giraffes.net")
  end

  test "empty email" do
    create_user(name = "Alan Mathison Turing", email = nil, 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912)
    assert page.assert_selector("div.field_with_errors")
  end

  test "real email" do
   create_user(name = "Alan Mathison Turing", email = "no_email", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png")
   assert page.assert_selector("div.field_with_errors")
  end

  test "has birthplace" do
    create_user()
    assert page.has_text?(" Maida Vale, London, United Kingdom")
  end

  test "change birthplace" do
    edit_user("new birthplace", :user_birthplace, "Comala, Colima, México.")
  end

  test "empty birthplace" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = nil, 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912)
    assert page.assert_selector("div.field_with_errors")
  end

  test "has birthdate" do
    create_user()
    assert page.has_text?("1912-06-23")
  end

  test "change birthdate" do
    create_user("new birthdate")
    ensure_on_page("/users")
    find("tr", :text => "new birthdate").click_link("Edit")
    set_date(d=1, m="May", y=1920)
    click_button "Update User"
    find("tr", :text => "new birthdate").click_link("Show")
    assert page.has_text? "1920-05-01"
  end

  test "no actual date" do
    ensure_on_page("/users/new")
    set(:user_name, "name")
    set(:user_email, "email@email")
    set(:user_birthplace, "birthplace")
    set(:user_institution, "institution")
    set(:user_career, "career")
    set(:user_position, "position")
    set(:user_responsibilities, "responsibility")
    set_avatar()
    click_button "Create User"
    assert page.assert_selector("div.field_with_errors")
  end
  
  test "has institution" do
    create_user()
    assert page.has_text?("University of Manchester")
  end

  test "change institution" do
    edit_user("new institution", :user_institution, "UMSNH.")
  end

  test "empty institution" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = nil, 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912)
    assert page.assert_selector("div.field_with_errors")
  end

  test "has career" do
    create_user()
    assert page.has_text?("Mathematics")
  end

  test "change career" do
    edit_user("new career", :user_career, "Ing. en Sistemas.")
  end

  test "empty career" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = nil, 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912)
    assert page.assert_selector("div.field_with_errors")
  end

   test "create responsibilities" do
    create_user()
    assert page.has_content?("Be a great code writer")
  end

  test "change responsibilities" do
    edit_user("new responsibilities", :user_responsibilities, "punch giraffes")
  end

  test "empty responsibilities" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = nil, 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912)
    assert page.assert_selector("div.field_with_errors")
  end

 
end 


