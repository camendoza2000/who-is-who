module WelcomesHelper

	def row_count
		user_count = @users.count
		user_count % 4 == 0 ?  user_count / 4 : (user_count / 4) + 1	
	end

end