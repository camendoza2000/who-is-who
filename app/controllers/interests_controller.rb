class InterestsController < ApplicationController

	def create
		@user = User.find(params[:user_id])	
		@interest = @user.interests.create(comment_params)
		refirect_to user_path(@user)
	end

	def index
		
	end

	private
		def comment_params
			params.require(:interest).permit(:name)
			
		end
end
