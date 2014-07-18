require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
   test "no name user" do
   	user = User.new
   	assert_not user.save, "Saved the user without name"
 	 end

   test "save user" do
    user = User.new
    assert user.new_record?, "User not saved"
   end

   test "delete user" do
    user = User.new
    user.destroy
    assert user.destroy, "User not deleted"
   end

   test "delete nonexistent user" do
   user = user.destroy
   
   end

   test "update user" do
   	user = User.new
   	assert user.update, "User not updated"
   end



end
