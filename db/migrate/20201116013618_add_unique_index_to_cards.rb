class AddUniqueIndexToCards < ActiveRecord::Migration
  def change
    add_index :cards, [:name, :deck_id], unique: true
  end
end
