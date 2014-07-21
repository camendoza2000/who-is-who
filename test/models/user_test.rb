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
    count = User.count
    user = users(:one)
    user.save
    user.destroy
    assert count -1 == User.count, "User not deleted" 
   end

   test "delete nonexistent user" do 
    ids = []
    no_user = User.new
    for user in User.all
      assert no_user.id != user.id
    end
   end


     
    test "update user" do 
    user = users(:one)
    user.name = "hi"
    user.save
    assert user.name == "hi", "User don't update" 

   end

end
