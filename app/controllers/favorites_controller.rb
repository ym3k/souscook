
class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(recipe_id: params[:recipe_id])
    redirect_to recipes_url, notice: "#{favorite.recipe.title}をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(recipe_id: params[:recipe_id]).destroy
    redirect_to recipes_url, notice: "#{favorite.recipe.title}をお気に入り解除しました"
  end
end