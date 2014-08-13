class InterestsController < ApplicationController
	before_action :set_interest, only: [:show, :edit, :update, :destroy]

  def new
    @interest = Interest.new
  end

  def create
    
    @interest = Interest.new(interest_params)

    if @interest.save
      redirect_to @interest
    else
      render "new"
    end
  end

  def show
    
  end

  def index
    @interests = Interest.all 
  end

  def edit
    
  end

  def update
    if @interest.update(interest_params)
      redirect_to interests_path
    else
      render "edit"
    end
  end

  def destroy
    @interest.destroy

    redirect_to interests_path
  end

  private
    def set_interest
      @interest = Interest.find(params[:id])
    end

    def interest_params
      params.require(:interest).permit(:name, :avatar, :responsibilities)
    end
end



