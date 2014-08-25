class InterestsController < ApplicationController

	def create
		@user = User.find(params[:user_id])	
		@interest = @user.interests.create(interest_params)
	end

	def index
	end

	private
		def interest_params
			params.require(:interest).permit(:name)
			
		end
end
