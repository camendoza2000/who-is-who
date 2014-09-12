class WelcomesController < ApplicationController
  before_action :set_welcome, only: [:show, :edit, :update, :destroy]

  # GET /welcomes
  # GET /welcomes.json
  def index
    @users = User.all
    @interests = Interest.all
  end

	def get_user_id(arr)
		user_Id = []
		@interests.find(arr).each do |i|
			user_Id.push(i.user_id)
		end
	end

	def filter_by_interests(ids)
		@filtred_users = User.find(get_user_id(interestsArr))

		
	end

end
