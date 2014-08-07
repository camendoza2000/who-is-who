require 'test_helper'

class InterestTest < ActiveSupport::TestCase
=begin

	 test "empty interest" do 
    interest = Interest.new
    assert_not interest.save
  end

=end
   test "save interest" do 
    interest = Interest.new
    interest.name = "punch giraffes"
    assert interest.save
   end

   test "delete interest" do 
    counter_interest = Interest.count
    interest = interests(:one)
    interest.save
    interest.destroy
    assert counter_interest -1 == Interest.count
   end

   test "delete nonexistent interest" do 
    counter_interest = Interest.count
    no_saved_interest = Interest.new
    no_saved_interest.destroy
    assert counter_interest == Interest.count
   end


  test "update interest" do 
    interest = interests(:one)
    interest.name = "punch giraffes"
    interest.save
    assert interest.name == "punch giraffes"

  end

end
