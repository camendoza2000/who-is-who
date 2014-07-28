require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
  test "no name user" do 
    user = User.new
    assert_not user.save, "Saved the user without name"
  end

   test "save user" do 
    user = User.new
    user.name = "cosa"  
    assert user.save, "User not saved"
   end

   test "delete user" do 
    counter_user = User.count
    user = users(:one)
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


  test "update user" do 
    user = users(:one)
    user.name = "hi"
    user.save
    assert user.name == "hi", "User don't update" 

  end

end
