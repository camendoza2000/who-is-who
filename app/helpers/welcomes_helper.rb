module WelcomesHelper

	def row_count
		user_count = @users.count
		user_count % 6 == 0 ?  user_count / 6 : (user_count / 6) + 1	
	end

	def search_interest_by_ID(id)
		
	end

end