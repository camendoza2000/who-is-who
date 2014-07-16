class UsersController < ApplicationController
  def new
    
  end

  def create
    # render plain: params[:user].inspect
    @user = User.new(params[:user])

    @user.save
    redirect_to @user
  end

  private
    def article_params
      params.require(:user).permit(:text)
    end
end
