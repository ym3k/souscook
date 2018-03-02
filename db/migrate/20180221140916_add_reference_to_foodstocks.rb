class AddReferenceToFoodstocks < ActiveRecord::Migration[5.1]
  def change
    add_reference :foodstocks, :user, foreign_key: true
    add_reference :foodstocks, :unit, foreign_key: true
  end
end
