require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "should not save user without name" do
   	user = User.new
   	assert_not user.save, "Saved the user without name"
 	 end

   test "ahouls report error" do
    # some_undefines_variable is not defined elsewhere in the test case
    some_undefines_variable
    assert true
   end
end

class User < ActiveRecord::Base
  validates :name, presence: true
end