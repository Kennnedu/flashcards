class AddDeckToCards < ActiveRecord::Migration[5.0]
  def change
    add_reference :cards, :deck, foreign_key: true, null: false
  end
end
