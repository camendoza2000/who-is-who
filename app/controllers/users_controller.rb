class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # render plain: params[:user].inspect
    @user = User.new(user_params)

    @user.save
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    
  end

  


  private
    def user_params
      params.require(:user).permit(:name)
    end
end
