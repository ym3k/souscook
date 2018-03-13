class RecipesController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'uri'

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_login, only: [:new, :edit, :show, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new(new_recipe_params)
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(update_recipe_params)
      #if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def set_login
      if !logged_in?
        redirect_to new_session_path
      end
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :recipe, :photo, :memo, :extlink, ingredients_attributes: [:article, :quantity])
    end

    def update_recipe_params
      params.require(:recipe).permit(:title, :recipe, :photo, :memo, :extlink, ingredients_attributes: [:article, :quantity, :_destroy, :id])
    end

    def new_recipe_params
      new_param = params.permit(:extlink)
      unless new_param['extlink'].blank? 
        get_recipe_from_cookpad(new_param['extlink'], new_param)
        new_param
      else
        return nil 
      end
    end

    def get_recipe_from_cookpad(extlink, params)
      url = URI.escape(extlink)
      charset = nil
  
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      doc = Nokogiri::HTML.parse(html, nil, charset)
      params['title'] = doc.xpath('//div[@id="recipe-title"]').text.gsub(/\n/, '')
      params['memo']  = doc.xpath('//div[@class="description_text"]').text.gsub(/\n/, '')
      params['photo'] = doc.xpath('//div[@id="main-photo"]').search('img')[0].attributes['src'].value

      ingredients_list = doc.xpath('//div[@id="ingredients_list"]')
      ing_art = ingredients_list.search('div[@class="ingredient_name"]').map { |art|
        art.text.gsub(/\n/, '')
      }
      ing_qty = ingredients_list.search('div[@class="ingredient_quantity amount"]').map { |qty|
        qty.text.gsub(/\n/, '')
      }
      params['ingredients_attributes'] = ing_art.zip(ing_qty).map {|ing_set| 
        {
          :article => ing_set[0],
          :quantity => ing_set[1]
        }
      }
    end

end
