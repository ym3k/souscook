class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :article
      t.string :quantity

      t.timestamps
    end
    add_reference :ingredients, :recipe, foreign_key: true
  end
end
