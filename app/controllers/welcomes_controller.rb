class WelcomesController < ApplicationController
  before_action :set_welcome, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @interests = Interest.all
  end

	

	# def grid 
		# if @filtred_users 
			# 
		# end
	# end

end
