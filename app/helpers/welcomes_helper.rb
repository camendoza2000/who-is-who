module WelcomesHelper
	
	def how_much_rows
		user_count = @users.count 
		if user_count % 4 == 0
			return user_count / 4
		else
			return (user_count / 4) +1
		end
	end

end
