require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
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
    user = users(:howard)
    user.name = "new name"
    user.save
    assert user.name == "new name"
  end

  test "update user email" do
    user = users(:howard)
    user.email = "nuevo@mail.com"
    user.save
    assert user.email == "nuevo@mail.com"
  end

  test "update user birthplace" do
    user = users(:howard)
    user.birthplace = "Colama, Colima, México"
    user.save
    assert user.birthplace == "Colama, Colima, México"
  end  

  test "update user birthdate" do
    user = users(:howard)
    user.birthdate = 2000-01-01
    user.save
    assert user.birthdate == 2000-01-01
  end

  test "update user institution" do
    user = users(:howard)
    user.institution = "CNCI"
    user.save
    assert user.institution == "CNCI"
  end

  test "update user career" do
    user = users(:howard)
    user.career = "Code writter"
    user.save
    assert user.career == "Code writter"
  end

  test "update user position" do
    user = users(:howard)
    user.position = "CEO"
    user.save
    assert user.position == "CEO"
  end

  test "update user responsibilities" do
    user = users(:howard)
    user.responsibilities = "make coffe"
    user.save
    assert user.responsibilities == "make coffe"
  end

end
