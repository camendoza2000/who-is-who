module WelcomesHelper
	
	def row_count
		user_count = @users.count 
		if user_count % 4 == 0
			user_count / 4
		else
			(user_count / 4) +1
		end
	end

end
