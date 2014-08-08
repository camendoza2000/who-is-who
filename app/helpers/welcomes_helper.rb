module WelcomesHelper

	def row_count
		user_count = @users.count
		user_count % 7 == 0 ?  user_count / 7 : (user_count / 7) + 1	
	end

end