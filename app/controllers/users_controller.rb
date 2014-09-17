class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    @interest = @user.interests.build
  end

  def create
    
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    
  end

  def index
    if params[:interests_ids].present?
      @users = User.find(get_user_id(params[:interests_ids]))
    else
      @users = User.all 
    end
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  def get_user_id(arr)
    user_Id = []
    Interest.find(arr).each do |i|
      user_Id.push(i.user_id)
    end
    user_Id
  end



  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :avatar, :responsibilities, :email, :birthplace,
                     :birthdate, :institution, :career, :position, interests_attributes: [:id, :name])
    end
end
