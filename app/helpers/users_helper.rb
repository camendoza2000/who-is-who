module UsersHelper

	def interests_row_count
		interest_count = @interests.count
		interest_count % 2 == 0 ?  interest_count / 2 : (interest_count / 2) + 1	
	end

end
