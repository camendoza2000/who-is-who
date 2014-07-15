class WellcomesController < ApplicationController
  before_action :set_wellcome, only: [:show, :edit, :update, :destroy]

  # GET /wellcomes
  # GET /wellcomes.json
  def index
    @wellcomes = Wellcome.all
  end

  # GET /wellcomes/1
  # GET /wellcomes/1.json
  def show
  end

  # GET /wellcomes/new
  def new
    @wellcome = Wellcome.new
  end

  # GET /wellcomes/1/edit
  def edit
  end

  # POST /wellcomes
  # POST /wellcomes.json
  def create
    @wellcome = Wellcome.new(wellcome_params)

    respond_to do |format|
      if @wellcome.save
        format.html { redirect_to @wellcome, notice: 'Wellcome was successfully created.' }
        format.json { render :show, status: :created, location: @wellcome }
      else
        format.html { render :new }
        format.json { render json: @wellcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wellcomes/1
  # PATCH/PUT /wellcomes/1.json
  def update
    respond_to do |format|
      if @wellcome.update(wellcome_params)
        format.html { redirect_to @wellcome, notice: 'Wellcome was successfully updated.' }
        format.json { render :show, status: :ok, location: @wellcome }
      else
        format.html { render :edit }
        format.json { render json: @wellcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wellcomes/1
  # DELETE /wellcomes/1.json
  def destroy
    @wellcome.destroy
    respond_to do |format|
      format.html { redirect_to wellcomes_url, notice: 'Wellcome was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wellcome
      @wellcome = Wellcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wellcome_params
      params[:wellcome]
    end
end
