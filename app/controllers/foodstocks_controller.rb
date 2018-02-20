class FoodstocksController < ApplicationController
  before_action :set_foodstock, only: [:show, :edit, :update, :destroy]

  # GET /foodstocks
  # GET /foodstocks.json
  def index
    @foodstocks = Foodstock.all
  end

  # GET /foodstocks/1
  # GET /foodstocks/1.json
  def show
  end

  # GET /foodstocks/new
  def new
    @foodstock = Foodstock.new
  end

  # GET /foodstocks/1/edit
  def edit
  end

  # POST /foodstocks
  # POST /foodstocks.json
  def create
    @foodstock = Foodstock.new(foodstock_params)

    respond_to do |format|
      if @foodstock.save
        format.html { redirect_to @foodstock, notice: 'Foodstock was successfully created.' }
        format.json { render :show, status: :created, location: @foodstock }
      else
        format.html { render :new }
        format.json { render json: @foodstock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foodstocks/1
  # PATCH/PUT /foodstocks/1.json
  def update
    respond_to do |format|
      if @foodstock.update(foodstock_params)
        format.html { redirect_to @foodstock, notice: 'Foodstock was successfully updated.' }
        format.json { render :show, status: :ok, location: @foodstock }
      else
        format.html { render :edit }
        format.json { render json: @foodstock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foodstocks/1
  # DELETE /foodstocks/1.json
  def destroy
    @foodstock.destroy
    respond_to do |format|
      format.html { redirect_to foodstocks_url, notice: 'Foodstock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foodstock
      @foodstock = Foodstock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foodstock_params
      params.require(:foodstock).permit(:article, :quantity, :beforedate, :buyingdate)
    end
end
