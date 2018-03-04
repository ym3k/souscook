class RemoveIngredientFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :ingredient, :text
  end
end
