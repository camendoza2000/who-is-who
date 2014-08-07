require 'test_helper'

class InterestTest < ActiveSupport::TestCase

	 test "no name interest" do 
    interest = Interest.new
    assert_not interest.save, "Saved the interest without name"
  end

   test "save interest" do 
    interest = Interest.new
    interest.name = "cosa"
    assert interest.save, "Interest not saved"
   end

   test "delete interest" do 
    counter_interest = Interest.count
    interest = interests(:one)
    interest.save
    interest.destroy
    assert counter_interest -1 == Interest.count, "Interest not deleted" 
   end

   test "delete nonexistent interest" do 
    counter_interest = Interest.count
    no_interest = Interest.new
    no_interest.destroy
    assert counter_interest == Interest.count, "Interest not deleted" 
   end


  test "update interest" do 
    interest = interests(:one)
    interest.name = "hi"
    interest.save
    assert interest.name == "hi", "Interest don't update" 

  end

end
