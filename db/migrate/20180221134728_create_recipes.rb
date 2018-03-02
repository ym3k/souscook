class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredient
      t.text :recipe
      t.string :photo
      t.text :memo
      t.string :extlink

      t.timestamps
    end
  end
end
