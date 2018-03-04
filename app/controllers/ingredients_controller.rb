class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :set_login

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.recipe_id = current_recipe.id

    unless @ingredient.save
      render :new
    end
  end

  def update
    unless @ingredient.update(ingredient_params)
      render :edit
    end
  end

  def edit
  end

  def destroy
    @ingredient.destroy
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def set_login
      if !logged_in?
        redirect_to new_session_path
      end
    end

    def ingredient_params
      params.require(:ingredient).permit(:article, :quantity, :recipe_id)
    end
end
