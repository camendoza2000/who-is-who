class InterestsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @interest = @user.interests.create(interest_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @interests = @user.interests.find(params[:id])
    redirect_to user_path(@user)
  end


  private
  def interest_params
    params.require(:interest).permit(:name)
  end
end