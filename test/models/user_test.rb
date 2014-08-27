require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
  def update_user_(attribute, new_info)
    user = users(:howard)
    attribute = new_info
    user.save
    assert attribute == new_info
  end

  test "no name user" do 
    user = User.new
    assert_not user.save, "Saved the user without name"
  end

   test "save user" do 
    user = User.new
    user.name = "cosa"
    assert_not user.save, "User not saved"
   end

   test "delete user" do 
    counter_user = User.count
    user = users(:juan)
    user.save
    user.destroy
    assert counter_user -1 == User.count, "User not deleted" 
   end

   test "delete nonexistent user" do 
    counter_user = User.count
    no_user = User.new
    no_user.destroy
    assert counter_user == User.count, "User not deleted" 
   end


  test "update user name" do 
    update_user_("user.name", "new name")
  end

  test "update user email" do
    update_user_("user.email", "nuevo@mail.com")
  end

  test "update user birthplace" do
    update_user_("user.birthplace", "Colama, Colima, México")
  end  

  test "update user birthdate" do
    update_user_("user_birthdate", "2000-01-01")
  end

  test "update user institution" do
    update_user_("user.institution", "CNCI")
  end

  test "update user career" do
    update_user_("user.career", "Code writter")
  end

  test "update user position" do
    update_user_("user.position", "CEO")
  end

  test "update user responsibilities" do
    update_user_("user.responsibilities", "make coffe")
  end

end
