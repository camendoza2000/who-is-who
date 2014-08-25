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
               d = "23", m = "June", y = 1912, 
               interest = "cooking" )
    ensure_on_page("/users/new")
    set(:user_name, name)
    set(:user_email, email)
    set(:user_birthplace, birthplace)
    set_date(d,m,y)
    set(:user_institution, institution)
    set(:user_career, career)
    set(:user_position, position)
    set(:user_responsibilities, responsibility)
    set("interests_name", interest)
    set_avatar(file_route)
    click_button "Create User"
  end

  def ensure_on_page(route)
    visit route unless current_path == route
  end

  def set(x,y)
    fill_in x, :with => y
  end

  def edit_user(to_change, new_param)
    user_click_on(name = "Howard Phillips Lovecraft", "Edit")
    set(to_change, new_param)
    set_avatar(file_route = "app/assets/images/missing.png")
    click_button "Update User"
    find("tr", :text => "Howard Phillips Lovecraft").click_link("Show")
    assert page.has_text? new_param
  end

  def user_click_on(name = "Stephen Edwin King", x)
    ensure_on_page("/users/")
    find("tr", :text => name).click_link(x)
  end

  test "user show attributes" do
    user_click_on("Show")
    assert page.has_content?("Stephen Edwin King")
    assert page.has_content?("SK@mail.com")
    assert page.has_text?(" Portland, Maine, US")
    assert page.has_text?("1947-09-21")
    assert page.has_text?("University of Maine")
    assert page.has_text?("Writer")
    assert page.has_content?("QA")
    assert page.has_content?("Writte scary code")
    assert page.has_content?("dance")
    image = page.find("img")["src"]
    assert image.include? "missing.png"
  end

  test "edit avatar" do
    create_user("edit avatar")
    ensure_on_page("/users/")
    user_click_on("edit avatar", "Edit")
    set_avatar(file_route = "app/assets/images/slenderman.jpg")
    click_button "Update User"
    ensure_on_page("/users/")
    user_click_on("edit avatar", "Show")
    image = page.find("img")["src"]
    assert image.include? "slenderman.jpg"
  end

  test "edit user name" do
    create_user("edit user name")
    ensure_on_page("/users/")
    user_click_on("edit user name", "Edit")
    set(:user_name, "Pedro Paramo")
    click_button "Update User"
    ensure_on_page("/users/")
    find("tr", :text => "Pedro Paramo").click_link("Show")
    assert page.has_text?("Pedro Paramo")
  end


  test "delete user" do
    user_click_on(name = "Thomas Harris", "Delete")
    accept_alert()
    assert_not page.has_content?("Thomas Harris")
   end

  test "user without avatar" do
    ensure_on_page("/users/new")
    set(:user_name, "name")
    set(:user_email, "email@email")
    set(:user_birthplace, "birthplace")
    set_date(d = "23", m = "June", y = 1912)
    set(:user_institution, "institution")
    set(:user_career, "career")
    set(:user_position, "position")
    set(:user_responsibilities, "responsibility")
    attach_file "user_avatar", nil
    click_button "Create User"
    assert page.assert_selector("div.field_with_errors")
  end

  test "no image attached" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "test/fixtures/test.txt", 
               d = "23", m = "June", y = 1912, 
               interest = "cooking" )   
    assert page.assert_selector("div.field_with_errors")
  end

  test "corrupted image" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "test/fixtures/false_image.png", 
               d = "23", m = "June", y = 1912, 
               interest = "cooking" )
    assert page.assert_selector("div.field_with_errors")
  end

 

  test "edit email" do
    edit_user(:user_email, "cthulhu@gmail.net")
  end

  test "empty email" do
    create_user(name = "Alan Mathison Turing", email = nil, 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912, 
               interest = "cooking" )
    assert page.assert_selector("div.field_with_errors")
  end

  test "real email" do
   create_user(name = "Alan Mathison Turing", email = "no_email", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               interest = "cooking" )
   assert page.assert_selector("div.field_with_errors")
  end


  test "edit birthplace" do
    edit_user(:user_birthplace, "Comala")
  end

  test "empty birthplace" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = nil, 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912, 
               interest = "cooking" )
    assert page.assert_selector("div.field_with_errors")
  end

  test "edit birthdate" do
    user_click_on(name = "Howard Phillips Lovecraft", "Edit")
    set_date(d=1, m="May", y=1920)
    set_avatar()
    click_button "Update User"
    user_click_on(name = "Howard Phillips Lovecraft", "Show")
    assert page.has_text? "1920-05-01"
  end

  test "no default date" do
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
  
  test "edit institution" do
    edit_user(:user_institution, "UMSNH.")
  end

  test "empty institution" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = nil, 
               career = "Mathematics", 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912, 
               interest = "cooking" )
    assert page.assert_selector("div.field_with_errors")
  end

  test "edit career" do
    edit_user(:user_career, "Ing. en Sistemas.")
  end

   test "empty career" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = nil, 
               position = "QA", 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912, 
               interest = "cooking" )
    assert page.assert_selector("div.field_with_errors")
  end

  test "edit position" do
    edit_user(:user_position, "HR")
  end

  test "empty position" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = nil, 
               responsibility = "Be a great code writer", 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912, 
               interest = "cooking" )
    assert page.assert_selector("div.field_with_errors")
  end

  #test "edit interest" do
  #  edit_user()
  #end

  

  test "edit responsibilities" do
    edit_user(:user_responsibilities, "punch giraffes")
  end

  test "empty responsibilities" do
    create_user(name = "Alan Mathison Turing", email = "mail@coso.com", 
               birthplace = " Maida Vale, London, United Kingdom", 
               institution = "University of Manchester", 
               career = "Mathematics", 
               position = "QA", 
               responsibility = nil, 
               file_route = "app/assets/images/missing.png", 
               d = "23", m = "June", y = 1912, 
               interest = "cooking" )
    assert page.assert_selector("div.field_with_errors")
  end

 
end 

