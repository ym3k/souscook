class FoodstocksController < ApplicationController
  before_action :set_foodstock, only: [:show, :edit, :update, :destroy]
  before_action :set_login, only: [:index, :new, :edit, :show, :destroy]

  # GET /foodstocks
  # GET /foodstocks.json
  def index
    @foodstocks = Foodstock.where(user_id: current_user.id)
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
    @foodstock.user_id = current_user.id

    respond_to do |format|
      if @foodstock.save
        format.html { redirect_to @foodstock, notice: '食材を登録しました。' }
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
        format.html { redirect_to @foodstock, notice: '食材情報を更新しました。' }
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
      format.html { redirect_to foodstocks_url, notice: '食材情報を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foodstock
      @foodstock = Foodstock.find(params[:id])
    end

    def set_login
      if !logged_in?
        redirect_to new_session_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foodstock_params
      params.require(:foodstock).permit(:article, :quantity, :beforedate, :buyingdate, :unit_id)
    end
end
