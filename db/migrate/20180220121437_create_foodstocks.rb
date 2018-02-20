class CreateFoodstocks < ActiveRecord::Migration[5.1]
  def change
    create_table :foodstocks do |t|
      t.string :article
      t.float :quantity
      t.date :beforedate
      t.date :buyingdate

      t.timestamps
    end
  end
end
